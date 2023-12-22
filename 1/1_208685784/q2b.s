# Declare the assembly flavor to use the intel syntax.
.intel_syntax noprefix

# Define a symbol to be exported from this file.
.global my_function

# Declare symbol type to be a function.
.type my_function, @function

# Code follows below.
# id_number: 208685784

my_function:
    # <<<< PUT YOUR CODE HERE >>>>
    # TODO:
    # 1. Read the input to the function from the stack.
    PUSH EBX
    MOV EBX, DWORD PTR [ESP + 8]
    # 2. Save the result in the register EAX (and then return!).
    #case equal to 1
    CMP EBX, 1
    JE _CASE_1
    CMP EBX, 0
    #case smaller than 0
    JE _CASE_0
    JL _CASE_0
    MOV EAX, 1
    MOV ECX, 0
    #looping if not edge cases
    _LOOP:
        MOV EDX, EAX
        IMUL ECX, ECX
        IMUL EAX, EAX
        ADD EAX, ECX
        MOV ECX, EDX
        DEC EBX
        CMP EBX, 2
        JGE _LOOP
        JMP _END
    _CASE_0:
        MOV EAX, 0
        JMP _END
    _CASE_1:
        MOV EAX, 1
    _END:
        POP EBX
        RET
        
        
