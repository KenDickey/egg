/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SIdentifierNode.h"
#include "SParseNodeVisitor.h"
#include "../SSmalltalkCompiler.h"
#include "../LiteralValue.h"
#include <iostream>

#include "../Binding/Binding.h"
#include "../Binding/ArgumentBinding.h"
#include "../Binding/TemporaryBinding.h"
#include "../Binding/Scope.h"
#include "../Binding/ScriptScope.h"

namespace Egg {

SIdentifierNode::SIdentifierNode(SSmalltalkCompiler* compiler) 
    : SParseNode(static_cast<SSmalltalkCompiler*>(compiler)), _binding(nullptr) {
}

void SIdentifierNode::acceptVisitor_(SParseNodeVisitor* visitor) {
    visitor->visitIdentifier_(this);
}

bool SIdentifierNode::isEvaluable() const {
    return isIdentifierLiteral();
}

bool SIdentifierNode::isLocal() const {
    if (!_binding) return false;
    auto k = _binding->kind();
    return k == Binding::Kind::Variable || k == Binding::Kind::Argument || k == Binding::Kind::Temporary;
}

bool SIdentifierNode::isIdentifierLiteral() const {
    if (!_binding) return false;
    if (!_binding->isDynamic()) return _binding->isLiteral();
    return false;
}

bool SIdentifierNode::isMethodArgument() const {
    return false;
}

bool SIdentifierNode::isMethodTemporary() const {
    return false;
}

bool SIdentifierNode::isSelf() const {
    return _binding && _binding->name() == "self";
}

bool SIdentifierNode::isSuper() const {
    return _binding && _binding->name() == "super";
}

void SIdentifierNode::beAssigned() {
    if (_binding && _binding->canBeAssigned()) return;
    std::cerr << "Cannot assign to " << _binding->name() << std::endl;
}

void SIdentifierNode::checkLowercase() {
    if (!_name.empty()) {
        char32_t first = _name[0];
        if (egg::isLetter(first) && egg::isUppercase(first)) {
            std::cerr << "Warning: variable '" << _name << "' should start with a lowercase letter." << std::endl;
        }
    }
}

void SIdentifierNode::defineArgumentIn_(Scope* scope) {
    if (scope) {
        _binding = scope->defineArgument_(_name);
    }
}

void SIdentifierNode::defineTemporaryIn_(Scope* scope) {
    if (scope) {
        _binding = scope->defineTemporary_(_name);
    }
}

Binding* SIdentifierNode::resolveAssigning_(bool aBoolean) {
    _binding = _compiler->activeScope()->resolve_(_name);
    return _binding;
}

} // namespace Egg
