/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _SELECTOR_NODE_H_
#define _SELECTOR_NODE_H_

#include "SParseNode.h"
#include <string>
#include <vector>

namespace Egg {

/**
 * Selector node (message selector)
 * Corresponds to SSelectorNode in Smalltalk
 */
class SSelectorNode : public SParseNode {
private:
    Egg::string _symbol;
    std::vector<SSelectorNode*> _keywords; // For keyword selectors with multiple parts
    
public:
    SSelectorNode(SSmalltalkCompiler* compiler) : SParseNode(compiler) {}
    virtual ~SSelectorNode() {}
    
    void acceptVisitor_(SParseNodeVisitor* visitor) override;
    
    Egg::string symbol() const { return _symbol; }
    void symbol_(const Egg::string& s) { _symbol = s; }
    
    const std::vector<SSelectorNode*>& keywords() const { return _keywords; }
    void addKeyword_(SSelectorNode* kw) { _keywords.push_back(kw); }
    
    bool isSelector() const override { return true; }
    bool isBinary() const;
    bool hasSymbol() const { return !_symbol.empty(); }
    
    Egg::string value() const { return _symbol; }
    
    void nodesDo_(std::function<void(SParseNode*)> block, bool includeDeclarations = false) override {
        SParseNode::nodesDo_(block, includeDeclarations);
        for (auto kw : _keywords) {
            if (kw) kw->nodesDo_(block, includeDeclarations);
        }
    }
};

} // namespace Egg

#endif // _SELECTOR_NODE_H_
