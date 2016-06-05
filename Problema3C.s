.data
ENTRADA: .word 10

SAIDA: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 #somente para guardar espaco

.text

main:
  la $t0, ENTRADA
  lw $t1, 0($t0)      #Carrega em $t1 o N($t0)
  
  la $t0, SAIDA
  li $t2, 1 	      #carrega o primeiro elemento da sequencia em $t2
  sw $t2, 0($t0)      #Grava esse elemento na memoria

  li $s2, 2	      #carrega o segundo elemento da sequencia em $s2
  addi $t0, $t0,4     #$t0 agora aponta para o proximo endereco (espaco disponivel na sequencia)
  sw $s2, 0($t0)      # Grava esse elemento na memoria
  
   
  li $t4, 3           #coloca 3 no $t4
  slt $t3, $t1, $t4   # Compara se n<3
  bne $0, $t3, FIM    #se a condicao acima for falsa, encerra o programa (se $t3 diferente de 0)
  
  li $s1, 1000000007 #coloca 1000007 em $s1
  
  # $t4 = i
  
Loop:
  slt $t3, $t1, $t4  #testa se N<i (reposta V = 1)
  bne $0, $t3, FIM   #testa de a resposta foi 0
  
  move $t7,$s2       #joga o valor do segundo elemento para uma aux
  add $t5, $t2, $s2  #soma elemento 1 com elemento 2
  addi $t5, $t5, -1  #subtrai 1 da soma anterior
  div $t5, $s1       #divisao, cujo resultado e resto vao para hi/lo
  mfhi $t5           #poe o resto da divisao no n2
  move $t2, $t7      #n1 recebe aux
  addi $t0, $t0,4    #$t0 agora aponta para o proximo endereco (espaco disponivel na sequencia)
  move  $t2, $t7     #atualiza o elemento 1
  move  $s2, $t5     #atualiza o elemento 2
  sw $t5, 0($t0)     #grava o elemento seguinte na memoria
          
  addi $t4, $t4, 1 #i++
  j Loop #volta pro loop

FIM:


