/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _SCOMPILEDBLOCK_H_
#define _SCOMPILEDBLOCK_H_

namespace Egg {

class SCompiledMethod;

/**
 * Compiled block representation
 * Corresponds to SCompiledBlock in Smalltalk
 */
class SCompiledBlock {
private:
    SCompiledMethod* _method;
    
public:
    SCompiledBlock() : _method(nullptr) {}
    
    SCompiledMethod* method() const { return _method; }
    void method_(SCompiledMethod* m) { _method = m; }
    
    bool isBlock() const { return true; }
};

} // namespace Egg

#endif // _SCOMPILEDBLOCK_H_
