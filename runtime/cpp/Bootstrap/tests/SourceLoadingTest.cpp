/*
    Tests for reading .st source files from disk.
 */

#include <catch2/catch.hpp>
#include "../TonelReader.h"
#include <fstream>
#include <filesystem>
#include <sstream>

using namespace Egg;

// Helper to find the Kernel module directory
static std::string findKernelPath() {
    std::vector<std::string> paths = {
        "../../modules/Kernel",
        "../../../modules/Kernel",
        "../../../../modules/Kernel",
        "../../../../../modules/Kernel",
        "../../../../../../modules/Kernel",
        "../../../../../../../modules/Kernel"
    };
    for (const auto& path : paths) {
        if (std::filesystem::exists(path + "/Object.st")) {
            return path;
        }
    }
    return "";
}

TEST_CASE("SourceLoading: Can find Kernel directory", "[source]") {
    std::string path = findKernelPath();
    REQUIRE(!path.empty());
    REQUIRE(std::filesystem::exists(path));
}

TEST_CASE("SourceLoading: Can read Object.st", "[source]") {
    std::string path = findKernelPath();
    REQUIRE(!path.empty());
    
    std::ifstream file(path + "/Object.st");
    REQUIRE(file.is_open());
    
    std::stringstream buffer;
    buffer << file.rdbuf();
    std::string content = buffer.str();
    REQUIRE(!content.empty());
    REQUIRE(content.find("#name") != std::string::npos);
}

TEST_CASE("SourceLoading: Can parse Object class definition", "[source]") {
    std::string path = findKernelPath();
    REQUIRE(!path.empty());
    
    std::ifstream file(path + "/Object.st");
    REQUIRE(file.is_open());
    
    std::stringstream buffer;
    buffer << file.rdbuf();
    
    TonelReader reader;
    auto spec = reader.parseFile(buffer.str());
    REQUIRE(spec->name() == "Object");
}

TEST_CASE("SourceLoading: Can list .st files in Kernel", "[source]") {
    std::string path = findKernelPath();
    REQUIRE(!path.empty());
    
    int count = 0;
    for (const auto& entry : std::filesystem::directory_iterator(path)) {
        if (entry.path().extension() == ".st") {
            count++;
        }
    }
    REQUIRE(count > 10); // Should have many .st files
}
