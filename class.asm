include 'emu8086.inc'
.model small
.stack 100h
.data

.code
main proc
    mov cl,10
    li:
    print '?'

    dec cl
    jnz li 
    
    exit:
    mov ah,4ch
    int 21h

    main endp
end main 

include 'emu8086.inc'

org 100h

mov cl,10

li:
printn 'a'
dec cl
jnz li

ret