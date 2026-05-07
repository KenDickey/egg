# Kernel Bootstrap

## Overview

The Kernel Bootstrap enables bootstrapping the Egg Smalltalk kernel from `.st` source files
**without a prebuilt image file**. Previously we used the `runtime/pharo` platform to bootstrap an
egg image and save it to disk, but that was cumbersome. The C++ bootstrapper allows faster feedback
when working on bootstrap and core code from files.

## Design

### Two-Phase Bootstrap

**Phase 1: C++ creates minimal kernel**
- Core objects: `nil`, `true`, `false`
- Core classes with simplified method dictionaries
- Symbol table with essential symbols
- Enough infrastructure to send a message

**Phase 2: Smalltalk completes initialization**
- C++ sends `#bootstrap` to the system
- Smalltalk rehashes dictionaries, initializes globals
- System is fully operational after this

### Simplified Method Dictionaries

Method dictionaries during bootstrap are **plain arrays** (behavior is `Array`):

```
Method array (during bootstrap):
  ┌───────────────────────────────────────────────────┐
  │ selector1 │ method1 │ selector2 │ method2 │ ...   │
  └───────────────────────────────────────────────────┘
```

The VM lookup code checks the method dictionary type:
- If array (behavior is `Array`) → linear scan through selector/method pairs
- If proper `MethodDictionary` → hashed lookup

```cpp
Object* Runtime::methodFor_in_(Object* symbol, HeapObject* behavior) {
    auto md = behaviorMethodDictionary_(behavior);
    if (isArrayMethodDict_(md)) {
        return linearMethodLookup_(symbol, md);
    }
    return hashedMethodLookup_(symbol, md);
}
```

During `#bootstrap`, method dictionaries are converted from arrays to proper hashed
`MethodDictionary` format by the Smalltalk side.

### Bootstrap Sequence

```
1. Bootstrapper::bootstrap()
   │
   ├── Phase 1: loadKernelSpecs()
   │   └── Parse all .st files into ClassSpecs with MethodSpecs
   │
   ├── Phase 2: createInitialObjects()
   │   └── Create nil, true, false, kernel module, symbol table
   │
   ├── Phase 3: instantiateMetaobjects()
   │   └── Allocate all classes, metaclasses and behaviors
   │
   ├── Phase 4: initializeMetaobjects()
   │   └── Link superclass chains, set formats, bind behaviors
   │
   ├── Phase 5: createKernelNamespace()
   │   └── Create namespace so class names resolve at runtime
   │
   ├── Phase 6: loadKernelMethods()
   │   └── Compile methods, store in array-based method dicts
   │
   └── Phase 7: createRuntimeWithBootstrappedKernel()
       ├── Create BootstrappedKernel and Runtime
       ├── Initialize evaluator
       └── Send #bootstrap to KernelModule (Smalltalk initializes constants
           and converts array method dicts to hashed MethodDictionary)
```

## What It Does

The `Bootstrapper` performs a complete bootstrap of the Egg kernel:

1. **Creates Initial Objects**: nil, true, false, and the kernel module
2. **Creates Core Classes**: Class, Metaclass, UndefinedObject, True, False, Symbol, String, Array, MethodDictionary, CompiledMethod
3. **Loads Class Definitions**: Reads all `.st` files from the Kernel module directory
4. **Parses Class Definitions**: Extracts class names, superclasses, and instance variables from Tonel format
5. **Compiles Methods**: Parses method source and generates Egg treecode bytecode
6. **Installs Methods**: Stores compiled methods in plain array method dictionaries

## Usage

```cpp
#include "Bootstrap/Bootstrapper.h"

Bootstrapper bootstrapper("/path/to/modules/Kernel");
Runtime* runtime = bootstrapper.bootstrap();
```

## Testing

See [`runtime/cpp/README.md`](../README.md) for build and test instructions.
The bootstrap-side tests live in [`tests/`](tests/) and run as the
`bootstrapper_parser_tests` CTest target.

## Implementation Overview

`Bootstrapper` drives the seven phases above. It owns a `BootstrappedKernel`
(an `ImageSegment` adapter that hands out memory for the metaobjects it
allocates) and uses a `TonelReader` to turn each `.st` file under the kernel
directory into `CodeSpecs` (`ClassSpec` + `MethodSpec` trees).

For every class spec it instantiates the metaobjects, then asks the compiler
to produce a `CompiledMethod` per method spec. Those methods are inserted into
plain-array dictionaries through `MethodDictBuilder`, which later (after
`#bootstrap` runs on the Smalltalk side) is also used to rebuild them as
hashed `MethodDictionary` instances.

Once the kernel is alive, `SourceModuleLoader` reuses the same `TonelReader`
and `MethodDictBuilder` to load additional modules on demand from Tonel
source.
