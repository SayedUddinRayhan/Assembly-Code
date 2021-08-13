org 100h
.data
    msg db 'This is a Message.$' 
.code
main proc
    mov ax,20h
    mov dx,20h
    
    push ax
    push dx
    
    mov ah,9
    mov dx,offset msg
    int 21h
    
    pop dx
    pop ax
    
    mov ax,4c00h
    int 21h
    
    exit:
    mov ah,4ch
    int 21h

    main endp
end main