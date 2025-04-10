# Bitmap display starter code
#
# Bitmap Display Configuration:
# - Unit width in pixels: 4
# - Unit height in pixels: 4
# - Display width in pixels: 256
# - Display height in pixels: 256
# - Base Address for Display: 0x10008000 ($gp)
#t0 - position, t1-3 - colours, t6-9 - movement, s0 - double jump, s1-3 moving platform, s4-obstacles, s5-temp, s6 health

.eqv BASE_ADDRESS 0x10008000
.eqv BLACK 0x00000000
.eqv WHITE 0x00ffffff
.eqv PLATFORM 0xB0C4DE
.eqv GREEN 0x00FF00
.eqv RED 0xFF0000
.eqv YELLOW 0xFFFF00 
.eqv BROWN  0x8B4513 

.data
toxic: .space 20

.text

.globl main
main: 
	jal black_screen

	li $t0, BASE_ADDRESS # $t0 stores the base address for display 	
	li $t1, WHITE
	li $t2, BLACK
	li $t3, PLATFORM
	li $v1, GREEN
	
	li $t0, BASE_ADDRESS #Finish Door
	li $t4, BROWN
	li $t5, YELLOW
	addi, $t0, $t0 4348
	sw $t4, 0($t0)
	addi, $t0, $t0 -4
	sw $t4, 0($t0)
	addi, $t0, $t0 -256
	sw $t4, 0($t0)
	addi, $t0, $t0 4
	sw $t5, 0($t0)
	addi, $t0, $t0 -256
	sw $t4, 0($t0)
	addi, $t0, $t0 -4
	sw $t4, 0($t0)
	addi, $t0, $t0 -256
	sw $t4, 0($t0)
	addi, $t0, $t0 4
	sw $t4, 0($t0)
	
	
	li $t0, BASE_ADDRESS
	li $t4, 64 #Bottom
	addi $t0, $t0, 15360
	jal platform
	
	li $t0, BASE_ADDRESS
	li $t4, 64 
	addi $t0, $t0, 15616
	jal platform
	
	li $t0, BASE_ADDRESS
	li $t4, 64 
	addi $t0, $t0, 15872
	jal platform
	
	li $t0, BASE_ADDRESS
	li $t4, 64 
	addi $t0, $t0, 16128
	jal platform
	
	li $t0, BASE_ADDRESS
	li $t4, 64
	addi $t0, $t0, 15104
	jal platform
	
	li $t0, BASE_ADDRESS #Bottom Left
	li $t4, 9
	addi $t0, $t0, 13324
	jal platform

	li $t0, BASE_ADDRESS
	li $t4, 9
	addi $t0, $t0, 13580
	jal platform
	
	li $t0, BASE_ADDRESS #Middle Top
	li $t4, 9
	addi $t0, $t0, 10108
	jal platform

	li $t0, BASE_ADDRESS
	li $t4, 9
	addi $t0, $t0, 10364
	jal platform
	
	li $t0, BASE_ADDRESS #Middle Bottom
	li $t4, 9
	addi $t0, $t0, 11332
	jal platform

	li $t0, BASE_ADDRESS
	li $t4, 9
	addi $t0, $t0, 11588
	jal platform
	
	li $t0, BASE_ADDRESS #Finish Platform
	li $t4, 5
	addi $t0, $t0, 4588
	jal platform

	li $t0, BASE_ADDRESS
	li $t4, 5
	addi $t0, $t0, 4844
	jal platform
	
	li $t0, BASE_ADDRESS #Moving
	li $t4, 9
	addi $t0, $t0, 8632
	jal platform

	li $t0, BASE_ADDRESS
	li $t4, 9
	addi $t0, $t0, 8888
	jal platform
	
	
	li $s1, BASE_ADDRESS #Moving mechanics
	addi $s1, $s1, 8632
	li $s3, 7 #Direction
	
	li $t0, BASE_ADDRESS
	
	li $s2, 0 #Platform Loop
	li $t6, 0 #Gravity
	li $s0, 0 #Double Jump
	li $s4, 0 #Obstacles
	li $s6, 3 #Lives
	li $s7, 0 #Coins
	
	la $t4, toxic #Setting up obstacles
	sw $t0, 0($t4)
	sw $t0, 4($t4)
	sw $t0, 8($t4)
	sw $t0, 12($t4)
	sw $t0, 16($t4)
	
	li $t0, BASE_ADDRESS #Setting up health 
	
	addi $t0, $t0, 15616 #H
	sw $t1, 0($t0)
	addi $t0, $t0, 8
	sw $t1, 0($t0)
	addi $t0, $t0, 248
	sw $t1, 0($t0) 
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, -8
	sw $t1, 0($t0)
	
	addi $t0, $t0, 16 #P
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	
	addi $t0, $t0, 264 #: 
	sw $t1, 0($t0)
	addi $t0, $t0, -512
	sw $t1, 0($t0)
	
	addi $t0, $t0, 8 #HP Container 1
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 252
	sw $t1, 0($t0)
	addi $t0, $t0, 256 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	
	addi $t0, $t0, 8 #HP Container 2
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 252
	sw $t1, 0($t0)
	addi $t0, $t0, 256 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	
	addi $t0, $t0, 8 #HP Container 3
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 252
	sw $t1, 0($t0)
	addi $t0, $t0, 256 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)

	li $t0, BASE_ADDRESS
	addi $t0, $t0, 200
	addi $t0, $t0, 14596
	sw $t1, 0($t0) #Initial Position 
	sw $t1, 252($t0)
	sw $t1, 260($t0)
	sw $t1, -252($t0)
	sw $t1, -260($t0)

main_loop:
	jal health #Check HP

	la $t9, 0xffff0000 # Getting Keyboard Input
	lw $t8, 0($t9)
	beq $t8, 1, pressed
	
	addi $t6, $t6, 1
	beq $t6, 3000, gravity #Speed of gravity
	
	addi $s2, $s2, 1
	beq $s2, 4000, move_platform #Speed of platform
	
	addi $s4, $s4, 1
	beq $s2, 1000, obstacle #Speed of obstacle
	
	j main_loop


#HEALTH LOGIC
health:
	beq $s6, 3, health3
	beq $s6, 2, health2
	beq $s6, 1, health1
	beq $s6, 0, lose
	
health3:
	li $t4, BASE_ADDRESS
	li $t5, RED
	addi $t4, $t4, 15912
	sw $t5, 0($t4)
	addi $t4, $t4, 16
	sw $t5, 0($t4)
	addi $t4, $t4, 16
	sw $t5, 0($t4)
	jr $ra

health2:
	li $t4, BASE_ADDRESS
	li $t5, RED
	addi $t4, $t4, 15912
	sw $t5, 0($t4)
	addi $t4, $t4, 16
	sw $t5, 0($t4)
	addi $t4, $t4, 16
	sw $t2, 0($t4)
	jr $ra
	
health1:
	li $t4, BASE_ADDRESS
	li $t5, RED
	addi $t4, $t4, 15912
	sw $t5, 0($t4)
	addi $t4, $t4, 16
	sw $t2, 0($t4)
	addi $t4, $t4, 16
	sw $t2, 0($t4)
	jr $ra
		

#MOIVING OBJECT LOGIC			
obstacle:
	li $t4, BASE_ADDRESS #Load info
	la $t5, toxic
	
	lw $s5, 0($t5) 
	li $a3, 0
	beq $t4, $s5, init_obstacle #Draw object if reset
	
	jal rain
	li $t4, BASE_ADDRESS #Load info
	la $t5, toxic
	
	lw $s5, 4($t5) 
	li $a3, 4
	beq $t4, $s5, init_obstacle #Draw object if reset
	
	jal rain
	li $t4, BASE_ADDRESS #Load info
	la $t5, toxic
	
	lw $s5, 8($t5) 
	li $a3, 8
	beq $t4, $s5, init_obstacle #Draw object if reset
	
	jal rain
	li $t4, BASE_ADDRESS #Load info
	la $t5, toxic
	
	lw $s5, 12($t5) 
	li $a3, 12
	beq $t4, $s5, init_obstacle #Draw object if reset
	
	jal rain
	li $t4, BASE_ADDRESS #Load info
	la $t5, toxic
	
	lw $s5, 16($t5) 
	li $a3, 16
	beq $t4, $s5, init_obstacle #Draw object if reset
	
	jal rain
	
	j main_loop
	
init_obstacle:
	li $v0, 42
	li $a0, 0
	li $a1, 56
	syscall #Generate Random #
	li $t4, 4
	mult $t4, $a0
	mflo $t4
	add $s5, $t4, $s5 # Multiply by 4 and offset
	
	jal draw #Draw object
	
	add $t5, $t5, $a3 #Change which A[i]
	sw $s5, 0($t5) #Save Position
	j main_loop
	
draw:
	sw $v1, 0($s5) 
	sw $v1, -256($s5) 
	sw $v1, -252($s5)  
	sw $v1, -260($s5) 
	sw $v1, -512($s5)
	jr $ra

erase:
	sw $t2, 0($s5) 
	sw $t2, -256($s5) 
	sw $t2, -252($s5)  
	sw $t2, -260($s5) 
	sw $t2, -512($s5)
	jr $ra
	
rain:
	addi $sp, $sp, -4 #Save ra
	sw   $ra, 0($sp)
	
	jal erase
	
	addi $s5, $s5, 256 #Reset if hits platform
	lw $t4, 0($s5)
	beq $t4, $t3, reset_obstacle
	beq $t4, $t1, hit
	
	lw $t4, -252($s5)
	beq $t4, $t3, reset_obstacle
	beq $t4, $t1, hit
	
	lw $t4, -260($s5)
	beq $t4, $t3, reset_obstacle
	beq $t4, $t1, hit
	
	jal draw
	
	add $t5, $t5, $a3 #Change which A[i]
	sw $s5, 0($t5) #Save Position
	
	lw   $ra, 0($sp) #Restore ra
	addi $sp, $sp, 4
	
	jr $ra

hit:
	addi $s6, $s6, -1
	beq $s6, 0, lose
	
	sw $t2, 0($t0) # Set current character to black
	sw $t2, 252($t0)
	sw $t2, 260($t0)
	sw $t2, -252($t0)
	sw $t2, -260($t0)
	
	li $t0, BASE_ADDRESS # Update position
	addi $t0, $t0, 200
	addi $t0, $t0, 14596
	sw $t1, 0($t0) #Reset to Initial Position 
	sw $t1, 252($t0)
	sw $t1, 260($t0)
	sw $t1, -252($t0)
	sw $t1, -260($t0)
	j main_loop

reset_obstacle:
	li $t4, BASE_ADDRESS
	add $t5, $t5, $a3 #Change which A[i]
	sw $t4, 0($t5) #Save Position
	j main_loop
	

#MOVING PLATFORM LOGIC
move_platform:
	addi $s3, $s3, 1
	li $s2, 0
	bge $s3, 7, plat_up
	b plat_down
	j main_loop
	
plat_up:
	li $t4, 9
	addi $s1, $s1, 256
	jal platform_delete
	
	lw $t4, -512($s1)
	beq $t4, $t1, interim
	
	lw $t4, -508($s1)
	beq $t4, $t1, interim
	
	lw $t4, -504($s1)
	beq $t4, $t1, interim
	
	lw $t4, -500($s1)
	beq $t4, $t1, interim
	
	lw $t4, -496($s1)
	beq $t4, $t1, interim
	
	lw $t4, -492($s1)
	beq $t4, $t1, interim
	
	lw $t4, -488($s1)
	beq $t4, $t1, interim
	
	lw $t4, -484($s1)
	beq $t4, $t1, interim
	
	lw $t4, -480($s1)
	beq $t4, $t1, interim
	
	j done

interim:
	jal on_plat

done:	
	li $t4, 9
	addi $s1, $s1, -512
	jal platform_draw
	beq $s3, 14, reset_plat
	j main_loop
	
reset_plat:
	li $s3, -2
	j main_loop

plat_down:
	li $t4, 9
	jal platform_delete
	
	li $t4, 9
	addi $s1, $s1, 512
	jal platform_draw
	
	addi $s1, $s1, -256
	
	j main_loop

platform:
	sw $t3, 0($t0)
	addi $t0, $t0, 4
	addi $t4, $t4, -1
	bgtz $t4, platform
	jr $ra

platform_draw:
	sw $t3, 0($s1)
	addi $s1, $s1, 4
	addi $t4, $t4, -1
	bgtz $t4, platform_draw
	addi $s1, $s1, -36
	jr $ra

platform_delete:
	sw $t2, 0($s1)
	addi $s1, $s1, 4
	addi $t4, $t4, -1
	bgtz $t4, platform_delete
	addi $s1, $s1, -36
	jr $ra

#KEYBOARD	
pressed:
	lw $t7, 4($t9)
	beq $t7, 0x73, move_down    # down, s
    	beq $t7, 0x61, move_left    # left, a
    	beq $t7, 0x64, move_right   # right, d
	
	beq $s0, 2, main_loop
	addi $s0, $s0, 1
	beq $t7, 0x77, move_up      # up, w
	
	beq $t7, 0x71, lose #quit, q
	beq $t7, 0x72, main #reset, r
    	j main_loop

#MOVEMENT LOGIC
move_up:
    	li $t6, 7 #steps
	jal jump_up
    	j main_loop

jump_up:
	sw $t2, 0($t0) # Set current pixel to black
	sw $t2, 252($t0)
	sw $t2, 260($t0)
	sw $t2, -252($t0)
	sw $t2, -260($t0)
	addi $t0, $t0, -256 # Update position
	
	lw $t4, -252($t0)
	beq $t4, $t3, c_up
	
	lw $t4, -260($t0)
	beq $t4, $t3, c_up
	
	sw $t1, 0($t0) # Update character
	sw $t1, 252($t0)
	sw $t1, 260($t0)
	sw $t1, -252($t0)
	sw $t1, -260($t0)
	
	addi $t6, $t6, -1 
	
	la $t9, 0xffff0000 # Getting Keyboard Input
	lw $t8, 0($t9)
	beq $t8, 1, pressed
	
	li $v0, 32 
	li $a0, 10
	syscall #wait for 25ms to allow for smoother movement
	
	bgtz $t6, jump_up #Keep moving up until steps is 0
	
    	jr $ra

on_plat:
    	sw $t2, 0($t0) # Set current character to black
	sw $t2, 252($t0)
	sw $t2, 260($t0)
	sw $t2, -252($t0)
	sw $t2, -260($t0)
	addi $t0, $t0, -256 # Update position
	
	sw $t1, 0($t0) # Update character
	sw $t1, 252($t0)
	sw $t1, 260($t0)
	sw $t1, -252($t0)
	sw $t1, -260($t0)
    	jr $ra
    	    	    	    	   	    	    	    	    	    	    	   	    	    	    	  	    	    	   	    	   	  	    	    	   	    	    	    	
move_down:
    	sw $t2, 0($t0) # Set current character to black
	sw $t2, 252($t0)
	sw $t2, 260($t0)
	sw $t2, -252($t0)
	sw $t2, -260($t0)
	addi $t0, $t0, 256 # Update position
	
	lw $t4, 252($t0) #Collision
	beq $t4, $t3, c_down
	
	lw $t4, 260($t0)
	beq $t4, $t3, c_down
	
	lw $t4, 252($t0) #Win Condition
	beq $t4, $t5, win
	
	lw $t4, 260($t0)
	beq $t4, $t5, win
	
	sw $t1, 0($t0) # Update character
	sw $t1, 252($t0)
	sw $t1, 260($t0)
	sw $t1, -252($t0)
	sw $t1, -260($t0)
    	j main_loop

c_up:
	addi $t0, $t0, 256 #Move back up
	sw $t1, 0($t0) # Update character
	sw $t1, 252($t0)
	sw $t1, 260($t0)
	sw $t1, -252($t0)
	sw $t1, -260($t0)
    	j main_loop
    	    	    	
c_down:
	li $s0, 0
	addi $t0, $t0, -256 #Move back up
	sw $t1, 0($t0) # Update character
	sw $t1, 252($t0)
	sw $t1, 260($t0)
	sw $t1, -252($t0)
	sw $t1, -260($t0)
    	j main_loop
    	
c_left:
	addi $t0, $t0, 4 #Move back to the right
	sw $t1, 0($t0) # Update character
	sw $t1, 252($t0)
	sw $t1, 260($t0)
	sw $t1, -252($t0)
	sw $t1, -260($t0)
    	j main_loop
 
c_right:
	addi $t0, $t0, -4 #Move back to the left
	sw $t1, 0($t0) # Update character
	sw $t1, 252($t0)
	sw $t1, 260($t0)
	sw $t1, -252($t0)
	sw $t1, -260($t0)
    	j main_loop
		
    	
move_left:
	add $t4, $zero, $t0 #Make sure it doesn't go out of bounds
	addi $t4, $t4, -4
	srl $t5, $t4, 8
	sll $t5, $t5, 8
	beq $t4, $t5, main_loop
	
	sw $t2, 0($t0) # Set current character to black
	sw $t2, 252($t0)
	sw $t2, 260($t0)
	sw $t2, -252($t0)
	sw $t2, -260($t0)
	
	addi $t0, $t0, -4 # Update position
	
	lw $t4, 252($t0)
	beq $t4, $t3, c_left
	
	lw $t4, -260($t0)
	beq $t4, $t3, c_left
	
	sw $t1, 0($t0) # Update character
	sw $t1, 252($t0)
	sw $t1, 260($t0)
	sw $t1, -252($t0)
	sw $t1, -260($t0)
    	j main_loop

move_right:
	add $t4, $zero, $t0 #Make sure it doesn't go out of bounds
	addi $t4, $t4, 8
	srl $t5, $t4, 8
	sll $t5, $t5, 8
	beq $t4, $t5, main_loop

	sw $t2, 0($t0) # Set current character to black
	sw $t2, 252($t0)
	sw $t2, 260($t0)
	sw $t2, -252($t0)
	sw $t2, -260($t0)
	
	addi $t0, $t0, 4 # Update position
	
	
	lw $t4, -252($t0) #Collision
	beq $t4, $t3, c_right
	
	lw $t4, 260($t0)
	beq $t4, $t3, c_right
	
	li $t5, BROWN
	lw $t4, -252($t0) #Win Condition
	beq $t5, $t4, win
	
	lw $t4, 260($t0)
	beq $t5, $t4, win
	
	sw $t1, 0($t0) # Update character
	sw $t1, 252($t0)
	sw $t1, 260($t0)
	sw $t1, -252($t0)
	sw $t1, -260($t0)
    	j main_loop
    	
gravity:
	li $t6, 0
	sw $t2, 0($t0) # Set current character to black
	sw $t2, 252($t0)
	sw $t2, 260($t0)
	sw $t2, -252($t0)
	sw $t2, -260($t0)
	
	addi $t0, $t0, 256 # Update position

	
	lw $t4, 252($t0) #Collision
	beq $t4, $t3, c_down
	
	lw $t4, 260($t0)
	beq $t4, $t3, c_down
	
	lw $t4, 0($t0)
	beq $t4, $t3, c_down
	
	li $t5, BROWN
	lw $t4, 252($t0) #Win Condition
	beq $t4, $t5, win
	
	lw $t4, 260($t0)
	beq $t4, $t5, win

	lw $t4, 0($t0)
	beq $t4, $t5, win
	
	sw $t1, 0($t0) # Update pixel
		
	sw $t1, 252($t0)
	sw $t1, 260($t0)
	sw $t1, -252($t0)
	sw $t1, -260($t0)
    	j main_loop
    	
win:
	jal black_screen
	li $t0, BASE_ADDRESS
	
	addi $t0, $t0, 88 #Y
	addi $t0, $t0, 5888
	sw $t1, 0($t0)
	addi $t0, $t0, 16
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, -16
	sw $t1, 0($t0)
	addi $t0, $t0, 260
	sw $t1, 0($t0)
	addi $t0, $t0, 8
	sw $t1, 0($t0)
	addi $t0, $t0, 252
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	
	addi $t0, $t0, 20 #O
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, -268
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -252 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 260 
	sw $t1, 0($t0)
	addi $t0, $t0, 256 
	sw $t1, 0($t0)
	addi $t0, $t0, 256 
	sw $t1, 0($t0)
	
	addi $t0, $t0, 8 #U
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, 1028
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, -252 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	
	addi $t0, $t0, 1472 #W
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256 
	sw $t1, 0($t0)
	addi $t0, $t0, 256 
	sw $t1, 0($t0)
	addi $t0, $t0, 260 
	sw $t1, 0($t0)
	addi $t0, $t0, -252 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, 772 
	sw $t1, 0($t0)
	addi $t0, $t0, -252 
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	
	addi $t0, $t0, 8 #I
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 248
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 248
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	
	addi $t0, $t0, 8 #N
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, 260
	sw $t1, 0($t0)
	addi $t0, $t0, 260
	sw $t1, 0($t0)
	addi $t0, $t0, 260
	sw $t1, 0($t0)
	addi $t0, $t0, 260
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	
	addi $t0, $t0, 8 #!
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 512
	sw $t1, 0($t0)
	
	addi $t0, $t0, 416#H 
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, -508
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, -508
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	
	addi $t0, $t0, 8 #P
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 768
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, -768
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 768
	sw $t1, 0($t0)
	addi $t0, $t0, -252
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	
	addi $t0, $t0, -248 #:
	sw $t1, 0($t0)
	addi $t0, $t0, 1024 
	sw $t1, 0($t0)
	
	addi $t0, $t0, 8 #HP Container 1
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 1024
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, -1024
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 1024
	sw $t1, 0($t0)
	addi $t0, $t0, -1020
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	
	addi $t0, $t0, 8 #HP Container 2
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 1024
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, -1024
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 1024
	sw $t1, 0($t0)
	addi $t0, $t0, -1020
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)

	addi $t0, $t0, 8 #HP Container 3
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 1024
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, -1024
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 1024
	sw $t1, 0($t0)
	addi $t0, $t0, -1020
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	
	li $t1, RED
	
	beq $s6, 1, score1
	beq $s6, 2, score2
	beq $s6, 3, score3
	
	j end

score1:
	addi $t0, $t0, -316
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -4
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	
	j end

score2:
	addi $t0, $t0, -316
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -4
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	
	addi $t0, $t0, 16
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -4
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	
	j end
	
score3:
	addi $t0, $t0, -316
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -4
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	
	addi $t0, $t0, 16
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -4
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	
	addi $t0, $t0, 16
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -4
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	
	j end

lose:
	jal black_screen
	li $t0, BASE_ADDRESS
	
	addi $t0, $t0, 92 #Y
	addi $t0, $t0, 6656
	sw $t1, 0($t0)
	addi $t0, $t0, 16
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, -16
	sw $t1, 0($t0)
	addi $t0, $t0, 260
	sw $t1, 0($t0)
	addi $t0, $t0, 8
	sw $t1, 0($t0)
	addi $t0, $t0, 252
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	
	addi $t0, $t0, 20 #O
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, -268
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -252 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 260 
	sw $t1, 0($t0)
	addi $t0, $t0, 256 
	sw $t1, 0($t0)
	addi $t0, $t0, 256 
	sw $t1, 0($t0)
	
	addi $t0, $t0, 8 #U
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -256
	sw $t1, 0($t0)
	addi $t0, $t0, 1028
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, -252 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	
	addi $t0, $t0, 1456 #L
	sw $t1, 0($t0)
	addi $t0, $t0, 256 
	sw $t1, 0($t0)
	addi $t0, $t0, 256 
	sw $t1, 0($t0)
	addi $t0, $t0, 256 
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	 addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	
	addi $t0, $t0, 12 #O
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, -268
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -252 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 260 
	sw $t1, 0($t0)
	addi $t0, $t0, 256 
	sw $t1, 0($t0)
	addi $t0, $t0, 256 
	sw $t1, 0($t0)
	
	addi $t0, $t0, 264 #S
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0)
	addi $t0, $t0, -252 
	sw $t1, 0($t0)
	addi $t0, $t0, -260
	sw $t1, 0($t0)
	addi $t0, $t0, -4 
	sw $t1, 0($t0)
	addi $t0, $t0, -4 
	sw $t1, 0($t0)
	addi $t0, $t0, -260 
	sw $t1, 0($t0)
	addi $t0, $t0, -252 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	
	addi $t0, $t0, 8#E
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 240
	sw $t1, 0($t0)
	addi $t0, $t0, 256 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	sw $t1, 0($t0) 
	addi $t0, $t0, 244 
	sw $t1, 0($t0)
	addi $t0, $t0, 256 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	addi $t0, $t0, 4 
	sw $t1, 0($t0)
	
	addi $t0, $t0, 8#! 
	sw $t1, 0($t0)
	addi $t0, $t0, -512 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	addi $t0, $t0, -256 
	sw $t1, 0($t0)
	
	j end	
 
black_screen:
	li $t4, 4096
	li $t5, BASE_ADDRESS
black_loop:
	sw $t2, 0($t5)
	addi $t5, $t5, 4
	addi $t4, $t4, -1
	bne $t4, 0, black_loop
	
	jr $ra
	
	
		
end:
	li $v0, 10 # terminate the program
	syscall