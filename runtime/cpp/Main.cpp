
/*
    Copyright (c) 2019-2024 Javier Pimás, Jan Vrany, Labware. 
    See (MIT) license in root directory.
 */

#include "Launcher.h"

#include <exception>
#include <iostream>

int
main(const int argc, const char** argv) {
    Egg::Launcher launcher;
    try {
        return launcher.main(argc, argv);
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    } catch (...) {
        std::cerr << "Error: unknown exception reached top level" << std::endl;
        return 1;
    }
}
