.data

res: .word 0


.text

main:

  push {lr}

  mov r1, #2

  mov r2, #3

  bl maximo

  mov r1, r0



  mov r2, #4

  bl maximo

  ldr r1, =res

  str r0, [r1]

  pop {lr}

  bx lr



@ variable para almacenar resultado




@ guardamos contenido registro lr

@ primer valor a comparar en r1

@ segundo valor a comparar en r2

@ llamada a la función maximo

@ el resultado de la función maximo 

@ (r0) lo pasamos a r1 para compararlo

@ segundo valor a comparar en r2

@ llamada a la función maximo

@ cargamos en r1 dir. de variable res.

@ almacenamos resultado en res

@ restauramos contenido registro lr

@ terminamos programa principal (main)

maximo:

  cmp r1, r2

  movgt r0, r1

  movle r0, r2

  bx lr