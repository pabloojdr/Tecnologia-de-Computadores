.text
 push {lr}   
 mov r0, #6 
 bl fib      
 mov r1, r0 
  
 mov r0, #1  
 bl fib      
 mov r2, r0 
  
 mov r0, #-8
 bl fib      
 mov r3, r0
   
 pop {lr}    
 bx lr  

     
fib:
push {r1-r2}
mov r1, #0
mov r2, #1

loop:
cmp r0, #0
beq exit
movlt r1, #-1
blt exit

add r3, r1, r2
mov r1, r2
mov r2, r3
sub r0, #1
b loop

exit:
mov r0, r1
pop {r1-r2}
bx lr