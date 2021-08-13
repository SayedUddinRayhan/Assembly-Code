include 'emu8086.inc'
org 100h 

.data
     
.code
main proc  
    print "Enter the string: "
    mov ah,1
    
    xor cx,cx
    
    input:
        int 21h
        cmp al,0dh
        je exit_input
        push ax
        inc cx
        jmp input
    exit_input:
    
    printn
    print "Reversed string: "
    mov ah,2
          
    output:
        pop dx
        int 21h
    loop output            
        
    exit:
    mov ah,4ch
    int 21h

ret