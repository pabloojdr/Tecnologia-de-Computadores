.data
tam:  .word 6
VECT: .word 1,2,3,4,5,6
RES:  .word 0,0,0,0,0,0


.text
MAIN:
  push {lr}
  ldr r4, =tam
  ldr r4, [r4]
  ldr r5, =VECT
  ldr r6, =RES
  mov r7, #0

loop:
  cmp r7, r4
  beq exit
  ldr r0, [r5], #4
  bl SUM
  str r0, [r6], #4
  add r7, r7, #1
  b loop

exit:
  pop {lr}
  bx lr


SUM:
  mov r1, #0
  mov r2, #0

loopsum:
  cmp r2, r0
  bgt endsum
  add r1, r1, r2
  add r2, r2, #1
  b loopsum

endsum:
  mov r0, r1
  bx lr 