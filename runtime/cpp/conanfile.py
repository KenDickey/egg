from conan import ConanFile


class EggConan(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps", "CMakeToolchain"
    requires = (
        "libffi/3.4.6",
        "cxxopts/3.2.0",
        "catch2/2.13.10",
    )

    def configure(self):
        # Egg requires C++20; pin cppstd so users don't have to pass
        # `-s compiler.cppstd=20` on the conan install command line.
        self.settings.compiler.cppstd = "20"
