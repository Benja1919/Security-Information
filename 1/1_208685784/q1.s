# Declare the assembly flavor to use the intel syntax.
.intel_syntax noprefix

# Define a symbol to be exported from this file.
.global my_function

# Declare symbol type to be a function.
.type my_function, @function

# Code follows below.
# id_number: 208685784

my_function:
    # This code reads the first argument from the stack into EBX.
    # (If you need, feel free to edit/remove this line).
    PUSH EBX
    MOV EBX, DWORD PTR [ESP + 8]

    # <<<< PUT YOUR CODE HERE >>>>
    # TODO:
    # 1. Read the input to the function from EBX.
        CMP EBX, 1
        JL _CASE_OTHER #case of smaller than 1
        
    # loop over the numbers until (if) reaching square
        MOV ECX, 1
        _LOOP:
            MOV EDX, ECX
            IMUL EDX, EDX
            CMP EDX, EBX    #check if equal
            JE _CASE_SUC
            JG _CASE_OTHER  #case of not integer
            INC ECX
            JMP _LOOP
            
            
    # 2. Save the result in the register EAX.
        _CASE_OTHER:
            POP EBX
            MOV EAX, 0
            JMP _END
            
        _CASE_SUC:
            POP EBX
            MOV EAX, ECX
            JMP _END

    # This returns from the function (call this after saving the result in EAX).
    # (If you need, feel free to edit/remove this line).
    _END:
        RET
