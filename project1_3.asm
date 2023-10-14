.data
equation: .asciiz "2023-3102=" # -1079

.text
.main:
	# set equation to $a0
    	la $a0, equation
    	
    	# constant
	la $s5, 10
	
	# recursion
	jal recursion

recursion:
   	# store $a0 and $ra
	addi $sp, $sp, -8
	sw $a0, 4($sp)
	sw $ra, 0($sp)
	
	# when $a0 is zero, return
	beqz $a0, return
	
	# loading
	lb $t0, ($a0)
	
	# operation
	beq $t0, 43, sign
	beq $t0, 45, sign
	beq $t0, 61, equal

	# calculation
	mul $s0, $s0, $s5 
	
	# cases
	beq $t0, 48, zero
	beq $t0, 49, one
	beq $t0, 50, two
	beq $t0, 51, three
	beq $t0, 52, four
	beq $t0, 53, five
	beq $t0, 54, six
	beq $t0, 55, seven
	beq $t0, 56, eight
	beq $t0, 57, nine
	
	jal recursion

# zero
zero:
	# set $t1
	li $t1, 0
	
	# calculation
	add $s0, $s0, $t1
	
	# incrementing pointer to point to next character
	addi $a0, $a0, 1
	
	# go back to recursion
	jal recursion

# one
one:
	# set $t1
	li $t1, 1
	
	# calculation
	add $s0, $s0, $t1
	
	# incrementing pointer to point to next character
	addi $a0, $a0, 1
	
	# go back to recursion
	jal recursion

# two
two:
	# set $t1
	li $t1, 2
		
	# calculation
	add $s0, $s0, $t1
		
	# incrementing pointer to point to next character
	addi $a0, $a0, 1
	
	# go back to recursion
	jal recursion

# three
three:
	# set $t1
	li $t1, 3
		
	# calculation
	add $s0, $s0, $t1
		
	# incrementing pointer to point to next character
	addi $a0, $a0, 1
	
	# go back to recursion
	jal recursion

# four
four:
	# set $t1
	li $t1, 4
			
	# calculation
	add $s0, $s0, $t1
		
	# incrementing pointer to point to next character
	addi $a0, $a0, 1
	
	# go back to recursion
	jal recursion

# five
five:
	# set $t1
	li $t1, 5
			
	# calculation
	add $s0, $s0, $t1
		
	# incrementing pointer to point to next character
	addi $a0, $a0, 1
	
	# go back to recursion
	jal recursion

# six
six:
	# set $t1
	li $t1, 6
			
	# calculation
	add $s0, $s0, $t1
		
	# incrementing pointer to point to next character
	addi $a0, $a0, 1
	
	# go back to recursion
	jal recursion

# seven
seven:
	# set $t1
	li $t1, 7
			
	# calculation
	add $s0, $s0, $t1
		
	# incrementing pointer to point to next character
	addi $a0, $a0, 1
	
	# go back to recursion
	jal recursion

# eight
eight:
	# set $t1
	li $t1, 8
			
	# calculation
	add $s0, $s0, $t1
		
	# incrementing pointer to point to next character
	addi $a0, $a0, 1
	
	# go back to recursion
	jal recursion

# nine
nine:
	# set $t1
	li $t1, 9
			
	# calculation
	add $s0, $s0, $t1
		
	# incrementing pointer to point to next character
	addi $a0, $a0, 1
	
	# go back to recursion
	jal recursion	

# plus
sign:
	beqz $s4, first
	beq $s4, 43, addition
	beq $s4, 45, subtraction
	
# addition
addition:
	# calculation
	add $s1, $s1, $s0
	move $s4, $t0
	la $s0, 0
	
	# incrementing pointer to point to next character
	addi $a0, $a0, 1
	
	beq $t0, 61, return
	
	jal recursion
	
#subtraction
subtraction:
	# calculation
	sub $s1, $s1, $s0
	move $s4, $t0
	la $s0, 0
	
	# incrementing pointer to point to next character
	addi $a0, $a0, 1
	
	beq $t0, 61, return
	
	jal recursion
# first case
first:
	move $s1, $s0
	move $s4, $t0
	la $s0, 0
	
	# incrementing pointer to point to next character
	addi $a0, $a0, 1
	
	beq $t0, 61, return
	
	jal recursion

# equal
equal:
	beq $s4, 43, sign
	beq $s4, 45, sign
	
# return
return: 
	# print product ($a0)
	move $a0, $s1
	li $v0, 1	
	syscall
	
	# exit program
	li $v0, 10
	syscall
