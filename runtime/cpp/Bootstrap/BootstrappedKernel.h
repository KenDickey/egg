/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _BOOTSTRAPPED_KERNEL_H_
#define _BOOTSTRAPPED_KERNEL_H_

#include "../ImageSegment.h"
#include <string>

namespace Egg {

/**
 * BootstrappedKernel wraps a GCSpace containing bootstrapped kernel objects
 * and presents it as an ImageSegment for Runtime consumption.
 */
class BootstrappedKernel : public ImageSegment {
public:
    BootstrappedKernel(uintptr_t base, uintptr_t size, uintptr_t objectsEnd);
    
    void addExport(const std::string& name, HeapObject* obj) {
        _exports[name] = obj;
    }
};

} // namespace Egg

#endif // _BOOTSTRAPPED_KERNEL_H_
