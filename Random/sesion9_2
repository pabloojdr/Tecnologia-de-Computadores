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
 ldr r2, =c
 ldr r2, [r2]
 ldr r3, =d
 ldr r3, [r3]
 bl maximo
 ldr r1, =res
 str r0, [r1]
 pop {lr}
 bx lr
 
maximo:
cmp r0, r1
movlt r0, r1
cmp r0, r2
movlt r0, r2
cmp r0, r3
movlt r0, r3
bx lr