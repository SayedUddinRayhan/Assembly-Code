include 'emu8086.inc'
org 100h
    
.data
    var1  db  "The Array elements are : $"
    printn
    result db "The Sum of the Array is = $"

    arr db 5,10,15,20,25,30,35,40,45,50
.code
main proc  
    mov ax,@data
    mov ds,ax
    
    mov bx, 10                   ; set BX=10

     lea dx, var1               ; load and display the string PROMPT
     mov ah, 9                                                    
     int 21h

     mov cx, bx                   ; set CX=BX
     lea si, arr                ; set SI=offset address of ARRAY

     @loop:                       ; loop label
       xor ah, ah                 ; clear AH
       mov al, [si]               ; set AX=[SI]

       call OUTDEC                ; call the procedure OUTDEC

       inc si                     ; set SI=SI+1

       mov ah, 2                  ; set output function
       mov dl, 20h                ; set DL=20H
       INT 21H                    ; print a character
     loop @loop                   ; jump to label @LOOP while CX!=0

     lea dx, result               ; load and display the string RESULT
     mov ah, 9
     int 21h

     lea si, arr                ; set SI=offset address of ARRAY

     call sum                     ; call the procedure SUM
     call outdec                  ; call the procedure OUTDEC

     
       SUM PROC
   ; this procedure will calculate the sum of an array
   ; input : SI=offset address of the array
   ;       : BX=size of the array
   ; output : AX=sum of the array

   PUSH CX                        ; push CX onto the STACK
   PUSH DX                        ; push DX onto the STACK

   XOR AX, AX                     ; clear AX
   XOR DX, DX                     ; clear DX
   MOV CX, BX                     ; set CX=BX

   @SUM:                          ; loop label
     MOV DL, [SI]                 ; set DL=[SI]
     ADD AX, DX                   ; set AX=AX+DX
     INC SI                       ; set SI=SI+1
   LOOP @SUM                      ; jump to label @SUM while CX!=0

   POP DX                         ; pop a value from STACK into DX
   POP CX                         ; pop a value from STACK into CX

   RET                            ; return control to the calling procedure
 SUM ENDP
     
     
     OUTDEC PROC
   

       PUSH BX                        ; push BX onto the STACK
       PUSH CX                        ; push CX onto the STACK
       PUSH DX                        ; push DX onto the STACK
    
       CMP AX, 0                      ; compare AX with 0
       JGE @START                     ; jump to label @START if AX>=0
    
       PUSH AX                        ; push AX onto the STACK
    
       MOV AH, 2                      ; set output function
       MOV DL,0                   ; set DL=\'-\'
       INT 21H                        ; print the character
    
       POP AX                         ; pop a value from STACK into AX
    
       NEG AX                         ; take 2\'s complement of AX
    
       @START:                        ; jump label
    
       XOR CX, CX                     ; clear CX
       MOV BX, 10                     ; set BX=10
    
       @OUTPUT:                       ; loop label
         XOR DX, DX                   ; clear DX
         DIV BX                       ; divide AX by BX
         PUSH DX                      ; push DX onto the STACK
         INC CX                       ; increment CX
         OR AX, AX                    ; take OR of Ax with AX
       JNE @OUTPUT                    ; jump to label @OUTPUT if ZF=0
    
       MOV AH, 2                      ; set output function
    
       @DISPLAY:                      ; loop label
         POP DX                       ; pop a value from STACK to DX
         OR DL, 30H                   ; convert decimal to ascii code
         INT 21H                      ; print a character
       LOOP @DISPLAY                  ; jump to label @DISPLAY if CX!=0
    
       POP DX                         ; pop a value from STACK into DX
       POP CX                         ; pop a value from STACK into CX
       POP BX                         ; pop a value from STACK into BX

   RET                            ; return control to the calling procedure
 OUTDEC ENDP  
ret
                        
 