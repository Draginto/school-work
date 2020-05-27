	.text
	.globl main
main:
	la $a0, firstNum		# Prints message : "Enter first number: " and gets number from user.
	jal getValue			# Get the users first number. 
	move $a1, $v0			# Store the first number into argument. 
	
	la $a0, secondNum
	jal getValue			# Prints message : "Enter second number: " and gets number from user.
	move $a2, $v0			# Store the second number into argument.
					
	jal getGCD			# Get the greatest common denominator given 2 numbers.
	
	move $a1, $v0
	
	la $a0, gcdResult
	li $v0, 4
	syscall				# Print message : "The GCD is: "
	
	move $a0, $a1			
	li $v0, 1
	syscall				# Print the gcd.
	
	exitProgram:
	li $v0, 10
	syscall				# Exit the program.
	
getValue:
	addi $sp, $sp, -4		# Make room in stack for return address.
	sw $ra, 0($sp)			# Store the return address at the stack pointer.
	li $v0, 4
	syscall				# Print the message given in argument.
	
	li $v0, 5
	syscall				# Get the user's inputted number
	
	lw $ra, 0($sp) 			# Restore the return address from the stack pointer.
	addi $sp, $sp, 4		# Restore the stack to its original state.
	jr $ra				# Jump back to function call.

getGCD:
	addi $sp, $sp, -4		# Make room in the stack for return address.
	sw $ra, 0($sp)			# Store the return address into the stack.
	move $t0, $a1			# Move the first number to temp register.
	move $t1, $a2			# Move the second number to temp register.
	
	div $t0, $t1			# Divide the two numbers together.
	mfhi $t2			# Store the remainder in register t2 for conditional check.
	bnez $t2, return
		move $v0, $t1		# Returns the second number. 
	b exit
	return:
		move $a1, $t1		# Move second number and set as first number.
		move $a2, $t2		# Move the remainder and set as second number.
		jal getGCD		# Run getGCD again until we reach the base case; When remainder of the 2 given numbers == 0
	exit: 
	  lw $ra, 0($sp)		# Restore the return address from the stack pointer.
	  addi $sp, $sp, 4		# Restore the stack to its original state.
	  jr $ra			# Jump back to function call.

.data
firstNum: .asciiz "Enter first number: "
secondNum: .asciiz "Enter a 2nd number: "
gcdResult: .asciiz "The GCD is: "