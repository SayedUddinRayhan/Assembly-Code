include 'emu8086.inc'
org 100h
.data
    a dw 4
    b dw 1
.code
main proc  
    mov ax,@data
    mov ds,ax
    
    mov ax,5  
    imul a 
    mov a,ax 
    mov ax,12 
    imul b  
    sub a,ax 
    
    exit:
    mov ah,4ch
    int 21h 
    
ret