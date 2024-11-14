@EJEMPLO FUNCION 
@funcion(in (r0 .word), out (r1 .byte), tam (r2))
@--> out[i] = ones/r0/(in[i])
@Esta funcion nos la dan
@la funcion cuenta los unos que tiene cada elemento de una array en binario y devuelve

.data:
vect: .word 1, 2, 3, 4, 5, 6, 7, 8
out: .byte 0, 0, 0, 0, 0, 0, 0, 0

.text
main:
push {lr}

ldr r0, =vect
ldr r1, =out
mov r2, #8
bl countones

pop {lr}
bx lr

countones: @funcion no-hoja (llama a otra funcion)
push {r4-r11, lr} @Como no se cual voy a utilizar, salvo a todos los registros (voy a usar estos porque esta funcion llama a otra y perdemos del r0-r3)
mov r4, r0 @(=vect)
mov r5, r1 @(=out)
mov r6, r2 @(#2)

loop:
cmp r6, #0
beq exit
ldr r0, [r4], #4 @(lo cargo en r0 porque la otra funcion va a recibir el parametro por r0)
bl ones
strb r0, [r5], #1 @el array out es de bytes, por tanto tengo que usar strb y aumentarlo 1
sub r6, r6,#1
b loop



ones: @funcion hoja, no guarda lr porque no llama a otra funcion
@AND 00000...01 este va a dar un 1 porque termina en 1, si terminase en 0 me daria un 0
mov r3, #0

loop1:
cmp r0, #0
beq exit1
and r1, r0, #1
cmp r1, #1
addeq r3, #1 @No es necesario poner los dos r3
lsr r0, #1
bl loop1

exit1:
mov r0, r3
bx lr

exit:
pop {r4-r6, lr} @Solo hemos usado r4, r5 y r6
bx lr