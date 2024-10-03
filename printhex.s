# printhex.s 

	.eqv ReadInt  	5 
	.eqv PrintChar  11
	.eqv Exit     	10
	
.data 

.text 
	li a7, ReadInt 
	ecall 
	mv s0, a0      # on a le nombre dans s0 
	li a7, PrintChar
	li s1, 60
loop: 
	srl s2, s0, s1
	andi a0, s2, 0xF
	
	li t0, 9 
	bgt a0, t0, print_char 
	addi a0, a0, '0'
	j end_print 
print_char : 
	addi a0, a0, -10 
	addi a0, a0, 'A'
end_print:  
	ecall 
	
	addi s1, s1, -4
	bltz s1, fin_loop 
	j loop 
fin_loop: 

	li a7, Exit
	ecall  