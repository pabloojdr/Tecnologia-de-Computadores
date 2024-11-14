.data
string:  .ascii "Follow the white rabbit."
end: .byte 0
checksum:   .word 1869902693, 560950816

.text
main:
ldr r0, =string   @ cargamos en r0 dir comienzo string
mov r2, #'a'
mov r3, #'z' 
mov r5, #46

loop:
ldrb r1, [r0], #1 @ cargamos en r1 siguiente car�cter
						@ de la posici�n apuntada por r0 e incrementa r0
cmp r1, #0        @ vemos si el car�cter le�do es 0 (fin cadena)
beq exit 			@ si es el caso, terminamos (saltamos a exit)
cmp r1, r2     	@ comparamos car�cter con 'a'
blt loop 			@ si es menor volvemos al comienzo (sig. car�c.)
cmp r1, r3	   	@ comparamos car�cter con 'z'
bgt loop         	@ si es mayor volvemos al comienzo (sig. car�c.)
sub r1, r1, #32   @ convertimos car�cter en may�scula
strb r1, [r0, #-1] @ almacenamos car�cter en la posici�n ant.
b loop            @ volvemos al comienzo

exit:
bx lr @ terminamos el programa