include 'emu8086.inc'
org 100h

.data
    
.code
main proc  
    print "Enter binary number: "
    mov bx,0
    mov ah,1 
    
    for1:
    int 21h
    
    cmp al,0dh
    je end_for1
    sub al,30h
    shl bx,1
    or bl,al
    jmp for1
    
    end_for1:
    printn
    printn
    
    print "Equivalent Decimal number: "
    mov ah,2
    add bl,30h
    mov dl,bl
    int 21h
    
    exit:
    mov ah,4ch
    int 21h

ret