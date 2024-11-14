.data
tam: .word 11
vector1: .word 1, 2
vector2: .word 1, 2, 1, 2, 3, 2, 4, 1, 2, 2, 3
vector3: .word 0, 0

.text
 push {lr}
 ldr r0, =vector1 // en r0 cargamos direccion del vector1
 ldr r1, =vector2 // en r1 cargamos direccion del vector2
 ldr r2, =tam 
 ldr r2, [r2] // en r2 el tamaño del vector
 ldr r3, =vector3 // en r3 cargamos direccion del vector3
 bl histo // llamamos a la 

 pop {lr}
 bx lr

histo: // aqui tu funcion histo
push {r4-r8, lr}
mov r4, #0
mov r5, r0
mov r6, r1
mov r7, r2
mov r8, r3

loop1:
cmp r4, #2
beq salida
mov r0, r6
mov r1, r7
ldr r2, [r5], #4
bl count
str r0, [r8], #4
add r4, #1
b loop1

salida:
pop {r4-r8, lr}
bx lr

count: @aqui tu funcion
push {r4}
mov r3, #0

loop:
ldr r4, [r0], #4
cmp r1, #0
beq exit
cmp r4, r2
addeq r3, #1
sub r1, #1
b loop


exit:
mov r0, r3
pop {r4}
bx lr