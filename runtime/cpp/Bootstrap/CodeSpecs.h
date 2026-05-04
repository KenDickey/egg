/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 
    C++ port of modules/CodeSpecs/*.st — only the subset needed
    for kernel bootstrapping (class sizes, format flags, hierarchy).
 */

#ifndef _CODE_SPECS_H_
#define _CODE_SPECS_H_

#include <vector>
#include <map>
#include <cstdint>
#include "Utils/egg_string.h"

namespace Egg {

class ClassSpec;
class MetaclassSpec;
class ModuleSpec;

// ---- MethodSpec ----
// Mirrors modules/CodeSpecs/MethodSpec.st — minimal subset for bootstrapping

class MethodSpec {
public:
    MethodSpec() = default;
    MethodSpec(const Egg::string& source) : _source(source) {}

    const Egg::string& source() const { return _source; }
    void source(const Egg::string& s) { _source = s; }

    const Egg::string& category() const { return _category; }
    void category(const Egg::string& c) { _category = c; }

private:
    Egg::string _source;
    Egg::string _category;
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

    const std::vector<Egg::string>& instVarNames() const { return _instanceVariables; }
    void instVarNames(const std::vector<Egg::string>& ivars) { _instanceVariables = ivars; }
    int format() const { return _format; }
    void beArrayed() { _format |= IsArrayed; }
    void beBytes()   { _format |= IsBytes; }
    bool instancesAreArrayed() const { return _format & IsArrayed; }
    bool instancesAreBytes()   const { return _format & IsBytes; }

    void addMethod(const MethodSpec& m) { _methods.push_back(m); }
    const std::vector<MethodSpec>& methods() const { return _methods; }

    ModuleSpec* module() const { return _module; }
    void module(ModuleSpec* m) { _module = m; }

    virtual const Egg::string& name() const = 0;
    virtual ClassSpec* superclass() const = 0;

    uint32_t instSize() const;
    std::vector<Egg::string> allInstVarNames() const;

protected:
    std::vector<Egg::string> _instanceVariables;
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

    const Egg::string& name() const override;
    ClassSpec* superclass() const override;

private:
    ClassSpec* _instanceClass;
};

// ---- ClassSpec ----
// Mirrors modules/CodeSpecs/ClassSpec.st

class ClassSpec : public SpeciesSpec {
public:
    ClassSpec() : _metaclass(nullptr), _variable(false), _pointers(true), _isExtension(false) {}

    const Egg::string& name() const override { return _name; }
    void name(const Egg::string& n) { _name = n; }

    const Egg::string& supername() const { return _supername; }
    void supername(const Egg::string& s) { _supername = s; }

    ClassSpec* superclass() const override;

    MetaclassSpec* metaclass() const { return _metaclass; }
    void metaclass(MetaclassSpec* mc) { _metaclass = mc; }

    bool isVariable() const { return _variable; }
    void isVariable(bool v) { _variable = v; }
    bool isPointers() const { return _pointers; }
    void isPointers(bool p) { _pointers = p; }

    bool isExtension() const { return _isExtension; }
    void isExtension(bool e) { _isExtension = e; }

    const std::vector<Egg::string>& classVarNames() const { return _classVarNames; }
    void classVarNames(const std::vector<Egg::string>& cvars) { _classVarNames = cvars; }

    const Egg::string& comment() const { return _comment; }
    void comment(const Egg::string& c) { _comment = c; }

private:
    Egg::string _name;
    Egg::string _supername;
    MetaclassSpec* _metaclass;
    bool _variable;
    bool _pointers;
    bool _isExtension;
    std::vector<Egg::string> _classVarNames;
    Egg::string _comment;
};

// ---- ModuleSpec (minimal) ----
// Mirrors modules/CodeSpecs/ModuleSpec.st — only class registry & resolution

class ModuleSpec {
public:
    ModuleSpec() = default;
    ~ModuleSpec();

    void addClass(ClassSpec* cls);
    ClassSpec* resolveClass(const Egg::string& name) const;
    const std::map<Egg::string, ClassSpec*>& classes() const { return _classes; }

private:
    std::map<Egg::string, ClassSpec*> _classes;
};

} // namespace Egg

#endif // _CODE_SPECS_H_
