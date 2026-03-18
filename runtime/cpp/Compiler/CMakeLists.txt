# Compiler library
file(GLOB COMPILER_SRC 
    "*.cpp"
    "Parser/*.cpp"
    "AST/*.cpp"
    "Binding/*.cpp"
    "Backend/*.cpp"
)

add_library(egg_compiler STATIC ${COMPILER_SRC})
target_include_directories(egg_compiler PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# Tests
enable_testing()
add_subdirectory(tests)
