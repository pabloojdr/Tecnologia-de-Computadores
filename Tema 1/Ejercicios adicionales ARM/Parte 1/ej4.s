.data
tam:           .word 8
vect:          .word 64,25,9,23,56,77,87,100
res:           .word 0
.text
.global main
main:
push {lr}
ldr r0, =vect          @ Cargamos direccion del vector en r0
ldr r1, =tam          
ldr r1, [r1]           @ Cargamos longitud del vector en r1
ldr r4, =res           @ Cargamos la direccion de res en r4
bl maxones             @ Invocamos funcion
str r0, [r4]           @ Guardamos el resultado en res
pop {pc}               @ Finalizamos el programa
        
ones:    @Codigo de la funcion que devuelve el numero de 1s en la
         @representación binaria de un valor de entrada.
         @(Hay que llamarla desde maxones y no se puede modificar)
mov r2, #0
onesloop:
and r3, r0, #1
add r2, r2, r3
lsrs r0, #1
bne onesloop
mov r0, r2
bx lr
 
maxones:
push {r5-r10, lr}
mov r5, r0
mov r10, r1
mov r6, #0
mov r7, #0
mov r8, #0
mov r9, #0

loop:
cmp r10, #0
beq salida
ldr r0, [r5], #4
mov r9, r0
bl ones
cmp r0, r6
movge r6, r0
movge r8, r9
sub r10, #1
b loop


salida:
mov r0, r8
pop {r5-r10, lr}
bx lr
