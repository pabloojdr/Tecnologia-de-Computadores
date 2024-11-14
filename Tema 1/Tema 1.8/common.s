.data
cadena: .asciz "Hola, esto es un a prueba"
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
push {r4-r11, lr}
mov r4, r0
mov r5, #0
mov r7, #0
mov r10, r0

loop1:
ldrb r6, [r4], #1
cmp r6, r5
beq salida
mov r1, r6
mov r0, r10
bl chcount
mov r9, r0
cmp r7, r9
movlt r7, r9
movlt r11, r6
b loop1


salida:
mov r0, r11
pop {r4-r11, lr}
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