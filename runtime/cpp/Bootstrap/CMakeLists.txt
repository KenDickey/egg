cmake_minimum_required(VERSION 3.10)
project(KernelBootstrapper)

# Create bootstrapper library
add_library(bootstrapper_lib
    CodeSpecs.cpp
    Bootstrapper.cpp
    SourceModuleLoader.cpp
    BootstrappedKernel.cpp
    TonelReader.cpp
)

# Include directories
target_include_directories(bootstrapper_lib PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/..
)

# Link bootstrapper with runtime
target_link_libraries(bootstrapper_lib PUBLIC egg_runtime)

# Create bootstrap demonstration executable
add_executable(bootstrap_demo
    bootstrap_demo.cpp
)

# Link demo with bootstrapper library and compiler
target_link_libraries(bootstrap_demo
    bootstrapper_lib
    egg_compiler
)

