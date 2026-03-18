/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "BootstrappedKernel.h"
#include <sstream>
#include <cstring>

namespace Egg {

std::istringstream BootstrappedKernel::createDummyStream() {
    // Create a minimal valid EGG_IS stream so ImageSegment constructor doesn't crash.
    // We'll override all the header fields after construction.
    ImageSegmentHeader dummyHeader;
    memset(&dummyHeader, 0, sizeof(dummyHeader));
    
    // Set signature
    const char* sig = "EGG_IS\n";
    memcpy(dummyHeader.signature, sig, 8);
    
    // Set minimal size (just the header)
    dummyHeader.size = sizeof(ImageSegmentHeader);
    dummyHeader.reservedSize = sizeof(ImageSegmentHeader);
    dummyHeader.baseAddress = 0;
    dummyHeader.module = nullptr;
    
    std::string data(reinterpret_cast<char*>(&dummyHeader), sizeof(dummyHeader));
    return std::istringstream(data);
}

BootstrappedKernel::BootstrappedKernel(uintptr_t base, uintptr_t size, uintptr_t objectsEnd)
    : ImageSegment(nullptr)  // bypass load - we pass nullptr to skip it
{
    // Override the header with actual bootstrap segment info
    const char* sig = "EGG_IS\n";
    memcpy(header.signature, sig, 8);
    header.baseAddress = base;
    // Offset _currentBase so that spaceStart() (= _currentBase + sizeof(ImageSegmentHeader))
    // returns 'base', where bootstrap objects actually begin (no on-disk header in memory).
    _currentBase = base - sizeof(ImageSegmentHeader);
    header.size = objectsEnd - _currentBase;
    header.reservedSize = size + sizeof(ImageSegmentHeader);
    header.module = nullptr;
}

} // namespace Egg
