.data
ENTRADA: .word 1, 0, 1
FIM:
	li $s2, 1
.text
	la $t0, ENTRADA
	lw $t1, 0($t0)
	lw $t2, 4($t0)
	lw $t3, 8($t0)
	mul $t2, $t2, $t2
	li $t0, -1
	mul $t3, $t3, $t0
	li $t0, 4
	mul $t3, $t0, $t3
	mul $s0, $t3, $t2
	add $t1, $s0, $t2
	bgez $t1, FIM			#Vai para 'FIM' se $s1 é maior ou igal a zero.
	li $s2, 2
	