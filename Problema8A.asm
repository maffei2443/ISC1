.data
ENTRADA: .word 9, 76, 55, 91, 1
SAIDA: .word 0, 0, 0, 0, 0

.text

MERGESORT:
		la $s3, ENTRADA		#Carrega no registrador o endereço para o primeiro elemento do vetor a ser ordenado
		la $s2, SAIDA		
		#li $s0, 0		#Não mais ncessário, pois p sempre será zero
		li $s1, 4		# r = 4 == 5 - 1 (indice do último elemento do vetor)
		li $t1, 1		# m == 1		
FOR1:
		li $t0, 0		#Reseta o 'i' a cada vez que sai do 'FOR2' E na primeira vez que entra.
		jal FOR2		
SAIUFOR2:	sll $t1, $t1, 1		#m == m+m == 2m == m deslocado de 1 à esquerda
		bgt  $t1, $s1, FIM
		j FOR1		
FOR2:
		sub $t7, $s1, $t1	#$t7 = R - m
		bgt $t0, $t7, SAIUFOR2
		jal MERGE
		add $t8, $t1, $t1	# $t8 = m + m
		add $t0, $t0, $t8	# i = i + m + m
MERGE:
	j MIN
aindamerge:
	add $s4, $t0, $0
	add $s5, $t1, $t0
	addi $s5, $s5, -1	#Finalmente, $s5 é o terceiro parâmetro da função 'merge'
	
							
						

v


MIN:
	add $t9, $t0, $t1	# $t9 = i + m
	add $t9, $t9, $t1	# $t9 = i + m + m
	addi $t9, -1		# $t9 = i + m + m - 1
	blt $t9, $s1, T9
	bge $t9, $s1, R
	
T9:# T9 é menor
	add $s0, $t9, $0
	j aindamerge
S1:# s1 é menor
	add $s0	, $s1, $0
	j aindamerge		

FIM:		