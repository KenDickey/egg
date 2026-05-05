#include "GarbageCollector.h"
#include "KnownObjects.h"
#include "Evaluator/Runtime.h"

#include <cstring>
#include <Evaluator/Evaluator.h>

using namespace Egg;

GarbageCollector::GarbageCollector(Runtime *runtime, AllocationZone *oldZone, GCHeap *heap) :
	_runtime(runtime),
	_oldZone(oldZone),
	_heap(heap)
{
}

bool GarbageCollector::checkEphemerons()
{
    auto done = true;
	while (!_uncheckedEphemerons->empty())
    { 
        HeapObject *ephemeron = _uncheckedEphemerons->back();
        _uncheckedEphemerons->pop_back();
		if (this->checkReachablePropertyOf_(ephemeron))
        {
            this->followEphemeronWeaks_(ephemeron);
			done = false;
        }
        else
            _unreachedEphemerons->push_back(ephemeron);
    }
    return done;
}

void GarbageCollector::collect()
{
	this->initializeLocals();
	this->doCollect();
	this->releaseLocals();
}

void GarbageCollector::doCollect()
{
    this->followRoots();
    this->strengthenAndMigrateEphemerons();
    this->scanWeakContainers();
}

void GarbageCollector::followEphemerons()
{
    bool done;
	do {
        this->followLiveEphemerons();
		done = this->rescueUnreachableEphemerons();
    } while (!done);
}

void GarbageCollector::followEphemeronWeaks_(HeapObject *ephemeron)
{
	this->scan_from_to_(ephemeron, 1, ephemeron->size());
	this->followClosure();
}

void GarbageCollector::followLiveEphemerons()
{
    bool done;
	do {
		done = this->checkEphemerons();
        if (done)
            break;
        this->swapUncheckedWithUnreached();
    } while (true);
}

void GarbageCollector::followRoots()
{
	//this->scanStack_(_activeStack);
	this->scanCurrentContext();
    //this->scanThreadLocalStorages();
    this->followClosure();
    this->followEphemerons();
}

void GarbageCollector::initializeLocals()
{
    auto size = this->initialContainerCapacity();

	_weakContainers = new std::vector<HeapObject*>();
	_uncheckedEphemerons = new std::vector<HeapObject*>();
	_unreachedEphemerons = new std::vector<HeapObject*>();
	_rescuedEphemerons = new std::vector<HeapObject*>();
	_stacks = new std::vector<HeapObject*>();

    _weakContainers->reserve(size);
	_uncheckedEphemerons->reserve(size);
	_unreachedEphemerons->reserve(size);
	_rescuedEphemerons->reserve(size);
	_stacks->reserve(size);
}

void GarbageCollector::heap_(GCHeap *aGCHeap)
{
	_heap = aGCHeap;
	this->postInitialize();
}

void GarbageCollector::postInitialize()
{
	_oldZone = _heap->oldZone();

}

void Egg::GarbageCollector::releaseLocals()
{
    //warning("queueEphemerons must be implemented");
    //_memory->queueEphemerons_(_rescuedEphemerons);

	delete _weakContainers;
	delete _uncheckedEphemerons;
	delete _unreachedEphemerons;
	delete _rescuedEphemerons;
	delete _stacks;

	_weakContainers = nullptr;
    _uncheckedEphemerons = nullptr;
    _unreachedEphemerons = nullptr;
    _rescuedEphemerons = nullptr;
	_stacks = nullptr;
	//ActiveProcess stack unlock
}

void GarbageCollector::rememberSpecial_(HeapObject *anObject)
{
	auto klass = _runtime->speciesOf_((Object*)anObject);

    std::vector<HeapObject*> *collection;
	if (klass == _runtime->_ephemeronClass)
	{
        this->checkEphemeron_(anObject);
		collection = _uncheckedEphemerons;
    }
    else
    {
        collection = klass == _runtime->_processStackClass ? _stacks : _weakContainers;
    }
	collection->push_back(anObject);
}

void GarbageCollector::rescueEphemeron_(HeapObject *ephemeron)
{
	this->followEphemeronWeaks_(ephemeron);
	_rescuedEphemerons->push_back(ephemeron);
}

bool GarbageCollector::rescueUnreachableEphemerons()
{
	auto done = _unreachedEphemerons->empty();
    for (auto ephemeron : *_unreachedEphemerons)
	{
        this->rescueEphemeron_(ephemeron);
    }
    _unreachedEphemerons->clear();
	return done;
}

void GarbageCollector::scanNativeStackFrame_sized_(uintptr_t *framePointer, uintptr_t size)
{
    // all code is pinned for now
    //self fixReturnAddressIn: framePointer _asObject sized: size.

	this->scanStackFrameObjects_sized_(framePointer, size);
}

void GarbageCollector::scanStackFrameObjects_sized_(uintptr_t *framePointer, uintptr_t size) {
	for (uintptr_t i = 0; i < size; i++)
		this->scanRoot_((Object**)&framePointer[i]);
}

void GarbageCollector::scanSpecialSlots_(HeapObject *special)
{
	this->scan_from_to_(special, 1, special->size());
}

void GarbageCollector::nativeFramesStartingAt_bp_do_(uintptr_t **stack, uintptr_t sp, uintptr_t bp, std::function<void(uintptr_t*, uintptr_t)> block) {
	auto start = sp;
	auto end = bp;
	while (end != 0) {
		auto size = end - start;
	    block((uintptr_t*)&stack[start-1], size);
	    start = end + 2; // next frame stars after bp and retaddr slots
	    end = (uintptr_t)stack[end-1];
	}
}

void GarbageCollector::scanStack_sp_bp_(uintptr_t **stack, uintptr_t sp, uintptr_t bp) {
	this->nativeFramesStartingAt_bp_do_(stack, sp, bp,
		[this](uintptr_t *frame, uintptr_t size) {
			this->scanNativeStackFrame_sized_(frame, size);
		});
}

void GarbageCollector::scanSuspendedProcessStack_(HeapObject *aProcessVMStack) {
	// A suspended process' topmost frame was laid out by ProcessStack>>fillFrom:.
	// `sp` ivar is the slot just below the saved-bp slot of that topmost frame
	// Start the frame walk at sp+1 (saved-bp slot) up to bp.
	auto firstSP = _runtime->processStackSP_(aProcessVMStack) + 1;
	auto firstBP = _runtime->processStackBP_(aProcessVMStack);
	auto stack = (uintptr_t**)_runtime->processVMStackBuffer_(aProcessVMStack);
	this->scanStack_sp_bp_(stack, firstSP, firstBP);
}

void GarbageCollector::scanPointer_(Object** pointer)
{
	this->scanRoot_(pointer);
}

/* only for use until we have context switches */
void GarbageCollector::scanCurrentContext() {
	auto evaluator = _runtime->_evaluator;
	auto context = evaluator->context();
	this->scanPointer_(&evaluator->_regR);
	this->scanPointer_(&context->_regS);
	this->scanPointer_((Object**)&context->_regE);
	this->scanPointer_((Object**)&context->_regM);

	this->scanStack_sp_bp_(
		(uintptr_t**)context->stack(),
		context->stackPointer(),
		context->framePointer());
}

void GarbageCollector::scanStack_(HeapObject *aProcessVMStack)
{
	// Skip this stack if it corresponds to the active process: its buffer is
	// the one bound to the live evaluator context, which scanCurrentContext
	// has already walked using the live SP/BP/regs.
	auto buffer = _runtime->processVMStackBuffer_(aProcessVMStack);
	if (buffer == _runtime->_evaluator->context()->stack())
		return;

	auto process = _runtime->processStackProcess_(aProcessVMStack);
	if (_runtime->processStackIsValid_(process))
		this->scanSuspendedProcessStack_(aProcessVMStack);

	/* unimplemented GC in callbacks
    this->stackFramesBeneathCallbackIn_Do_(aProcessVMStack,
        [this](uintptr_t frame, uintptr_t nativeSize) {
            this->scanNativeStackFrame_sized_(frame, nativeSize);
        });
	*/
}

void GarbageCollector::scanStacks()
{
	while (!_stacks->empty())
    {
        auto s = _stacks->back();
        _stacks->pop_back();
		this->scanSpecialSlots_(s);
        this->scanStack_(s);
    }
}

void GarbageCollector::scanWeakContainers()
{
	for (auto weakContainer : *_weakContainers)
	{
        this->updateWeakReferencesOf_(weakContainer);
    }
    _weakContainers->clear();
}

void GarbageCollector::strengthenAndMigrateEphemerons()
{
	// No need to move ephemerons anywhere now, they will be added to the
	// list of unreachable on GC release. That list is iterated after GC
	// to finalize each of them.

    for (auto ephemeron : *_rescuedEphemerons)
    {
        ephemeron->beNotSpecial();
    }
}

void GarbageCollector::swapUncheckedWithUnreached()
{
    auto aux = this->_uncheckedEphemerons;
	this->_uncheckedEphemerons = this->_unreachedEphemerons;
	this->_unreachedEphemerons = aux;
}

void GarbageCollector::updateWeakReferencesOf_(HeapObject *weakContainer)
{
    for (uint32_t i = 0; i < weakContainer->size(); i++)
	    this->updateWeak_at_(weakContainer, i);
}
