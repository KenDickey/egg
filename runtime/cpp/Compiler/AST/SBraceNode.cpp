/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SBraceNode.h"
#include "SParseNodeVisitor.h"
#include "SMessageNode.h"
#include "SCascadeNode.h"
#include "SCascadeMessageNode.h"
#include "SIdentifierNode.h"
#include "SSelectorNode.h"
#include "SNumberNode.h"
#include "../SSmalltalkCompiler.h"
#include "../LiteralValue.h"

namespace Egg {
SBraceNode::SBraceNode(SSmalltalkCompiler* compiler) 
    : SParseNode(compiler), _message(nullptr) {
}

void SBraceNode::acceptVisitor_(SParseNodeVisitor* visitor) {
    visitor->visitBrace_(this);
}

void SBraceNode::addElement_(SParseNode* elem) {
    _elements.push_back(elem);
}

SParseNode* SBraceNode::asSMessageNode() {
    if (_message) return _message;
    _message = expanded();
    return _message;
}

SParseNode* SBraceNode::expanded() {
    auto receiver = _compiler->identifierNode();
    receiver->name_("Array");
    int n = _elements.size();
    auto new_ = _compiler->selectorNode();
    new_->symbol_("new:");
    auto argument = _compiler->numericSLiteralNode();
    argument->value_(n);
    auto array = _compiler->messageNode();
    array->receiver_(receiver);
    array->selector_(new_);
    std::vector<SParseNode*> arrayArgs;
    arrayArgs.push_back(argument);
    array->arguments_(arrayArgs);
    int i = 0;
    std::vector<SParseNode*> messages;
    for (auto elem : _elements) {
        i = i + 1;
        auto msg = _compiler->cascadeSMessageNode();
        msg->position_(elem->position());
        auto sel = _compiler->selectorNode();
        sel->symbol_("at:put:");
        auto idx = _compiler->numericSLiteralNode();
        idx->value_(i);
        std::vector<SParseNode*> args;
        args.push_back(idx);
        args.push_back(elem);
        msg->selector_(sel);
        msg->arguments_(args);
        messages.push_back(msg);
    }
    auto you = _compiler->selectorNode();
    you->symbol_("yourself");
    auto yourself = _compiler->cascadeSMessageNode();
    yourself->selector_(you);
    std::vector<SParseNode*> yourselfArgs;
    yourself->arguments_(yourselfArgs);
    messages.push_back(yourself);
    auto cascade = _compiler->cascadeNode();
    cascade->receiver_(array);
    for (auto msg : messages) {
        static_cast<SCascadeMessageNode*>(msg)->cascade_(cascade);
    }
    std::vector<SMessageNode*> cascadeMessages;
    for (auto msg : messages) {
        cascadeMessages.push_back(static_cast<SCascadeMessageNode*>(msg));
    }
    cascade->messages_(cascadeMessages);
    return cascade;
}

bool SBraceNode::isEvaluable() const {
    for (auto elem : _elements) {
        if (!elem->isEvaluable()) {
            return false;
        }
    }
    return true;
}

void SBraceNode::nodesDo_(std::function<void(SParseNode*)> block, bool includeDeclarations) {
    SParseNode::nodesDo_(block, includeDeclarations);
    for (auto elem : _elements) {
        if (elem) elem->nodesDo_(block, includeDeclarations);
    }
}

} // namespace Egg
