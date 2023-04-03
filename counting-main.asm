# Teamwork Lab
# Program searches through a string for a specific character based on user input
# Psuedocode:
#	str = input("Please enter a string ")
#	char = input("Please enter a character to search for ")
#	countOccur(str, char)
#	print("Search string = " + str)
#	print("We found the character " + char + count + " times")
#	exit
# 
.text
main:
	#str = input("Please enter a string ")
	li $v0, 4
	la $a0, string_prompt
	syscall
	
	# user input string
	li $v0, 8
	la $a0, input
	lw $a1, inputSize
	syscall
	
	move $s0, $a0
	
	#char = input("Please enter a character to search for ")
	li $v0, 4
	la $a0, char_prompt
	syscall
	
	# user input char
	li $v0, 12
	syscall
	
	# shift the values into their parameter form
	move $a0, $s0
	move $a1, $v0
	
	jal countOccur
	
	# save the value of count into memory
	sw $v0, count
	
	# print("Search string = " + str)
	li $v0, 4
	la $a0, str_output
	syscall
	
	# print str
	li $v0, 4
	la $a0, input
	syscall
	
	# print("We found the character " + char + count + " times")
	li $v0, 4
	la $a0, count_output1
	syscall
	
	# print the count
	lw $a0, count
	li $v0, 1
	syscall
	
	# print final output
	li $v0, 4
	la $a0, count_output2
	syscall

	#exit the program
	li $v0, 10
	syscall
.data
.asciiz 
string_prompt: "Please enter a string: "
char_prompt: "Please enter a character to search for: "
str_output: "\nSearch string = "
count_output1: "We found the character "
count_output2: " times"
input: .space 81
inputSize: .word 80
count: .word 0
.include "count-occur.asm"
