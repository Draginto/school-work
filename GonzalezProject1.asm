	.text
	.globl main
main:
	jal intLoop  # Jumps to function intLoop, to get the users input.
	
	la $a0, sumResult # Show the text from sumResult.
	li $v0, 4
	syscall
	
	move $a0, $t0 # Moving the sum in $t0 to $a0, to display the integer total. 
	li $v0, 1
	syscall 
	
	move $a1, $t1 # We move our count variable to $a1 register to use in function.
	jal displayCount # Jumps to function displayCount, in order to display the count of numbers
	
	
	jal average # Displays the average of numbers entered.
	
	
End_Prog:
	li $v0, 10
	syscall
		
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

average:
	la $a0, newline
	li $v0, 4
	syscall # Gives a newline.
	
	la $a0, avgResult
	li $v0, 4
	syscall # Outputs string of avgResult.
	
	# We recieve as arguments, the count, the total sum, then return the average using mfhi/mflo.
	div $s0, $a0, $a1 # sum/n = ...
	
	add $a0, $zero, $s0 # must move value to $a0 to display int. 
	li $v0, 1
	syscall
	
	jr $ra # Jump back to previous statement.
	

.data
Prompt: .asciiz "Enter a number(0 to exit): "
sumResult: .asciiz "The sum is: "
numbersEntered: .asciiz " numbers were entered"
avgResult: .asciiz "The average is: "
newline: .asciiz "\n"
