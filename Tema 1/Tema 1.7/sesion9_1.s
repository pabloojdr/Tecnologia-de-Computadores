.data
a:   .word 5
b:   .word 7
c:   .word -3
d:   .word 2
res: .word 0

.text
main:
 push {lr}
 ldr r0, =a
 ldr r0, [r0]
 ldr r1, =b
 ldr r1, [r1]
 bl maximo
 ldr r1, =c
 ldr r1, [r1]
 bl maximo
 ldr r1, =d
 ldr r1, [r1]
 bl maximo
 ldr r2, =res
 str r0, [r2]
 pop {lr}
 bx lr
 
 maximo:
  cmp r0, r1
  movlt r0, r1
  bx lr

