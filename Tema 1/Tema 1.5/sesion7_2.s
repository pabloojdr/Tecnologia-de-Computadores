.data
res: .word 0
opcion: .word 2

.text
.global main
ldr r0, =res
ldr r1, [r0]
ldr r0, =opcion
ldr r2, [r0]
mov r4, #0

@CASO 0
cmp r2, #0
moveq r1, #0
beq fin
@CASO 1
cmp r2, #1
moveq r1, r2
beq fin
@CASO 2
cmp r2, #2
addeq r1, r1, r2
beq fin
@CASO 3 (NO USA BREAK)
cmp r2, #3
subeq r1, r4, r2
@DEFAULT
and r1, r1, r2

fin:
ldr r0, =res
str r1, [r0]
bx lr