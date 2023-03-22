.data
string: .asciiz "Ingresar un numero: "
resultado: .word 0 #Almacena el resultado final

.text
.globl main

main:
  li $v0, 4        # Carga el código de impresión de un string en el registro $v0
  la $a0, string   # Carga la dirección del string en el registro $a0
  syscall          # Imprime

  li $v0, 5        # Carga el código de leer un int en el registro $v0
  syscall          # Lee el entero
  move $t0, $v0    # Mueve el numero ingresado en el registro $v0 al registro $t0 (Resultado)

  li $t1, 0        # contador
  li $t2, 0	   # suma

  # Calcula la suma de 1 a n con un lazo while
  loop:
    beq $t1, $t0, end_loop # El lazo se ejecuta hasta que el contador sea igual al numero ingresado
    addi $t1, $t1, 1
    add $t2, $t2, $t1
    j loop  #Salta el lazo
  end_loop:
  # Se guarda el resultado del registro $t2 en la variable resultado
  sw $t2, resultado
  
  li $v0, 1          # Carga el código de impresión de un int en el registro $v0
  lw $a0, resultado  # Carga la dirección de resultado en el registro $a0
  syscall            # Imprime

  # Termina el programa
  li $v0, 10      
  syscall          
