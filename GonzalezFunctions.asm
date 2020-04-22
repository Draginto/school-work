	.text
	.globl main
main:
	jal getYear
	# We need a while loop for the entire program to keep running.
	beq $v0, $zero, endProgram
	
	add $s0, $s0, $v0 # Stores the value returned from yearLoop to $s0.
	add $t0, $t0, $s0
	
	move $a1, $t0
	jal displayYear # Display year.
	
	j main

getYear:
	la $a0, enterYear
	li $v0, 4
	syscall # Ask for year.
	
	li $v0, 5
	syscall # Get the users' year.
	
	jr $ra
endProgram:
	li $v0, 10
	syscall # End the program.

displayYear:
	la $a0, newline  
	li $v0, 4
	syscall # Outputs a newline to clean up the display.
	
	move $a0, $a1
	li $v0, 1
	syscall
	
	jr $ra

.data
isLeapYear: .asciiz " is a leap year\n"
notLeapYear: .asciiz " is not a leap year\n"
enterYear: .asciiz "Enter a year(0 to exit): "
newline: .asciiz "\n"