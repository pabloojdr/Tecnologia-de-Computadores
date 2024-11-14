.data
tam: .word 3
res: .word 0
datos: .word 2, -3, 6

.text
.global main
main: 

	ldr r0, =tam
@cargamos en el r0 la dirección de memoria de tam
      ldr r1, [r0]
@cargamos en el r1, el valor que contiene la posicion de memoria almacenada en el r0, es decir, la direccion de memoria de tam
      ldr r2, =datos
@cargamos en el r2, la dirrecion de memoria de datos
      mov r3, #0
@cargamos en el r3 la constante 0

loop: cmp r1, #0
@comparamos r1 y constante 0
      beq sal
@si son iguales, saltamos a sal
      ldr r4, [r2], #4
@cargamos en r4, el valor que contiene la posicion de memoria del r2, que contiene la direccion de datos, además, tras la instrucción, sumamos 4 al valor del r2, de forma que saltaríamos al siguiente elementos de la array
      add r3, r3, r4
@añadirmos al r3, el r3 + r4
      sub r1, r1, #1
@quitamos al r1, 1. Es decir, al contador del tamaño de la array, le quitamos uno, disminuyendo en 1 dicho contador
      b loop
@volvemos a saltar al loop

sal:  ldr r0, =res
@etiqueta sal : cargamos en el r0, la dirección de memoria de res
      str r3, [r0]
@cargamos en la posición de memoria de r0, que contiene la dirección de memoria de res, le cargamos los datos de r3, que contiene la suma de r3+r4
      bx lr
@fin del programa