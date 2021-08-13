include "emu8086.inc"
org 100h 

.data
    a db "Enter first number: $"
    b db 10,13,"Enter second number: $"
    c db 10,13,"Differences of two numbers are: $"
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al  
    
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    
    mov ah,9
    lea dx,c
    int 21h
    
    sub bl,bh 
    add bl,48
    mov ah,2
    mov dl,bl
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    
ret