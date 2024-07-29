.data

.text

addiu $s0, $zero, 0xffff8010 #Move 0-UP 90-Right 180-Down 270-Left (0-359)

addiu $s1, $zero, 0xffff8020 #Track as bool

addiu $s2, $zero, 0xffff8030 #CurrentX as int

addiu $s3, $zero, 0xffff8040 #CurrentY as int

addiu $s4, $zero, 0xffff8050 #Start Move as bool

main_loop:
	
	right_loop:
		lw $a1, 0($s2)
		bne $a1, 50 move_right_and_track
	
	addiu $a0, $zero, 0
	sw $a0, 0($s4) #Disable movement
	
	addiu $t0, $zero, 0
	sw $t0, 0($s1) #Disable track
	
	down_loop:
		lw $a2, 0($s3)
		bne $a2, 30 move_down_and_track
		
	addiu $a0, $zero, 0
	sw $a0, 0($s4) #Disable movement
	
	addiu $t0, $zero, 0
	sw $t0, 0($s1) #Disable track
	
	left_loop:
		lw $a1, 0($s2)
		bne $a1, 0 move_left_and_track
		
	addiu $a0, $zero, 0
	sw $a0, 0($s4) #Disable movement
	
	addiu $t0, $zero, 0
	sw $t0, 0($s1) #Disable track
	
	up_loop:
		lw $a2, 0($s3)
		bne $a2, 0 move_up_and_track
		
	addiu $a0, $zero, 0
	sw $a0, 0($s4) #Disable movement
	
	addiu $t0, $zero, 0
	sw $t0, 0($s1) #Disable track
	
	

move_right_and_track:
	addiu $t0, $zero, 1
	sw $t0, 0($s1) #Enable track
	
	addiu $t0, $zero, 90
	sw $t0, 0($s0) #Store direction
	
	addiu $t0, $zero, 1
	sw $t0, 0($s4) #Enable movement
	
	j right_loop

move_left_and_track:
	addiu $t0, $zero, 1
	sw $t0, 0($s1) #Enable track
	
	addiu $t0, $zero, 270 #Direction
	sw $t0, 0($s0)	#Store direction
	
	addiu $t0, $zero, 1
	sw $t0, 0($s4)	#Enable movement
	
	j left_loop
	
	
move_up_and_track:
	addiu $t0, $zero, 1
	sw $t0, 0($s1) #Enable track
	
	addiu $t0, $zero, 0 #Direction
	sw $t0, 0($s0) #Store direction
	
	addiu $t0, $zero, 1
	sw $t0, 0($s4) #Enable movement
	
	j up_loop

move_down_and_track:
	addiu $t0, $zero, 1
	sw $t0, 0($s1) #Enable track
	
	addiu $t0, $zero, 180 #Direction
	sw $t0, 0($s0) #Store direction
	
	addiu $t0, $zero, 1
	sw $t0, 0($s4) #Enable movement
	
	j down_loop

exit:	
	

	







