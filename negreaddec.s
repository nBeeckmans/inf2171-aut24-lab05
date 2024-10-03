# readdec.s : avec les negatifs 
# lire un nombre entier pas decimal 
# ecrire ce nombre (avec print int)

	.eqv Exit     10 
	.eqv ReadChar 12 
	.eqv PrintInt 1
	
	
.text 
	li s0, 0  # s0 contient le nombre final 
	li s1, 0  # marqueur de negatif
	li a7, ReadChar 
	
	
	li t0, '0'
	li t1, '9'
	li t3, '-' 
	li t2, 10   # facteur de multiplication 
	
	ecall 
	
	bne t3, a0, passer_marqueur
	# si premier char == '-', on met s1 (marqueur a 1) 
	# et on lit prochain char 
	li s1, 1 
	ecall 
passer_marqueur: 

loop_lecture : 
	blt a0, t0, fin_loop_lecture   # si a0 < '0' : break;
	bgt a0, t1, fin_loop_lecture   # si a0 > '9' : break;
	
	addi a0, a0, -48              # ex : '9' = 57, '0' = 48 donc :   
				      # '9' - '0' = 57 - 48 = 9  
	mul s0, s0, t2
	add s0, s0, a0 
	
	ecall 
	j loop_lecture 
fin_loop_lecture : 

	beqz s1, passer_negation      # 
	not  s0, s0 		      # Inversion des bits 
	addi s0, s0, 1   
passer_negation : 
	li a7, PrintInt 
	mv a0, s0 
	ecall 
	
	li a7, Exit
	ecall 

	