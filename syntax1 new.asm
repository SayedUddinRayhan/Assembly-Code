include 'emu8086.inc'
org 100h
    define_scan_num
    define_print_string
    define_print_num   
    define_print_num_uns
.data
    msg db "Md Sayed Uddin Rayhan $"
.code
main proc  
    mov ax,@data
    mov ds,ax
    
    lea dx,msg       
    mov ah,9          
    int 21h
 
      
     exit:     
     mov ah,4ch
     int 21h    
ret
