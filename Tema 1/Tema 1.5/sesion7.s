.data
fib: .word 0
n: .word 5

.text
.global main
ldr r0, =fib	@cargamos la direccion de memoria fib en el registro 0
ldr r1, [r0]   @cargamos en r1 el valor que tiene la posicion de memoria que indica r0
ldr r0, =n
ldr r2, [r0]
mov r3, #0
mov r4, #1
mov r5, #0

for:
cmp r5, r2
bge done
add r1, r3, r4
mov r3, r4
mov r4, r1
add r5, r5, #1
b for

done:
mov r1, r3
ldr r0, =fib
str r1, [r0]  @guardamos r1 en la posicion de memoria indicada por r0

bx lr


