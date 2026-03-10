/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 
    C++ port of modules/CodeSpecs/*.st — only the subset needed
    for kernel bootstrapping (class sizes, format flags, hierarchy).
 */

#ifndef _CODE_SPECS_H_
#define _CODE_SPECS_H_

#include <vector>
#include <map>
#include <cstdint>
#include "../Compiler/egg_string.h"

namespace Egg {

class ClassSpec;
class MetaclassSpec;
class ModuleSpec;

// ---- MethodSpec ----
// Mirrors modules/CodeSpecs/MethodSpec.st — minimal subset for bootstrapping

class MethodSpec {
public:
    MethodSpec() = default;
    MethodSpec(const egg::string& source) : _source(source) {}

    const egg::string& source() const { return _source; }
    void source(const egg::string& s) { _source = s; }

private:
    egg::string _source;
};

// ---- SpeciesSpec (base for ClassSpec and MetaclassSpec) ----
// Mirrors modules/CodeSpecs/SpeciesSpec.st

class SpeciesSpec {
public:
    enum FormatFlags {
        IsArrayed = 0x1,
        IsBytes   = 0x2
    };

    SpeciesSpec() : _format(0), _module(nullptr) {}
    virtual ~SpeciesSpec() = default;

    const std::vector<egg::string>& instVarNames() const { return _instanceVariables; }
    void instVarNames(const std::vector<egg::string>& ivars) { _instanceVariables = ivars; }
    int format() const { return _format; }
    void beArrayed() { _format |= IsArrayed; }
    void beBytes()   { _format |= IsBytes; }
    bool instancesAreArrayed() const { return _format & IsArrayed; }
    bool instancesAreBytes()   const { return _format & IsBytes; }

    void addMethod(const MethodSpec& m) { _methods.push_back(m); }
    const std::vector<MethodSpec>& methods() const { return _methods; }

    ModuleSpec* module() const { return _module; }
    void module(ModuleSpec* m) { _module = m; }

    virtual const egg::string& name() const = 0;
    virtual ClassSpec* superclass() const = 0;

    uint32_t instSize() const;
    std::vector<egg::string> allInstVarNames() const;

protected:
    std::vector<egg::string> _instanceVariables;
    std::vector<MethodSpec> _methods;
    int _format;
    ModuleSpec* _module;
};

// ---- MetaclassSpec ----
// Mirrors modules/CodeSpecs/MetaclassSpec.st

class MetaclassSpec : public SpeciesSpec {
public:
    MetaclassSpec() : _instanceClass(nullptr) {}

    ClassSpec* instanceClass() const { return _instanceClass; }
    void instanceClass(ClassSpec* cls) { _instanceClass = cls; }

    const egg::string& name() const override;
    ClassSpec* superclass() const override;

private:
    ClassSpec* _instanceClass;
};

// ---- ClassSpec ----
// Mirrors modules/CodeSpecs/ClassSpec.st

class ClassSpec : public SpeciesSpec {
public:
    ClassSpec() : _metaclass(nullptr), _variable(false), _pointers(true) {}

    const egg::string& name() const override { return _name; }
    void name(const egg::string& n) { _name = n; }

    const egg::string& supername() const { return _supername; }
    void supername(const egg::string& s) { _supername = s; }

    ClassSpec* superclass() const override;

    MetaclassSpec* metaclass() const { return _metaclass; }
    void metaclass(MetaclassSpec* mc) { _metaclass = mc; }

    bool isVariable() const { return _variable; }
    void isVariable(bool v) { _variable = v; }
    bool isPointers() const { return _pointers; }
    void isPointers(bool p) { _pointers = p; }

    const std::vector<egg::string>& classVarNames() const { return _classVarNames; }
    void classVarNames(const std::vector<egg::string>& cvars) { _classVarNames = cvars; }

private:
    egg::string _name;
    egg::string _supername;
    MetaclassSpec* _metaclass;
    bool _variable;
    bool _pointers;
    std::vector<egg::string> _classVarNames;
};

// ---- ModuleSpec (minimal) ----
// Mirrors modules/CodeSpecs/ModuleSpec.st — only class registry & resolution

class ModuleSpec {
public:
    ModuleSpec() = default;
    ~ModuleSpec();

    void addClass(ClassSpec* cls);
    ClassSpec* resolveClass(const egg::string& name) const;
    const std::map<egg::string, ClassSpec*>& classes() const { return _classes; }

private:
    std::map<egg::string, ClassSpec*> _classes;
};

} // namespace Egg

#endif // _CODE_SPECS_H_
