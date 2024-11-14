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
push {r1, r2, r3}
mov r1, #0
mov r2, #1
cmp r0, #1
subgt r0, r0, #1

fib2:
cmp r0, #0
moveq r0, r3
blt negativo
popeq {r1, r2, r3} 
bxeq lr
add r3, r1, r2
mov r1, r2
mov r2, r3
sub r0, r0, #1
b fib2

negativo:
mov r0, #-1
pop {r1, r2}
bx lr