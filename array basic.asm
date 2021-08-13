include "emu8086.inc"
org 100h
.data
   arr db 1,2,3,4,5 
   arr1 dw 65,66,67,68,69
.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;lea si,arr
    lea si,arr1
    
    mov cx,5
    mov ah,2
    
    for:
        mov dl,[si]
        ;add dl,48
        int 21h
        add si,2
        printn
    loop for


ret