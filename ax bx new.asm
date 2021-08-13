.model small    
.stack 200h
.data 

.code
main proc
    mov ax, 80
    mov bx, 60

    cmp ax, bx
    jg label1
    jl label2
    
    label1:
    mov cx, ax
    jmp exit
    
    label2:
    mov cx, bx 
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main 

