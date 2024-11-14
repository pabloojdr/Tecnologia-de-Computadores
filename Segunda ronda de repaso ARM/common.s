.data

cadena: .asciz "Hola,estoes un a prueba"

res: .ascii ""

.text
 push {lr}
 ldr r0, =cadena // en r0 (parametro1) cargamos direccion de la cadena
 bl common // llamamos a la funcion
 ldr r1, =res
 strb r0, [r1] // almacenamos en res el valor devuelto por la funcion(r0) (un byte strB)
 pop {lr}
 bx lr

common: // aqui tu funcion common
push {r4-r12, lr}
mov r4, r0
mov r6, #0
mov r7, r0
mov r8, #0

loop1:
ldrb r5, [r4], #1

cmp r5, #0
beq salida

mov r1, r5
mov r0, r7
bl chcount
mov r9, r0

cmp r6, r9
movlt r6, r9
movlt r8, r5

b loop1


salida:
mov r0, r8
pop {r4-r12, lr}
bx lr

chcount: // aqui la funcion chcount
mov r3, #0

loop:
ldrb r2, [r0], #1
cmp r2, #0
beq exit
cmp r2, r1
addeq r3, #1
b loop

exit:
mov r0, r3
bx lr