####################################################Calcula se dois vetores s�o ortogonais############################################

.data	
ENTRADA:	
	.word 4, -2, 0, 1, 13, 1, 2, -2, 0
.text

		la $t0, ENTRADA
		li $t1, 4
		lw $s0, 0($t0)		#SALVAR o diferen�a de endere�os entre as entradas
		mul $s1, $s0, $t1 	#Esse ser� o quanto ter� que se pular pra pegar o 1� elementoA e o 1� elementoB
		li $t7, 0		#Flag para o programa parar
		li $s2, 0		#Aqui ficar� guardado o resultado final
VAI:
		addi $t0, $t0, 4
		beq $t7, $s0, FIM
		addi $t7, $t7, 1
		j MULTIPLY
MULTIPLY:
		lw $t2, 0($t0)
		add $t4, $t0, $s1
		lw $t3, 0($t4)
		mul $t5, $t2, $t3
		add $s2, $s2, $t5
		j VAI

FIM:					
		
		