/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SParseNode.h"
#include "SMethodNode.h"
#include "../SSmalltalkCompiler.h"

namespace Egg {

void SParseNode::allNodesDo_includingDeclarations_(std::function<void(SParseNode*)> block) {
    nodesDo_(block, true);
}

SParseNode* SParseNode::ast() {
    return compiler() ? dynamic_cast<SParseNode*>(compiler()->ast()) : nullptr;
}

SParseNode* SParseNode::nodesDetect_(std::function<bool(SParseNode*)> predicate, std::function<SParseNode*()> ifAbsent) {
    SParseNode* found = nullptr;
    nodesDo_([&](SParseNode* node) {
        if (!found && predicate(node)) found = node;
    }, false);
    return found ? found : ifAbsent();
}

SParseNode* SParseNode::nodeWithLiteral_(const Egg::string& value) {
    return nodesDetect_([
        &value
    ](SParseNode* n) {
        return (n->isLiteral() || n->isSelector()) && n->valueEquals_(value);
    }, []() { return nullptr; });
}

SParseNode* SParseNode::variableNamed_(const Egg::string& name) {
    SParseNode* result = nullptr;
    allNodesDo_includingDeclarations_([&](SParseNode* node) {
        if (node->isIdentifier() && node->nameEquals_(name)) result = node;
    });
    return result;
}

bool SParseNode::valueEquals_(const Egg::string&) const { return false; }
bool SParseNode::nameEquals_(const Egg::string&) const { return false; }
bool SParseNode::isMethodArgument() const { return false; }
bool SParseNode::isMethodTemporary() const { return false; }

} // namespace Egg
