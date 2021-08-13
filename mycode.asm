
org 100h
.data



MOV AX,5 ;AX = 5 
IMUL bx ;AX = 5 x A 
MOV bx,AX ;A a 5 x A 
MOV AX,12 ;AX = 12 
IMUl bx ;AX = 12 x B 
SUB bx,AX ;A c 5 x A - 12 x B 