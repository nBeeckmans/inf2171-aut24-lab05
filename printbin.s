# printbin.s 
# sans acces memoire :P 

	.eqv ReadInt  	5 
	.eqv PrintInt 	1
	.eqv Exit     	10
	
.data 

.text 
	li a7, ReadInt 
	ecall 
	mv s0, a0      # on a le nombre dans s0 
	li a7, PrintInt
	li s1, 63 
loop: 
	srl s2, s0, s1
	andi a0, s2, 1 

	ecall 
	
	addi s1, s1, -1 
	bltz s1, fin_loop 
	j loop 
fin_loop: 
	
	
	
	
	li a7, Exit
	ecall  