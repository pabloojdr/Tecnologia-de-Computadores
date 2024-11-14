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
 bl histo // llamamos a la funcion
 pop {lr}
 bx lr

histo: // aqui tu funcion histo
push {r4-r12, lr}
mov r4, r0
mov r5, r1
mov r6, r2
mov r7, r3
mov r8, #2

loop1:
cmp r8, #0
beq salida

mov r0, r5
ldr r2, [r4], #4
mov r1, r6

bl count

str r0, [r7], #4
sub r8, #1

b loop1


salida:
pop {r4-r11, lr}

count: 
	push {r4}
	mov r3, #0
	
	loop:
		cmp r1, #0
		beq final

		ldr r4, [r0], #4

		cmp r4, r2
		addeq r3, r3, #1
		sub r1, r1, #1
		b loop

	final: 
		mov r0, r3
		pop {r4}
		bx lr


