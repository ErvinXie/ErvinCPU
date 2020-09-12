.data 

.text
main:
	addiu $t1,$0,100
	addiu $t2,$0,50
	
a:
	addiu $t1,$t2,1
	addiu $t2,$t1,1
	j a
