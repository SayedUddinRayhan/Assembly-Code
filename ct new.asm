include 'emu8086.inc'
org 100h
    define_scan_num
    define_print_string
    define_print_num   
    define_print_num_uns
.data
   
.code
main proc  
    mov ax,@data
    mov ds,ax
    
 
 
      
    exit:  
    lea si, ans 
    
    call print_string
    call print_num 
     
    
ret
