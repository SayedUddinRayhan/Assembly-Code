org 100h
mov ax, 4000h
add ax, ax
sub ax, 0ffffh
neg ax
inc ax
mov ah,4ch
int 21h

ret