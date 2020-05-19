	.text
	.globl main
main:
	la $a0, firstNum				# Load the message "Enter the first number to address."
	jal getInput					# Gets the user's first number.
	move $t6, $v0					# Save a copy of the first number for use later.
	
	la $a0, secondNum				# Load "Enter the second number: " to address.
	jal getInput					# Get the user's second number.
	move $t7, $v0					# Save a copy of the second number for use later.
	
	la $a0, space
	li $v0, 4
	syscall						# Print a space before printing binary number.
	
	move $a1, $t6					# Move first number to argument.
	jal printToBinary				# Print the given value to binary.
	
	jal newLine
	la $a0, plus
	li $v0, 4
	syscall						# Prints : "+" before operand.
	
	move $a1, $t7					# Move the second number to argument.
	jal printToBinary				# Print our second value to binary.
	move $a1, $t6					# Move the first number into argument.
	move $a2, $t7					# Move the second number into argument.
	jal addToBinary					# Add the binary values
	move $a1, $v0					# Move the final result to argument.
	jal printToBinary				# Print the final value.
	
	EndOfProgram:
	li $v0, 10
	syscall						# Close the program.
	
getInput:
	li $v0, 4
	syscall						# Prints the message given in argument.
	
	li $v0, 5
	syscall						# Get the user's value.
	
	jr $ra						# Jump and return our value.

printToBinary:
	move $t0, $a1					# move our input to temp variable.
	li $t1, 0					# We'll store the bit in this variable after mask.
	li $t3, 0x80000000 				# Load 1 as a mask in binary.
loop:
	and $t1, $t0, $t3 				# AND; the userInput together with the mask.
	beq $t1, $zero, printBit
	li $t1, 0					# Zero our $t1.
	li $t1, 1 					# Put a 1 in $t1.
	j printBit					# Return to loop.

printBit:
	li $v0, 1
	move $a0, $t1
	syscall						# Move and print the bit.
	
	srl $t3, $t3, 1					# Shift our bits to the right by 1.
	bne $t3, $zero, loop				# If the mask != 0, run loop again.
	
	jr $ra						# Jump out of function to continue.

newLine:
	la $a0, newline
	li $v0, 4
	syscall
	
	jr $ra						# Adds a new line.
addToBinary:
	la $a0, divider
	li $v0, 4
	syscall						# Prints divider.
	
	la $a0, space
	li $v0, 4
	syscall 					# Prints space.
	
	move $t0, $a1					# Move arguments to temps.
	move $t1, $a2					# Move argument to temps.
	
	bitShift:
		bnez $t1, shiftToLeft			# Shift the carry bits, left.
		j exit
	shiftToLeft:
		and $t4, $t1, $t0			# int carry = 3 AND 9
		xor $t0, $t1, $t0			# Get the half sum. a = a XOR b
		sll $t1, $t4, 1				# Shift carry value left 1 bit.
		
		j bitShift				# Jump back to loop
	exit:
		move $v0, $t0
		jr $ra
	
.data
firstNum: .asciiz "Enter the first number: "
secondNum: .asciiz "Enter the second number: "
plus: .asciiz "+   " 
space: .asciiz "    "
newline: .asciiz "\n"
divider: .asciiz "\n----------------------------------------\n"
