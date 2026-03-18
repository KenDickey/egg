/*
    Copyright (c) 2019-2025 Javier Pimás, Jan Vrany, Labware.
    See (MIT) license in root directory.
 */

#ifndef _LOADER_H_
#define _LOADER_H_

#include <map>
#include <string>
#include <vector>
#include <memory>
#include <filesystem>
#include <fstream>

#include "Allocator/GCHeap.h"
#include "Allocator/GCSpace.h"
#include "Evaluator/Evaluator.h"
#include "Evaluator/SAssociationBinding.h"

namespace Egg {

class Loader {
public:
	Runtime *_runtime;
	ImageSegment *_kernel;

	Loader(const std::string& modulesDir);
	~Loader();

	Runtime* loadKernel();
	HeapObject* loadModule_(const std::string& name);

	// .ems loading support
	ImageSegment* loadModuleFromFile(const std::string &filename);
	void bindModuleImports(ImageSegment *imageSegment, std::vector<Object*> &imports);
	Object* bindModuleImport(ImageSegment* imageSegment, std::vector<std::uint32_t> &descriptor);
	HeapObject* importStringAt_(ImageSegment* imageSegment, uint32_t index);
	HeapObject* transferSymbol(std::string &str);
	HeapObject* transferArray(std::vector<HeapObject*> &array);
	HeapObject* transferArray(std::vector<Object*> &array);
	std::filesystem::path findInPath(const std::string &filename);

	// bare testing support
	ImageSegment* bareLoadModuleFromFile(const std::string &filename);
	Object* bareBindModuleImport(ImageSegment* imageSegment, std::vector<std::uint32_t> &descriptor);

	std::string findModulesDir_();

private:
	std::string _modulesDir;
	std::map<std::string, HeapObject*> _loadedModules;
	std::map<std::string, ImageSegment*> _segments;

	bool hasEmsFile_(const std::string& name);
	bool hasSourceDir_(const std::string& name);
};

}

#endif // _LOADER_H_
