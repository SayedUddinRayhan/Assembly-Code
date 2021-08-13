.model small
.stack 100h
.data

.code
main proc
    mov cx,ax
    cmp bx,cx
    jle next
    
    mov cx,bx 
    next:
    top:
    dec cx
    jnz bottom
    jmp exit
    
    bottom:
    jmp top
    
    exit:     
    mov ah,4ch
    int 21h
    
    main endp
end main