cmake_minimum_required(VERSION 3.10)

find_package(Catch2 REQUIRED)

# Create test executable (parser tests only - no runtime dependencies)
add_executable(bootstrapper_parser_tests
    test_main.cpp
    SimpleParserTest.cpp
    SourceLoadingTest.cpp
    MethodParserTest.cpp
    IntegrationTest.cpp
    CompilationTest.cpp
)

# Set C++ standard
set_property(TARGET bootstrapper_parser_tests PROPERTY CXX_STANDARD 17)

# Include directories
target_include_directories(bootstrapper_parser_tests PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../..
    ${CMAKE_CURRENT_SOURCE_DIR}/../../Compiler
)

# Link libraries
target_link_libraries(bootstrapper_parser_tests 
    Catch2::Catch2
    egg_compiler
    bootstrapper_lib
)

# Add test to CTest
add_test(NAME BootstrapperParserTests COMMAND bootstrapper_parser_tests)
