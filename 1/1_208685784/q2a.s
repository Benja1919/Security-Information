# Declare the assembly flavor to use the intel syntax.
.intel_syntax noprefix

# Define a symbol to be exported from this file.
.global my_function

# Declare symbol type to be a function.
.type my_function, @function

# Code follows below.
# id_number: 208685784
# I used the following two websites to for functions ADC and JAE:
# www.felixcloutier.com/x86/adc
# www.unixwiz.net/techtips/x86-jumps

my_function:
    # <<<< PUT YOUR CODE HERE >>>>
    # TODO:
    # 1. Read the input to the function from the stack.
    
    #intialize stack
        PUSH EBP
        MOV EBP, ESP
        SUB ESP, 16
        MOV EAX, [EBP+8]
    #case of smaller than 0
        CMP EAX, 0
        JL _CASE_WRONG
        CMP EAX, 2
    #case recursive
        JAE _SQUARE_BONNACI
        XOR ECX, ECX
        JMP _END
    # 2. Save the result in the register EAX (and then return!).
    # 3. Make sure to include a recursive function call (the recursive function
    #    can be this function, or a helper function defined later in this file).    
        _SQUARE_BONNACI:
        #n-2 arg
            SUB EAX, 2
            PUSH EAX
            CALL my_function
            IMUL EAX, EAX
            IMUL ECX, ECX
            MOV [EBP-8], EAX
            MOV [EBP-4], ECX
            MOV EAX, [EBP+8]
        #n-1 arg
            SUB EAX, 1
            PUSH EAX
            CALL my_function
            IMUL EAX, EAX
            IMUL ECX, ECX
        #sum output
            MOV [EBP-16], EAX
            MOV [EBP-12], ECX
            MOV EAX, [EBP-8]
            MOV ECX, [EBP-4]
            ADD EAX, [EBP-16]
            ADC ECX, [EBP-12]
            JMP _END
        _CASE_WRONG:
            MOV EAX, 0
        _END:
            MOV ESP, EBP
            POP EBP
            RET

        
        
  
