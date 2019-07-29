; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here 
    
    mov ax , 2
    neg ax
    cmp ax , 0
    
    jl n
    je e
    jg p
    
    n:
        mov bx , 1
        neg bx
        jmp exit
        
    e:
        mov bx , 0
        jmp exit
        
    p:
        mov bx , 1
        
    exit:
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.