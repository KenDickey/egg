# Egg Smalltalk 🥚

Egg is a MIT-licensed implementation of a Smalltalk-80 derived environment.
Egg is not strictly a ST80 though. Some egg characteristics
and intentions are:
 - It is _module-based_, where each module has its own namespace (no Smalltalk globals anymore).
 - Modules can be loaded quickly through _image segments_ (without requiring a compiler).
 - It is _minimal_, with the capability to grow dynamically: its kernel has much fewer
   things than ST80 (i.e. no GUI and no compiler), but because of image-segments those
   modules can be loaded instantly.
 - Most identifiers are _dynamically bound_. This means that like #doesNotUnderstand:
   message, you can also get a #doesNotKnow: message. The implementation uses a cache and
   is fast (you don't have to worry about performance there :).
 - Module dependencies are stated explicitly, new modules are built through _importing_
   components of other modules.
 - Designed to support _multiple VMs_ that allow running on _multiple platforms_.
 - This includes native JIT-based VMs for popular OSes and JS-based runtimes.
 - For all VMs and OSes, the same Smalltalk code base is used (there might only be small
   differences if the platform used doesn't support a particular feature).
 - Egg is developed in tandem with [Webside](https://github.com/guillermoamaral/Webside),
   which is the GUI used to develop and debug the Smalltalk code on any platform.
   This allows to keep Egg minimal, even in platforms such as _EggNOS_ (a successor of
   SqueakNOS!)


## Contents of this repo

This repository includes the Smalltalk sources of Egg (in `modules` directory) as
well as the different runtime implementations (`runtimes` directory). Some runtimes
allow to generate Egg images from files, i.e. to bootstrap images (currently only possible
from `runtime/pharo`).

## Using

If you just want to use egg, download the corresponding build artifact from releases.
Currently working platforms are **Pharo**, **C++** and **JS**. You'll find supported platforms in `/runtime`
subdirectories. Look for individual `README.md` on each of them for platform-specific help.

Each subdir of runtime implements a VM that can run Egg code in a different platform. All
platforms use the same Egg code, which is stored in [modules](modules) directory. For
now we have the following runtimes:

- [Egg/Pharo](runtime/pharo) - Our main platform for bootstrapping and modifying Egg kernel.
- [Egg/CPP](runtime/cpp) - An implementation of an Egg VM in C++. It runs on any platform for which there is a C++ compiler.
- [Egg/JS](runtime/js) - An implementation of a VM for Egg that can run in node.js or a web browser.

## Building

To build egg from scratch you will need `make` and some tools that vary depending on your target platform:

| Platform | Prerequisites |
|----------|--------------|
| `pharo`  | Pharo (fetched automatically via `pharo-vm`) |
| `cpp`    | CMake, a C++ compiler, and [Conan](https://conan.io) |
| `js`     | Node.js |

In a nutshell, clone this repo and run `make <platform>`:

```
git clone git@github.com:powerlang/egg.git
make pharo   # bootstrap VM + image on top of Pharo
make cpp     # native C++ VM (requires CMake + Conan)
make js      # JavaScript VM (requires node.js)
```

See the individual `runtime/<platform>/README.md` files for detailed build instructions.


## Project status

There are (at least) two mostly orthogonal sides in this project: runtimes and Egg Smalltalk modules.
In the Egg Smalltalk axis, we already have: kernel, compiler, modules and image-segment builder, among others.
In the runtime axis, we used Pharo as the primary development and bootstrapping platform — it provides a GC and
JIT for free and makes debugging straightforward. We now also have a working C++ VM (interpreter with bootstrapper,
GC and module loader), a JS VM, and an LMR (Live Metacircular Runtime — a Smalltalk-in-Smalltalk VM).

Current state by platform:

- **Pharo** — primary bootstrap and development platform; fully working.
- **C++** — interpreter VM fully working: loads Tonel sources, bootstraps the kernel, and runs modules.
- **JS** — working VM for node.js / browser.
- **LMR** — in progress.

We haven't done a 1.0 release yet, so expect a bumpy road if trying egg in the short term; the code is in alpha state.
