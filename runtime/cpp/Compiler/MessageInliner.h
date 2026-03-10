/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _MESSAGE_INLINER_H_
#define _MESSAGE_INLINER_H_

#include <string>

namespace Egg {

class SMessageNode;

/**
 * Message inliner for control-flow optimization
 * Corresponds to MessageInliner in Smalltalk
 */
class MessageInliner {
private:
    SMessageNode* _message;
    
    void inlineConditional();
    void inlineIfNotNil();
    void inlineIfNilIfNotNil();
    void inlineIfNotNilIfNil();
    void inlineRepeat();
    void inlineToDo();
    void inlineToByDo();
    void inlineUnitaryWhile();
    void inlineWhile();
    
public:
    MessageInliner() : _message(nullptr) {}
    virtual ~MessageInliner() {}
    
    void inline_(SMessageNode* aMessageNode);
};

} // namespace Egg

#endif // _MESSAGE_INLINER_H_
