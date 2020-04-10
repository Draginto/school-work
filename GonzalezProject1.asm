	.text
	.globl main
main:
	jal intLoop  # Jumps to function intLoop, to get the users input.
	
	la $a0, sumResult # Show the text from sumResult.
	li $v0, 4
	syscall
	
	add $s0, $t0, $zero # store the sum in $s0
	move $a0, $t0 # Moving the sum in $t0 to $a0, to display the integer total. 
	
	li $v0, 1
	syscall 
	
	add $s1, $t1, $zero # Store the count in $s1
	move $a1, $t1 # We move our count variable to $a1 register to use in function.
	
	jal displayCount # Jumps to function displayCount, in order to display the count of numbers
	
	move $a2, $s0 # move the sum to $a2.
	move $a3, $s1 # move the count to $a3.
	
	jal averages # Displays the average of numbers entered.
	move $s3, $v0 
	add $a0, $zero, $v1 
	li $v0, 1
	syscall # Displays the quotient.
	
	la $a0, decimalPoint # Show the text from sumResult.
	li $v0, 4
	syscall
	
	add $a0, $zero, $s3
	li $v0, 1
	syscall # Outputs the remainder.
	
	
	li $v0, 10
	syscall # End the program.
		
intLoop:
	la $a0, Prompt
	li $v0, 4
	syscall # Ask for number.
	
	li $v0, 5
	syscall # Get the users' number.
	
	# -- Compare if the number entered was not 0 -- 
	beq $v0, $zero, getOutofLoop
	
	add $t0, $t0, $v0 # We total the sum, from numbers entered.
	addi $t1, $t1, 1 # We add the total of numbers entered by user.
	
	j intLoop
	
getOutofLoop:	
	jr $ra # jumps back to place where it was called.

displayCount:
	la $a0, newline  
	li $v0, 4
	syscall # Outputs a newline to clean up the display.
	
	move $a0, $a1 # We move to $a0 register from our $a1, because we need $a0 to display int.
	li $v0, 1
	syscall 
	
	la $a0, numbersEntered
	li $v0, 4
	syscall # Display message : " numbers were entered."
	
	jr $ra # Jump back to previous call.
averages:
	la $a0, newline
	li $v0, 4
	syscall # Gives a newline.
	
	la $a0, avgResult
	li $v0, 4
	syscall # Gives a newline.
	
	div $a2, $a3 # sum/n = ...

	# Division loop.
	# Get the first divison result.

	mflo $s1 # The quotient.
	mfhi $s0 # The remainder.
	 
	addi $t3, $t3, 3 # go up to 3 decimals.
	addi $t4, $t4, 0 # counter
	add $s3, $s3, 0
	addi $t2, $zero, 10 # Get the multiplier.
divisionLoop:
	
	beq $t3, $t4, else # if a=
	if:
		mult $s0, $t2 # multiply the current remainder by 10.
		mflo $s0
		
		div $s0, $a3 # divide the new remainder 
		mflo $t1 # Stores new quotient. 
		mfhi $t0 # Stores new remainder. 
		
		add $s3, $t1, $t2
		addi $t4, $t4, 1
		
		j divisionLoop
	else:	
	
	# Will add the ending result
	add $v1, $zero, $s1 # Return the quotient.
	add $v0, $zero, $s3 # Return the remainder.
	
	jr $ra # Jump back to previous statement.
	

.data
Prompt: .asciiz "Enter a number(0 to exit): "
sumResult: .asciiz "The sum is: "
numbersEntered: .asciiz " numbers were entered"
avgResult: .asciiz "The average is: "
newline: .asciiz "\n" 
decimalPoint: .asciiz "."
