.data
input: .asciiz "input an integer: "

.text
.main:
	# print
	li $v0, 4
	la $a0, input
	syscall
	
	# save constants
	la $s1, 1
	la $s5, 10
	
	# get input
	li $v0, 5
	syscall
	move $a0, $v0
	
	# recursion
	jal product
	
	# print product ($a0)
	move $a0, $s1
	li $v0, 1	
	syscall
	
	# exit program
	li $v0, 10
	syscall

product:
   	# store $a0 and $ra
	addi $sp, $sp, -8
	sw $a0, 4($sp)
	sw $ra, 0($sp)
	
	# when $a0 is zero, return
	beqz $a0, return
	
	#calculation
	move $t0, $a0
	div $t0, $s5
	mfhi $t1
	mflo $a0
	mul $s1, $s1, $t1
	jal product
	
return: 
	# load $a0 and $ra
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8
		
	# return
	jr $ra
