.data 

.text
main:
	
	addiu $t1,$0,100
	addiu $t2,$0,50
	
a:
	addiu $t3,$t3,4
	addiu $t1,$t2,1
	addiu $t2,$t1,1
	sw $t1,($t3)
	lw $t1,-4($t3)
	
	j a
