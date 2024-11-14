.data
vector1:  .word 1,2,3,4,5,6,7,8
vector2:  .word 0,0,0,0,0,0,0,0
len:      .word 8
 
.text
  push {lr}
  ldr r0, =vector1
  ldr r1, =len
  ldr r1, [r1]
  ldr r2, =vector2
  bl reverse
  pop {lr}
  bx lr
 
reverse:
push {r4-r11, lr}
mov r4, r0
mov r5, r1
mov r6, r2

mov r8, r1, LSL #2
add r4, r8
sub r4, #4

loop:
cmp r5, #0
beq salida

ldr r7, [r4], #-4
str r7, [r6], #4

sub r5, #1
b loop

salida:
pop {r4-r11, lr}
bx lr
