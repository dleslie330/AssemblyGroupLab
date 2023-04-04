# Dakota Leslie
# Ardley Pacheco
# Group Lab

#	int countOccur(string s, char l){
#		charCount = 0
#		s.toLower()
#		l.toLower()
#		for i in s:
#			if (i == l):
#				charCount++
#
#		return charCount
#	}

.text

################################################
# countOccur #
# Parameters:
#	$a0 - string to search
#	$a1 - character to search for
# Returns:
#	$v0 - number of occurrrences in string
################################################
countOccur:

	move $v0,$zero # counter for search
	ori $t0,$a1,0x20 # set the char to search for to lowercase

	move $t2,$a0
	move $t1,$zero # pointer to null terminated string
for:
	add $t4,$t1,$t2
	lb $t3,($t4)
	beq $t3,$zero,endfor # check for null terminator (end of string)
	ori $t3,$t3,0x20 # change the char to lowercase
	bne $t3,$t0,endif # if s[i] != l => loop again
	addi $v0,$v0,1
endif:
	addi $t1,$t1,1 # iterate pointer
	j for # jump to start of loop
endfor:

jr $ra # return to main program

.data
