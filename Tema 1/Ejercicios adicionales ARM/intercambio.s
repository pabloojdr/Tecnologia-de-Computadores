.data
vector: .word 8,-3,4,-7,1,-7,6,-1
tam: .word 8

.text
.global main
main:
push {lr}
ldr r0, =tam
ldr r0, [r0]
ldr r1, =vector
bl ordenar
pop {lr}
bx lr

ordenar:
push {r4-r11, lr}
mov r4, r0  @tamaño del vector
mov r5, r1  @direccion de memoria del vector
mov r6, #0  @variable i
sub r7, r4, #1 	@restamos 1 para poder recorrer correctamente el array

loop:
cmp r6, r7
bge salida

add r6, #1

mov r12, r5
mov r8, r6

loop2: 
cmp r8, r4
bge salida2

add r12, #4

ldr r9, [r5]
ldr r10, [r12]

cmp r9, r10
ldrgt r0, [r5]
movgt r1, r5
ldrgt r2, [r12]
movgt r3, r12

bl intercambiar 

add r8, #1
b loop2

salida2:
add r5, #4
b loop


salida:
pop {r4-r11, lr}
bx lr


intercambiar:
push {r4-r11}
mov r4, r0  @recibe por r0 el primer elemento
mov r5, r1  @recibe por r1 la direccion del primer elemento
mov r6, r2  @recibe por r2 el segundo elemento
mov r7, r3  @recibe por r3 la direccion del segundo elemento

str r4, [r7]
str r6, [r5]

pop {r4-r11}
bx lr

