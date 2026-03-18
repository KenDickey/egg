/*
    Copyright (c) 2019-2023 Javier Pimás. 
    Copyright (c) 2019 Jan Vrany.
    See (MIT) license in root directory.
 */

#include <cstring>
#include <iostream>
#include <algorithm>
#include <iomanip>

#include "ImageSegment.h"

namespace Egg
{

void ImageSegment::dumpObjects() {
    auto heapStart = _currentBase + sizeof(ImageSegmentHeader);
    auto current = ((HeapObject::ObjectHeader*)heapStart)->object();
    auto end = (HeapObject*)(_currentBase + header.size);
    while (current < end)
    {
        auto behavior = current->behavior();
        std::cout << "obj at: " << current << " (" << current->printString() << ")" << std::endl;
        std::cout << "size: " << std::dec << current->size() << ", flags: " << current->flags() << std::endl;

        if (current->isBytes()) {
            std::cout << "bytes: ";
            std::for_each((uint8_t*)current, ((uint8_t*)current) + current->size(), [](uint8_t c) {
                std::cout << std::hex << std::setw(2) << std::setfill('0') << (int)c << " ";
            });
            std::cout << std::endl;
        }
        else {
            for (uintptr_t i = 0; i < current->pointersSize(); i++)
            {
                auto &slot = current->slot(i);
                std::cout << slot << " (" << slot->printString() << ")" << std::endl;
            }
        }
        std::cout << "-------------------" << std::endl;
        current = current->nextObject();
    }
}

} // namespace Egg
