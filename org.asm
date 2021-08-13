include 'emu8086.inc'

org 100h
.data 

.code
main proc
    print 'Enter any number:'
    mov ah,1
    int 21h
    mov bl,al
    
    printn
    print 'output:'
    mov ah,2
    mov dl,bl
    int 21h
    exit:
    mov ah,4ch
    int 21h 
    
ret    

    