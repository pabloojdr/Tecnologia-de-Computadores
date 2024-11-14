.data
res: .word 0
cadena: .asciz "Hola, esto es una prueba"
char: .ascii "a"


.text
 push {lr}
 ldr r0, =cadena // en r0 cargamos direccion de la cadena
 ldr r1, =char 
 ldrb r1, [r1] // en r1 el caracter a buscar
 bl chcount // llamamos a la funcion
 ldr r1, =res 
 str r0, [r1] // almacenamos en res el valor devuelto por la funcion (r0)
 pop {lr}
 bx lr

chcount: // aqui tu funcion
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