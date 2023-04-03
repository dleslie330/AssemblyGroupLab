# Teamwork Lab
# Program searches through a string for a specific character based on user input
# Psuedocode:
#	str = input("Please enter a string ")
#	char = input("Please enter a character to search for ")
#	CountOccur(str, char)
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
	
	#char = input("Please enter a character to search for ")
	li $v0, 4
	la $a0, char_prompt
	syscall
	
	# user input char
	li $v0, 12
	syscall
	
	move $a1, $v0
	
	jal CountOccur
	
	#exit the program
	li $v0, 10
	syscall
.data
.asciiz 
string_prompt: "Please enter a string: "
char_prompt: "Please enter a character to search for: "
input: .space 81
inputSize: .word 80
.word 
count: 0
