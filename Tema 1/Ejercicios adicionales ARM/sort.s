.data
tam: .word 8
vector: .word 8,-3,4,-7,1,-7,6,-1


.text
.global main
main:
push {lr}
ldr r1, =tam
ldr r1, [r1]
ldr r0, =vector
bl sort
pop {lr}
bx lr

sort:
push {r4-r12, lr}
mov r4, r1  @tamaño del vector
mov r5, r0  @direccion de memoria del vector
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

blgt intercambiar 

add r8, #1
b loop2

salida2:
add r5, #4
b loop


salida:
pop {r4-r12, lr}
bx lr


intercambiar:
push {r4-r12, lr}
mov r4, r0  @recibe por r0 el primer elemento
mov r5, r1  @recibe por r1 la direccion del primer elemento
mov r6, r2  @recibe por r2 el segundo elemento
mov r7, r3  @recibe por r3 la direccion del segundo elemento

str r4, [r7]
str r6, [r5]

pop {r4-r12, lr}
bx lr

