.model small
.stack 100h
.data

.code
main proc
    mov ax, -5

    cmp ax, 0
    jg exit

    neg ax 
    
    exit:     
    mov ah,4ch
    int 21h
    
    main endp
end main