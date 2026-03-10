/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SemanticVisitor.h"
#include "AST/SIdentifierNode.h"
#include "AST/SAssignmentNode.h"
#include "AST/SMessageNode.h"
#include "AST/SBlockNode.h"
#include "AST/SMethodNode.h"
#include "AST/SReturnNode.h"
#include "AST/SBraceNode.h"
#include "AST/SCascadeNode.h"
#include "AST/SCommentNode.h"
#include "AST/SSelectorNode.h"
#include "AST/SNumberNode.h"
#include "AST/SStringNode.h"
#include "AST/SPragmaNode.h"
#include "AST/SLiteralNode.h"
#include "SSmalltalkCompiler.h"
#include "Binding/Binding.h"
#include "Binding/ScriptScope.h"

namespace Egg {

SemanticVisitor::SemanticVisitor() {
    _inliner = new MessageInliner();
}

SemanticVisitor::~SemanticVisitor() {
    delete _inliner;
}


void SemanticVisitor::analyzeAssignment_(SAssignmentNode* anAssignmentNode) {
    auto& assignees = anAssignmentNode->assignees();
    for (auto v : assignees) {
        analyzeIdentifier_assignee_(v, true);
    }
}

void SemanticVisitor::analyzeBlock_while_(SBlockNode* aBlockNode, std::function<void()> aBlock) {
    if (!aBlockNode->isInlined()) {
        aBlockNode->index_(aBlockNode->compiler()->blockIndex());
    }
    analyzeScript_while_(aBlockNode, aBlock);
}

void SemanticVisitor::analyzeIdentifier_(SIdentifierNode* anIdentifierNode) {
    analyzeIdentifier_assignee_(anIdentifierNode, false);
}

void SemanticVisitor::analyzeIdentifier_assignee_(SIdentifierNode* anIdentifierNode, bool aBoolean) {
    anIdentifierNode->resolveAssigning_(aBoolean);
    if (aBoolean) {
        anIdentifierNode->beAssigned();
    }
    
    auto compiler = anIdentifierNode->compiler();
    SScriptNode* script = compiler->activeScript();
    Binding* binding = anIdentifierNode->binding();
    
    if (script && binding) {
        script->reference_(binding);
    }
    
    if (binding && binding->isLocal()) {
        binding = script->scope()->captureLocal_(binding);
    }
    
    anIdentifierNode->binding_(binding);
}

void SemanticVisitor::analyzeMessage_(SMessageNode* aMessageNode) {
    _inliner->inline_(aMessageNode);
    if (!aMessageNode->isInlined()) {
        aMessageNode->compiler()->noticeSend();
    }
}

void SemanticVisitor::analyzeMethod_while_(SMethodNode* aMethodNode, std::function<void()> aBlock) {
    analyzeScript_while_(aMethodNode, aBlock);
}

void SemanticVisitor::analyzeReturn_(SReturnNode* aReturnNode) {
    auto compiler = aReturnNode->compiler();
    SScriptNode* activeScript = compiler->activeScript();
    if (activeScript) {
        SScriptNode* realScript = activeScript->realScript();
        if (realScript) {
            realScript->captureHome();
        }
    }
}

void SemanticVisitor::analyzeScript_while_(SScriptNode* aScriptNode, std::function<void()> aBlock) {
    aScriptNode->compiler()->activate_while_(aScriptNode, aBlock);
}


void SemanticVisitor::visitAssignment_(SAssignmentNode* node) {
    analyzeAssignment_(node);
    SParseNode* expression = node->expression();
    if (expression) {
        expression->acceptVisitor_(this);
    }
}

void SemanticVisitor::visitBlock_(SBlockNode* node) {
    analyzeBlock_while_(node, [this, node]() {
        auto& statements = node->statements();
        for (auto stmt : statements) {
            stmt->acceptVisitor_(this);
        }
    });
}

void SemanticVisitor::visitBrace_(SBraceNode* node) {
    if (!node->isLiteral()) {
        SParseNode* asMessage = node->asSMessageNode();
        if (asMessage && asMessage->isMessage()) {
            asMessage->acceptVisitor_(this);
        }
    }
}

void SemanticVisitor::visitCascade_(SCascadeNode* node) {
    SParseNode* receiver = node->receiver();
    if (receiver) {
        receiver->acceptVisitor_(this);
    }
    
    auto& messages = node->messages();
    for (auto msg : messages) {
        msg->acceptVisitor_(this);
    }
}

void SemanticVisitor::visitIdentifier_(SIdentifierNode* node) {
    analyzeIdentifier_(node);
}

void SemanticVisitor::visitMessage_(SMessageNode* node) {
    analyzeMessage_(node);
    
    SParseNode* receiver = node->receiver();
    if (receiver) {
        receiver->acceptVisitor_(this);
    }
    
    auto& arguments = node->arguments();
    for (auto arg : arguments) {
        arg->acceptVisitor_(this);
    }
}

void SemanticVisitor::visitMethod_(SMethodNode* node) {
    analyzeMethod_while_(node, [this, node]() {
        node->bindLocals();
        
        auto& statements = node->statements();
        for (auto s : statements) {
            s->acceptVisitor_(this);
        }
        
        node->positionLocals();
    });
}

void SemanticVisitor::visitReturn_(SReturnNode* node) {
    SParseNode* expression = node->expression();
    if (expression) {
        expression->acceptVisitor_(this);
    }
    analyzeReturn_(node);
}


void SemanticVisitor::visitLiteral_(SLiteralNode* node) {
}

void SemanticVisitor::visitComment_(SCommentNode* node) {
}

void SemanticVisitor::visitSelector_(SSelectorNode* node) {
}

void SemanticVisitor::visitNumberNode_(SNumberNode* node) {
}

void SemanticVisitor::visitString_(SStringNode* node) {
}

void SemanticVisitor::visitPragma_(SPragmaNode* node) {
}

void SemanticVisitor::visitPrimitivePragma_(SPragmaNode* node) {
}

void SemanticVisitor::visitFFIPragma_(SPragmaNode* node) {
}

void SemanticVisitor::visitSymbolicPragma_(SPragmaNode* node) {
}

} // namespace Egg
