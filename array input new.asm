include 'emu8086.inc'
org 100h
    define_scan_num
    define_print_string
    define_print_num   
    define_print_num_uns
.data
    arr db 10 dub(?)   
.code
main proc  
    mov ax,@data
    mov ds,ax
    
    xor bx,bx
    mov cx,10
    
    mov ah,1
    for:
        int 21h
        mov arr[bx],al
        inc bx
    loop for
    
    xor bx,bx
    mov cx,10
    
    printn
    mov ah,2
    for1:
        mov dl,arr[bx]
        int 21h
        inc bx
    loop for1        
 
      
    
     
    
ret
