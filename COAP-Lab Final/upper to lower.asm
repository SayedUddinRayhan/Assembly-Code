include "emu8086.inc"
org 100h 

.data
    a db "Enter the String to Convert into Lowercase: $"
    b db 10,13,"Given String in Lowercase: $"
    str1 db 255 dup(?)
    one  db ?
    two  db ? 
    
.code
begin:
    mov AX,@data
    mov ds,ax
    
    lea dx,a
    mov ah,09h
    int 21h
    
    lea SI,str1
    mov AH,01h

read:
    int 21h
    mov bl,al
    
    cmp al,0dh
    je  display
    
    xor al,20h
    mov [si],al
    inc si
    
    jmp read
          


display:

    mov al,'$'
    mov [si],al
    
    lea dx,b
    mov ah,09h
    int 21h
    
    
    lea dx,str1
    mov ah,09h
    int 21h
    
    
    
    exit:
    mov ah,4ch
    int 21h

ret