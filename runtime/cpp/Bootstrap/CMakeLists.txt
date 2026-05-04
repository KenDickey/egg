cmake_minimum_required(VERSION 3.13)
cmake_policy(SET CMP0079 NEW)
project(KernelBootstrapper)

# Create bootstrapper library
add_library(bootstrapper_lib
    CodeSpecs.cpp
    Bootstrapper.cpp
    MethodDictBuilder.cpp
    SourceModuleLoader.cpp
    BootstrappedKernel.cpp
    TonelReader.cpp
)

# Include directories
target_include_directories(bootstrapper_lib PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/..
)

# Link bootstrapper with runtime. egg_runtime's Loader.cpp /
# SymbolProvider.cpp call back into bootstrapper_lib, so the two are
# mutually dependent. Declare both edges so CMake emits
# --start-group/--end-group on GNU ld.
target_link_libraries(bootstrapper_lib PUBLIC egg_runtime)
target_link_libraries(egg_runtime PUBLIC bootstrapper_lib)


if(BUILD_TESTING)
    add_subdirectory(tests)
endif()
