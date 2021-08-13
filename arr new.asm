include 'emu8086.inc'
org 100h
    define_scan_num
    ;define_print_string
    define_print_num   
    define_print_num_uns
.data
    aList db 10h,20h,30h
    ans db 0
.code
main proc  
    mov ax,@data
    mov ds,ax
    
    lea si,aList
    
    mov bx,offset aList
    mov al,[bx]
    inc bx
    
    add al,[bx]
    inc bx  
    
    add al,[bx]
    mov si,offset ans
    mov [si],al
     
 
    mov ah,2
    add si,9
    mov dl,[si]
    int 21h
     
    
ret


