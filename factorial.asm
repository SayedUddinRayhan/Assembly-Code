include "emu8086.inc"
org 100h   
    
    define_scan_num
    define_print_string
    define_print_num   
    define_print_num_uns
    
.data
    m dw ?
    n db "Enter a number: $"
    ans db 10,13, "Result: ",0
      
.code
main proc                                
    mov dx, offset n
    mov ah, 9 
    int 21h
    call scan_num
    mov m,cx
    
    mov bx, 1
    mov ax, 1 
    jmp label
    
    label:
    mul bx
    inc bx
    cmp bx,m
    ja exit
    jmp label
    
    exit:
    lea si, ans
    call print_string
    call print_num 
  
ret
