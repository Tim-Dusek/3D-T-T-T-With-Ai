#Timothy Dusek
.data

	newBoard:	.ascii "\n\n  | . . . . | . . . . | . . . . | . . . . |   a b c d"
         	.ascii   "\n  | . . . . | . . . . | . . . . | . . . . |   e f g h"
         	.ascii   "\n  | . . . . | . . . . | . . . . | . . . . |   i j k l"
         	.ascii   "\n  | . . . . | . . . . | . . . . | . . . . |   m n o p"
         	.asciiz  "\n  |   (0)   |   (1)   |   (2)   |   (3)   |   (index)\n"

	board: 	.ascii "\n\n  | . . . . | . . . . | . . . . | . . . . |   a b c d"
         	.ascii   "\n  | . . . . | . . . . | . . . . | . . . . |   e f g h"
         	.ascii   "\n  | . . . . | . . . . | . . . . | . . . . |   i j k l"
         	.ascii   "\n  | . . . . | . . . . | . . . . | . . . . |   m n o p"
         	.asciiz  "\n  |   (0)   |   (1)   |   (2)   |   (3)   |   (index)\n"
         	
    offset: .half   6,   8,  10,  12,  16,  18,  20,  22,  26,  28,  30,  32,  36,  38,  40,  42
          	.half  60,  62,  64,  66,  70,  72,  74,  76,  80,  82,  84,  86,  90,  92,  94,  96
           	.half 114, 116, 118, 120, 124, 126, 128, 130, 134, 136, 138, 140, 144, 146, 148, 150
           	.half 168, 170, 172, 174, 178, 180, 182, 184, 188, 190, 192, 194, 198, 200, 202, 204
           	
   comb: .ascii  "0b0c0d 0f0k0p 0e0i0m 1a2a3a 1b2c3d 1e2i3m 1f2k3p "      # 0a   
         .ascii  "0a0c0d 0f0j0n 1b2b3b 1f2j3n                      "      # 0b   
         .ascii  "0a0b0d 0g0k0o 1c2c3c 1g2k3o                      "      # 0c
         .ascii  "0a0b0c 0h0l0p 0g0j0m 1d2d3d 1g2j3m 1c2b3a 1h2l3p "      # 0d
         .ascii  "0a0i0m 0f0g0h 1e2e3e 1f2g3h                      "      # 0e
         .ascii  "0e0g0h 0b0j0n 0a0k0p 1f2f3f                      "      # 0f
         .ascii  "0e0f0h 0c0k0o 0d0j0m 1g2g3g                      "      # 0g
         .ascii  "0e0f0g 0d0l0p 1h2h3h 1g2f3e                      "      # 0h
         .ascii  "0a0e0m 0j0k0l 1i2i3i 1j2k3l                      "      # 0i
         .ascii  "0i0k0l 0b0f0n 0m0g0d 1j2j3j                      "      # 0j
         .ascii  "0i0j0l 0c0g0o 0a0f0p 1k2k3k                      "      # 0k
         .ascii  "0i0j0k 0d0h0p 1l2l3l 1k2j3i                      "      # 0l
         .ascii  "0a0e0i 0n0o0p 0j0g0d 1m2m3m 1i2e3a 1n2o3p 1j2g3d "      # 0m
         .ascii  "0m0o0p 0b0f0j 1n2n3n 1j2f3b                      "      # 0n
         .ascii  "0m0n0p 0c0g0k 1o2o3o 1k2g3c                      "      # 0o
         .ascii  "0m0n0o 0d0h0l 0k0f0a 1p2p3p 1l2h3d 1k2f3a 1o2n2m "      # 0p
         .ascii  "1b1c1d 1f1k1p 1e1i1m 0a2a3a                      "      # 1a
         .ascii  "1a1c1d 1f1j1n 0b2b3b 0a2c3d                      "      # 1b
         .ascii  "1a1b1d 1g1k1o 0c2c3c 0d2b3a                      "      # 1c
         .ascii  "1a1b1c 1h1l1p 1g1j1m 0d2d3d                      "      # 1d
         .ascii  "1a1i1m 1f1g1h 0e2e3e 0a2i3m                      "      # 1e
         .ascii  "1e1g1h 1b1j1n 1a1k1p 0f2f3f 0a2k3p 0b2j3n 0e2g3h "      # 1f
         .ascii  "1e1f1h 1c1k1o 1d1j1m 0g2g3g 0d2j3m 0c2k3o 0h2f3e "      # 1g
         .ascii  "1e1f1g 1d1l1p 0h2h3h 0d2l3p                      "      # 1h
         .ascii  "1a1e1m 1j1k1l 0i2i3i 0m2e3a                      "      # 1i
         .ascii  "1i1k1l 1b1f1n 1d1g1m 0j2j3j 0m2g3d 0n2f3b 0i2k3l "      # 1j
         .ascii  "1i1j1l 1c1g1o 1a1f1p 0k2k3k 0p2f3a 0o2g3c 0l2j3i "      # 1k
         .ascii  "1i1j1k 1d1h1p 0l2l3l 0p2h3d                      "      # 1l
         .ascii  "1a1e1i 1n1o1p 1j1g1d 0m2m3m                      "      # 1m
         .ascii  "1m1o1p 1b1f1j 0n2n3n 0m2o3p                      "      # 1n
         .ascii  "1m1n1p 1c1g1k 0o2o3o 0p2n3m                      "      # 1o
         .ascii  "1m1n1o 1d1h1l 1k1f1a 0p2p3p                      "      # 1p
         .ascii  "2b2c2d 2f2k2p 2e2i2m 0a1a3a                      "      # 2a
         .ascii  "2a2c2d 2f2j2n 0b1b3b 3a1c0d                      "      # 2b
         .ascii  "2a2b2d 2g2k2o 0c1c3c 3d1b0a                      "      # 2c
         .ascii  "2a2b2c 2h2l2p 2g2j2m 0d1d3d                      "      # 2d
         .ascii  "2a2i2m 2f2g2h 0e1e3e 3a1i0m                      "      # 2e
         .ascii  "2e2g2h 2b2j2n 2a2k2p 0f1f3f 0h1g3e 0n1j3b 0p1k3a "      # 2f
         .ascii  "2e2f2h 2c2k2o 2d2j2m 0g1g3g 0o1k3c 0e1f3h 0m1j3d "      # 2g
         .ascii  "2e2f2g 2d2l2p 0h1h3h 3d1l0p                      "      # 2h
         .ascii  "2a2e2m 2j2k2l 0i1i3i 3m1e0a                      "      # 2i
         .ascii  "2i2k2l 2b2f2n 2d2g2m 0j1j3j 0l1k3i 0b1f3n 0d1g3m "      # 2j
         .ascii  "2i2j2l 2c2g2o 2a2f2p 0k1k3k 0c1g3o 0i1j3l 0a1f3p "      # 2k
         .ascii  "2i2j2k 2d2h2p 0l1l3l 0d1h3p                      "      # 2l
         .ascii  "2a2e2i 2n2o2p 2d2g2j 0m1m3m                      "      # 2m
         .ascii  "2m2o2p 2b2f2j 0n1n3n 0p1o3m                      "      # 2n
         .ascii  "2m2n2p 2c2g2k 0o1o3o 0m1n3p                      "      # 2o
         .ascii  "2m2n2o 2d2h2l 2a2f2k 0p1p3p                      "      # 2p
         .ascii  "3b3c3d 3f3k3p 3e3i3m 0a1a2a 0d1c2b 0p1k2f 0m1i2e "      # 3a
         .ascii  "3a3c3d 3f3j3n 0b1b2b 0n1j2b                      "      # 3b
         .ascii  "3a3b3d 3g3k3o 0c1c2c 0o1k2g                      "      # 3c
         .ascii  "3a3b3c 3h3l3p 3g3j3m 0d1d2d 0a1b2c 0m1j2g 0p1l2h "      # 3d
         .ascii  "3a3i3m 3f3g3h 0e1e2e 0h1g2f                      "      # 3e
         .ascii  "3e3g3h 3b3j3n 3a3k3p 0f1f2f                      "      # 3f
         .ascii  "3e3f3h 3c3k3o 3d3j3m 0g1g2g                      "      # 3g
         .ascii  "3e3f3g 3d3l3p 0h1h2h 0e1f2g                      "      # 3h
         .ascii  "3a3e3m 3j3k3l 0i1i2i 0l1k2j                      "      # 3i
         .ascii  "3i3k3l 3b3f3n 3d3g3m 0j1j2j                      "      # 3j
         .ascii  "3i3j3l 3c3g3o 3a3f3p 0k1k2k                      "      # 3k
         .ascii  "3i3j3k 3d3h3p 0l1l2l 0i1j2k                      "      # 3l
         .ascii  "3a3e3i 3n3o3p 3d3g3j 0m1m2m 0a1e2i 0d1g2j 0p1o2n "      # 3m
         .ascii  "3m3o3p 3b3f3j 0n1n2n 0b1f2j                      "      # 3n
         .ascii  "3m3n3p 3c3g3k 0o1o2o 0c1g2k                      "      # 3o
         .ascii  "3m3n3o 3d3h3l 3a3f3k 0p1p2p 0a1f2k 0d1h2l 0m1n2o "      # 3p

	randomInt: .word 0

	test: .asciiz "\ntest\n"
	pieceSelection: .asciiz "\nYou have been chosen to go first! Please select X or O\n"
	aiSelection: .asciiz "\nI am the AI and have been chosen to go first. This is the game piece I selected:\n"
	readyToStart: .asciiz "\nAre you ready to start(y/n)?\n"
	cellSelection: .asciiz "\nPlease select a valid cell (a-p)\n"
	gridSelection: .asciiz "\nIt's your turn! Please enter a valid grid (0-3)\n"
	continueSelection: .asciiz "\nWould you like to continue to the next turn? (y/n)\n"
	newGameSelection: .asciiz "\nWould you like to start a new game? (y/n)\n"
	
	invalidSelectionString: .asciiz "\nThat selection is not valid\n"
	userWin: .asciiz "\nCongrats! User won!\n"
	aiWin: .asciiz "\nSorry! AI won!\n"
	winningPiece: .asciiz "\nThe wining piece was: "
	
	tieGameMessage: .asciiz "\nThe game is a tie! Nobody won!\n"
	
	userGamePiece: .word 0
	aiGamePiece: .word 0
	grid: .word 0
	cell: .byte 'a'
	continue: .word 0

.text 

gameStart:
		xor  $a0, $a0, $a0     # Set a seed number.
    	li   $a1, 2         # random number 0 to 1
      	li   $v0, 42           # random number generator
      	syscall
		
		beq $a0, 0, aiPick
		beq $a0, 1, userPick
		
userPick:
		li $v0, 4
		la $a0, pieceSelection
		syscall
		
		li $v0, 12
		syscall
		
		beq $v0, 'X', aiGet0
		beq $v0, 'O', aiGetX
		li 	$v0, 4
		la 	$a0, invalidSelectionString
		syscall
		j userPick
		
aiGet0:	
		sb $v0, userGamePiece #assigns the AI game piece based on users choice
		li $v0, 'O'
		sb $v0, aiGamePiece
		j userMove
		
aiGetX:	
		sb $v0, userGamePiece #assigns the AI game piece based on users choice
		li $v0, 'X'
		sb $v0, aiGamePiece
		j userMove
		
		
aiPick: #AI randomly selects game Piece

		xor  $a0, $a0, $a0     # Set a seed number.
    	li   $a1, 2         # random number 0 to 1
      	li   $v0, 42           # random number generator
      	syscall
		
		beq $a0, 0, aiSelect0
		beq $a0, 1, aiSelectX
		
aiSelect0: # if random number is 0 assigns O to AI and X to player
	
		li $v0, 'O'
		sb $v0, aiGamePiece
		
		li $v0, 4
		la $a0, aiSelection
		syscall
		
		li $v0, 4
		la $a0, aiGamePiece
		syscall
		
		li $v0, 'X'
		sb $v0, userGamePiece
		
aiSelectOReady:
		li $v0, 4
		la $a0, readyToStart
		syscall
		
		li $v0, 12
		syscall
		
		beq $v0, 'y', aiRandom
		beq $v0, 'n', newGame
		j aiSelectOReady
		
aiSelectX: # if random number is 1 assigns X to AI and O to player
	
		li $v0, 'X'
		sb $v0, aiGamePiece
		
		li $v0, 4
		la $a0, aiSelection
		syscall
		
		li $v0, 4
		la $a0, aiGamePiece
		syscall
		
		li $v0, 'O'
		sb $v0, userGamePiece
		
aiSelectXReady:

		li $v0, 4
		la $a0, readyToStart
		syscall
		
		li $v0, 12
		syscall
		
		beq $v0, 'y', aiRandom
		beq $v0, 'n', newGame
		j aiSelectXReady
		
		
userMove: #board gets printed and player makes a move on the game board
		#prints game board
		li $v0, 4		#system call code for printing string = 4.
		la $a0, board 	#load address of string to be printed into $a0
		syscall			#call operating system to perform operation that is specified in $v0
		
userGridInput:
		#asks user for grid selection
		li $v0, 4
		la $a0, gridSelection
		syscall
		
		#user enters grid selection
		li $v0, 12
		syscall
		
		#error checking for user grid selection
		beq $v0, '0', userGridAccept
		beq $v0, '1', userGridAccept
		beq $v0, '2', userGridAccept
		beq $v0, '3', userGridAccept
		
gridError: #if input isnt valid, print error string and try again for input

		li 	$v0, 4
		la 	$a0, invalidSelectionString
		syscall
		j userGridInput
		
userGridAccept: # if input valid, assigns choie to memory

		sub $v0, $v0, 48
		sb $v0, grid  #assigns the users grid choice to memory
		
userCellInput:
		#asks user for cell selection
		li $v0, 4
		la $a0, cellSelection
		syscall

		#user enters cell selection
		li $v0, 12	 #read char = 12
		syscall
 		
		beq $v0, 'a', userCellAccept
		beq $v0, 'b', userCellAccept
		beq $v0, 'c', userCellAccept
		beq $v0, 'd', userCellAccept
		beq $v0, 'e', userCellAccept
		beq $v0, 'f', userCellAccept
		beq $v0, 'g', userCellAccept
		beq $v0, 'h', userCellAccept
		beq $v0, 'i', userCellAccept
		beq $v0, 'j', userCellAccept
		beq $v0, 'k', userCellAccept
		beq $v0, 'l', userCellAccept
		beq $v0, 'm', userCellAccept
		beq $v0, 'n', userCellAccept
		beq $v0, 'o', userCellAccept
		beq $v0, 'p', userCellAccept
		li 	$v0, 4
		la 	$a0, invalidSelectionString
		syscall
		j userCellInput

userCellAccept:

		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		
		
		lw	$t1,cell  # loads the userCell data into $t1
		divu	$t1, $t1, 4 # divides $t1 by 4 and stores back into #t1
		mul	$t1 , $t1, 16# multiply into t1 by 16
	 	lw	$t2, grid # loads userGrid value into $t2
		mul	$t2, $t2 ,4 # multiply userGrid value by 4
		add $t0, $t1,$t2 # adds $t1 and $t2 but stores the value into $t0
		lw	$s0, cell #loads userCell value ibto $s0
		divu	$t3, $s0, 4 #divides $s0 valie by 4 and stores it into $t3
		mfhi	$t3 #modulous operation
		add	$t0, $t0,$t3 # adds $t0 and $t3 and puts it into $t0
	
		mul	$t0, $t0, 2        # Becuase each offset is two-bytes long.
		
		lh	$t1, offset($t0) #checking to see if spot is already taken on board
		lb 	$t7, board($t1)      
		bne 	$t7, '.', gridError
		
		lw	$t2, userGamePiece #loads the UserGamePiece choice into $t2 to print to the board
		sb	$t2, board($t1)    # Put the piece at the location, board+offset.
		
		li $v0, 4		#system call code for printing string = 4.
		la $a0, board 	#load address of string to be printed into $a0
		syscall			#call operating system to perform operation that is specified in $v0
		
userWinCheck:
       
       	lw $a0, grid
      	mul  $t0, $a0, 16
       
      	lw $a0, cell
      	add  $t0, $t0, $a0
      	mul  $t0, $t0, 49 #comb($t0) is the starting spot
      	#add $t0, $t0, 28 #starts us at 0a1f2k 0d1h2l 0m1n2o when 3p is entered
      	li $a2, 0
      	
combCheck:
      	lb    $t1, comb($t0)   
      	sub   $t1, $t1, '0'    # $t1: grid
      	add   $t0, $t0, 1
      	lb    $t2, comb($t0)   
      	sub   $t2, $t2, 'a'    # $t2: cell
      	add   $t0, $t0, 1      
      	
      	div  $t3, $t2, 4
        mul  $t3, $t3, 16   
        mul  $t4, $t1, 4
        div  $t5, $t2, 4
        mfhi $t5
        add  $t3, $t3, $t4
        add  $t3, $t3, $t5
        mul  $t3, $t3, 2
        lh   $t4, offset($t3) 
        lb $t5, board($t4)
        lb	$t6, userGamePiece
       
        beq   $t5, $t6, combCheck2
        
        add $t0, $t0, 5
        j userLoop
        
        
        ########################
        
combCheck2:
        lb    $t1, comb($t0)   
      	sub   $t1, $t1, '0'    # $t1: grid
      	add   $t0, $t0, 1
      	lb    $t2, comb($t0)   
      	sub   $t2, $t2, 'a'    # $t2: cell
      	add   $t0, $t0, 1      
      	
      	div  $t3, $t2, 4
        mul  $t3, $t3, 16   
        mul  $t4, $t1, 4
        div  $t5, $t2, 4
        mfhi $t5
        add  $t3, $t3, $t4
        add  $t3, $t3, $t5
        mul  $t3, $t3, 2
        lh   $t4, offset($t3) 
        lb $t5, board($t4)
        lb	$t6, userGamePiece
        
        beq   $t5, $t6, combCheck3
        
        add $t0, $t0, 3
        j userLoop
       
       ##########################
       
combCheck3:
       
       lb    $t1, comb($t0)   
      	sub   $t1, $t1, '0'    # $t1: grid
      	add   $t0, $t0, 1
      	lb    $t2, comb($t0)   
      	sub   $t2, $t2, 'a'    # $t2: cell
      	add   $t0, $t0, 1      
      	
      	div  $t3, $t2, 4
        mul  $t3, $t3, 16   
        mul  $t4, $t1, 4
        div  $t5, $t2, 4
        mfhi $t5
        add  $t3, $t3, $t4
        add  $t3, $t3, $t5
        mul  $t3, $t3, 2
        lh   $t4, offset($t3) 
        lb $t5, board($t4)
        lb	$t6, userGamePiece
       
        beq   $t5, $t6, userWinCondition
        
        add $t0, $t0, 1
        j userLoop

userWinCondition:
      	li    $v0, 4
      	la    $a0, userWin 
      	syscall
      	
      	li $v0, 4
      	la $a0, winningPiece
      	syscall
      	
      	li $v0, 4
      	la $a0, userGamePiece
      	syscall
      	
      	j newGame
      	
userLoop:

	add $a2, $a2, 1
	bne $a2, 7, combCheck
		
userContinue: #if no one has won ask if player wants to continue (y or space works as a yes)
	li $t0, 6
	userTieLoop:
	lb $t7, board($t0)
	beq $t7, '.', continueUser

	add $t0, $t0, 2
	lb $t7, board($t0)
	beq $t7, '.', continueUser

	add $t0, $t0, 2
	lb $t7, board($t0)
	beq $t7, '.', continueUser

	add $t0, $t0, 2
	lb $t7, board($t0)
	beq $t7, '.', continueUser
	beq $t0, 204, userTie
	add $t0, $t0, 2
	j userTieLoop
	
userTie:
	li $v0, 4
	la $a0, tieGameMessage
	syscall
	j newGame

continueUser:
		li $a2, 0
				
		li $v0, 4		#system call code for printing string = 4.
		la $a0, continueSelection 	#load address of string to be printed into $a0
		syscall			#call operating system to perform operation that is specified in $v0
		
		li $v0, 12
		syscall
		
		beq $v0, 'y', aiWinFirst
		beq $v0, 'n', newGame
		
		li $v0, 4
		la $a0, invalidSelectionString
		syscall
		j userContinue


aiWinFirst: #AI takes move if the move will result in a win for AI then jump to check for winner

 li    $t0, 0
aiWinMoveLoop:
		Beq $t0, 3136, aiBlock

		lb    $t1, comb($t0)   
      	sub   $t1, $t1, '0'    # $t1: grid
      	add   $t0, $t0, 1
      	lb    $t2, comb($t0)   
      	sub   $t2, $t2, 'a'    # $t2: cell
      	add   $t0, $t0, 1      
      	
      	div  $t3, $t2, 4
        mul  $t3, $t3, 16   
        mul  $t4, $t1, 4
        div  $t5, $t2, 4
        mfhi $t5
        add  $t3, $t3, $t4
        add  $t3, $t3, $t5
        mul  $t3, $t3, 2
        lh   $t4, offset($t3) 
        lb $t5, board($t4)
        lb	$t6, aiGamePiece
        
        bne   $t5, $t6, aiWinMoveInc5
        
        ############
        
        
        lb    $t1, comb($t0)   
      	sub   $t1, $t1, '0'    # $t1: grid
      	add   $t0, $t0, 1
      	lb    $t2, comb($t0)   
      	sub   $t2, $t2, 'a'    # $t2: cell
      	add   $t0, $t0, 1      
      	
      	div  $t3, $t2, 4
        mul  $t3, $t3, 16   
        mul  $t4, $t1, 4
        div  $t5, $t2, 4
        mfhi $t5
        add  $t3, $t3, $t4
        add  $t3, $t3, $t5
        mul  $t3, $t3, 2
        lh   $t4, offset($t3) 
        lb $t5, board($t4)
        lb	$t6, aiGamePiece
        
        bne   $t5, $t6, aiWinMoveInc3
        
        
        ###############
        
        lb    $t1, comb($t0)   
      	sub   $t1, $t1, '0'    # $t1: grid
      	add   $t0, $t0, 1
      	lb    $t2, comb($t0)   
      	sub   $t2, $t2, 'a'    # $t2: cell
      	add   $t0, $t0, 1      
      	
      	div  $t3, $t2, 4
        mul  $t3, $t3, 16   
        mul  $t4, $t1, 4
        div  $t5, $t2, 4
        mfhi $t5
        add  $t3, $t3, $t4
        add  $t3, $t3, $t5
        mul  $t3, $t3, 2
        lh   $t4, offset($t3) 
        lb $t5, board($t4)
        lb	$t6, aiGamePiece
       
        bne   $t5, $t6, aiWinMoveInc1
        ########
        j aiWinMoveGridAssign
        
aiWinMoveInc5:
	add $t0, $t0, 5
	j aiWinMoveLoop
	
aiWinMoveInc3:

	add $t0, $t0, 3
	j aiWinMoveLoop
aiWinMoveInc1:

    add $t0, $t0, 1
	j aiWinMoveLoop
      
aiWinMoveGridAssign:
		move $s7, $t0 #s7 is fail safe number
       divu $t1, $t0, 784

       mul $t3, $t1, 784
       sub $t0, $t0, $t3
       divu $t2, $t0, 49
     
       
       #add $t0, $t0, 1
       
       sb $t1, grid
       sb $t2, cell
   
   
        lw	$t1,cell  # loads the userCell data into $t1
		divu	$t1, $t1, 4 # divides $t1 by 4 and stores back into #t1
		mul	$t1 , $t1, 16# multiply into t1 by 16
	 	lw	$t2, grid # loads userGrid value into $t2
		mul	$t2, $t2 ,4 # multiply userGrid value by 4
		add $t0, $t1,$t2 # adds $t1 and $t2 but stores the value into $t0
		lw	$s0, cell #loads userCell value ibto $s0
		divu	$t3, $s0, 4 #divides $s0 valie by 4 and stores it into $t3
		mfhi	$t3 #modulous operation
		add	$t0, $t0,$t3 # adds $t0 and $t3 and puts it into $t0
	
		mul	$t0, $t0, 2        # Becuase each offset is two-bytes long.
		
		lh	$t1, offset($t0) #checking to see if spot is already taken on board
		lb 	$t7, board($t1) 
		bne 	$t7, '.', aiWinMoveFailsafe
		#lw	$t2, userGamePiece #loads the UserGamePiece choice into $t2 to print to the board
		lb $t2, aiGamePiece
		sb	$t2, board($t1)    # Put the piece at the location, board+offset.
		
		li $v0, 4		#system call code for printing string = 4.
		la $a0, board 	#load address of string to be printed into $a0
		syscall			#call operating system to perform operation that is specified in $v0
       
       
      j aiWinCheck
      
aiWinMoveFailsafe:
		move $t0, $s7
		add $t0, $t0, 1
		j aiWinMoveLoop

aiBlock: #AI takes move if the next player moe will result in a player move win then jump to check for winner
	 li    $t0, 0
aiBlockMoveLoop:
		Beq $t0, 3136, aiMaxGain

		lb    $t1, comb($t0)   
      	sub   $t1, $t1, '0'    # $t1: grid
      	add   $t0, $t0, 1
      	lb    $t2, comb($t0)   
      	sub   $t2, $t2, 'a'    # $t2: cell
      	add   $t0, $t0, 1      
      	
      	div  $t3, $t2, 4
        mul  $t3, $t3, 16   
        mul  $t4, $t1, 4
        div  $t5, $t2, 4
        mfhi $t5
        add  $t3, $t3, $t4
        add  $t3, $t3, $t5
        mul  $t3, $t3, 2
        lh   $t4, offset($t3) 
        lb $t5, board($t4)
        lb	$t6, userGamePiece
        
        bne   $t5, $t6, aiBlockMoveInc5
        
        ############
        
        
        lb    $t1, comb($t0)   
      	sub   $t1, $t1, '0'    # $t1: grid
      	add   $t0, $t0, 1
      	lb    $t2, comb($t0)   
      	sub   $t2, $t2, 'a'    # $t2: cell
      	add   $t0, $t0, 1      
      	
      	div  $t3, $t2, 4
        mul  $t3, $t3, 16   
        mul  $t4, $t1, 4
        div  $t5, $t2, 4
        mfhi $t5
        add  $t3, $t3, $t4
        add  $t3, $t3, $t5
        mul  $t3, $t3, 2
        lh   $t4, offset($t3) 
        lb $t5, board($t4)
        lb	$t6, userGamePiece
        
        bne   $t5, $t6, aiBlockMoveInc3
        
        
        ###############
        
        lb    $t1, comb($t0)   
      	sub   $t1, $t1, '0'    # $t1: grid
      	add   $t0, $t0, 1
      	lb    $t2, comb($t0)   
      	sub   $t2, $t2, 'a'    # $t2: cell
      	add   $t0, $t0, 1      
      	
      	div  $t3, $t2, 4
        mul  $t3, $t3, 16   
        mul  $t4, $t1, 4
        div  $t5, $t2, 4
        mfhi $t5
        add  $t3, $t3, $t4
        add  $t3, $t3, $t5
        mul  $t3, $t3, 2
        lh   $t4, offset($t3) 
        lb $t5, board($t4)
        lb	$t6, userGamePiece
       
        bne   $t5, $t6, aiBlockMoveInc1
        ########
        j aiBlockMoveGridAssign
        
aiBlockMoveInc5:
	add $t0, $t0, 5
	j aiBlockMoveLoop
	
aiBlockMoveInc3:

	add $t0, $t0, 3
	j aiBlockMoveLoop
aiBlockMoveInc1:

    add $t0, $t0, 1
	j aiBlockMoveLoop
      
aiBlockMoveGridAssign:
		move $s7, $t0 #s7 is fail safe number
       divu $t1, $t0, 784

       mul $t3, $t1, 784
       sub $t0, $t0, $t3
       divu $t2, $t0, 49
     
       
       #add $t0, $t0, 1
       
       sb $t1, grid
       sb $t2, cell
   
   
        lw	$t1,cell  # loads the userCell data into $t1
		divu	$t1, $t1, 4 # divides $t1 by 4 and stores back into #t1
		mul	$t1 , $t1, 16# multiply into t1 by 16
	 	lw	$t2, grid # loads userGrid value into $t2
		mul	$t2, $t2 ,4 # multiply userGrid value by 4
		add $t0, $t1,$t2 # adds $t1 and $t2 but stores the value into $t0
		lw	$s0, cell #loads userCell value ibto $s0
		divu	$t3, $s0, 4 #divides $s0 valie by 4 and stores it into $t3
		mfhi	$t3 #modulous operation
		add	$t0, $t0,$t3 # adds $t0 and $t3 and puts it into $t0
	
		mul	$t0, $t0, 2        # Becuase each offset is two-bytes long.
		
		lh	$t1, offset($t0) #checking to see if spot is already taken on board
		lb 	$t7, board($t1) 
		bne 	$t7, '.', aiBlockMoveFailsafe
		#lw	$t2, userGamePiece #loads the UserGamePiece choice into $t2 to print to the board
		lb $t2, aiGamePiece
		sb	$t2, board($t1)    # Put the piece at the location, board+offset.
		
		li $v0, 4		#system call code for printing string = 4.
		la $a0, board 	#load address of string to be printed into $a0
		syscall			#call operating system to perform operation that is specified in $v0
       
      j aiWinCheck
      
aiBlockMoveFailsafe:
		move $t0, $s7
		add $t0, $t0, 1
		j aiBlockMoveLoop

aiMaxGain: #The move will result in a line with the greatest number of System’s markers and without user’s markers then jump to check for winner

aiRandom: #The AI randomly generates a random move then jump to check for winner
		
		xor  $a0, $a0, $a0     # Set a seed number to generate grid
    	li   $a1, 4      		# random number 0 to 3
      	li   $v0, 42           # random number generator
      	syscall
		
		beq $a0, 0, aiGrid0
		beq $a0, 1, aiGrid1
		beq $a0, 2, aiGrid2
		beq $a0, 3, aiGrid3
		
aiGrid0:
		li $v1, 0
		sb $v1, grid  #assigns the users grid choice to memory
		j aiCell

aiGrid1:
		li $v1, 1
		sb $v1, grid  #assigns the users grid choice to memory
		j aiCell

aiGrid2:
		li $v1, 2
		sb $v1, grid  #assigns the users grid choice to memory
		j aiCell

aiGrid3:
		li $v1, 3
		sb $v1, grid  #assigns the users grid choice to memory
		j aiCell
		
aiCell:
		xor  $a0, $a0, $a0     # Set a seed number to generate grid
    	li   $a1, 16      		# random number 0 to 15
      	li   $v0, 42           # random number generator
      	syscall
		
		beq $a0, 0, aiCella
		beq $a0, 1, aiCellb
		beq $a0, 2, aiCellc
		beq $a0, 3, aiCelld
		beq $a0, 4, aiCelle
		beq $a0, 5, aiCellf
		beq $a0, 6, aiCellg
		beq $a0, 7, aiCellh
		beq $a0, 8, aiCelli
		beq $a0, 9, aiCellj
		beq $a0, 10, aiCellk
		beq $a0, 11, aiCelll
		beq $a0, 12, aiCellm
		beq $a0, 13, aiCelln
		beq $a0, 14, aiCello
		beq $a0, 15, aiCellp
		
aiCella:
		li $v0, 'a'
		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		j aiCellAccept
		
aiCellb:
		li $v0, 'b'
		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		j aiCellAccept
		
aiCellc:
		li $v0, 'c'
		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		j aiCellAccept
		
aiCelld:
		li $v0, 'd'
		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		j aiCellAccept
		
aiCelle:
		li $v0, 'e'
		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		j aiCellAccept
		
aiCellf:
		li $v0, 'f'
		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		j aiCellAccept
		
aiCellg:
		li $v0, 'g'
		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		j aiCellAccept
		
aiCellh:
		li $v0, 'h'
		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		j aiCellAccept
		
aiCelli:
		li $v0, 'i'
		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		j aiCellAccept
		
aiCellj:
		li $v0, 'j'
		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		j aiCellAccept
		
aiCellk:
		li $v0, 'k'
		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		j aiCellAccept
		
aiCelll:
		li $v0, 'l'
		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		j aiCellAccept
		
aiCellm:
		li $v0, 'm'
		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		j aiCellAccept
		
aiCelln:
		li $v0, 'n'
		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		j aiCellAccept
		
aiCello:
		li $v0, 'o'
		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		j aiCellAccept
		
aiCellp:
		li $v0, 'p'
		sub $v0,$v0,'a' #subtracts a from the cell selection
		sb $v0, cell  #assigns the users grid choice to memory
		j aiCellAccept
		
		
aiCellAccept:

		lw	$t1,cell  # loads the Cell data into $t1
		divu	$t1, $t1, 4 # divides $t1 by 4 and stores back into #t1
		mul	$t1 , $t1, 16# multiply into t1 by 16
	 	lw	$t2, grid # loads userGrid value into $t2
		mul	$t2, $t2 ,4 # multiply userGrid value by 4
		add $t0, $t1,$t2 # adds $t1 and $t2 but stores the value into $t0
		lw	$s0, cell #loads userCell value ibto $s0
		divu	$t3, $s0, 4 #divides $s0 valie by 4 and stores it into $t3
		mfhi	$t3 #modulous operation
		add	$t0, $t0,$t3 # adds $t0 and $t3 and puts it into $t0
	
		mul	$t0, $t0, 2        # Becuase each offset is two-bytes long.
		
		lh	$t1, offset($t0) #checking to see if spot is already taken on board
		lb 	$t7, board($t1)      
		bne 	$t7, '.', aiRandom
		
		lw	$t2, aiGamePiece #loads the AiGamePiece choice into $t2 to print to the board
		sb	$t2, board($t1)    # Put the piece at the location, board+offset.
		
		li $v0, 4		#system call code for printing string = 4.
		la $a0, board 	#load address of string to be printed into $a0
		syscall			#call operating system to perform operation that is specified in $v0
		
	
		
aiWinCheck: #checks if AI won and said what piece AI had
#####################
       	lw $a0, grid
      	mul  $t0, $a0, 16
       
      	lw $a0, cell
      	add  $t0, $t0, $a0
      	mul  $t0, $t0, 49 #comb($t0) is the starting spot
      	li $a2, 0
      	
aiCombCheck:
      	lb    $t1, comb($t0)   
      	sub   $t1, $t1, '0'    # $t1: grid
      	add   $t0, $t0, 1
      	lb    $t2, comb($t0)   
      	sub   $t2, $t2, 'a'    # $t2: cell
      	add   $t0, $t0, 1      
      	
      	div  $t3, $t2, 4
        mul  $t3, $t3, 16   
        mul  $t4, $t1, 4
        div  $t5, $t2, 4
        mfhi $t5
        add  $t3, $t3, $t4
        add  $t3, $t3, $t5
        mul  $t3, $t3, 2
        lh   $t4, offset($t3) 
        lb $t5, board($t4)
        lb	$t6, aiGamePiece
       
        beq   $t5, $t6, aiCombCheck2
        
        add $t0, $t0, 5
        j aiLoop
        
        
        ########################
        
aiCombCheck2:
        lb    $t1, comb($t0)   
      	sub   $t1, $t1, '0'    # $t1: grid
      	add   $t0, $t0, 1
      	lb    $t2, comb($t0)   
      	sub   $t2, $t2, 'a'    # $t2: cell
      	add   $t0, $t0, 1      
      	
      	div  $t3, $t2, 4
        mul  $t3, $t3, 16   
        mul  $t4, $t1, 4
        div  $t5, $t2, 4
        mfhi $t5
        add  $t3, $t3, $t4
        add  $t3, $t3, $t5
        mul  $t3, $t3, 2
        lh   $t4, offset($t3) 
        lb $t5, board($t4)
        lb	$t6, aiGamePiece
        
        beq   $t5, $t6, aiCombCheck3
        
        add $t0, $t0, 3
        j aiLoop
       
       ##########################
       
aiCombCheck3:
       
       lb    $t1, comb($t0)   
      	sub   $t1, $t1, '0'    # $t1: grid
      	add   $t0, $t0, 1
      	lb    $t2, comb($t0)   
      	sub   $t2, $t2, 'a'    # $t2: cell
      	add   $t0, $t0, 1      
      	
      	div  $t3, $t2, 4
        mul  $t3, $t3, 16   
        mul  $t4, $t1, 4
        div  $t5, $t2, 4
        mfhi $t5
        add  $t3, $t3, $t4
        add  $t3, $t3, $t5
        mul  $t3, $t3, 2
        lh   $t4, offset($t3) 
        lb $t5, board($t4)
        lb	$t6, aiGamePiece
       
        beq   $t5, $t6, aiWinCondition
        
        add $t0, $t0, 1
        j aiLoop

aiWinCondition:
      	li    $v0, 4
      	la    $a0, aiWin 
      	syscall
      	
      	li $v0, 4
      	la $a0, winningPiece
      	syscall
      	
      	li $v0, 4
      	la $a0, aiGamePiece
      	syscall
      	
      	j newGame
      	
aiLoop:

	add $a2, $a2, 1
	bne $a2, 7, aiCombCheck
		


################
aiContinue: #asks player if he wants to continue the game

	li $t0, 6
	aiTieLoop:
	lb $t7, board($t0)
	beq $t7, '.', continueAi

	add $t0, $t0, 2
	lb $t7, board($t0)
	beq $t7, '.', continueAi

	add $t0, $t0, 2
	lb $t7, board($t0)
	beq $t7, '.', continueAi

	add $t0, $t0, 2
	lb $t7, board($t0)
	beq $t7, '.', continueAi
	beq $t0, 204, aiTie
	add $t0, $t0, 2
	j aiTieLoop
	
aiTie:
	li $v0, 4
	la $a0, tieGameMessage
	syscall
	j newGame
	
continueAi:
		li $a2, 0
		li $v0, 4		#system call code for printing string = 4.
		la $a0, continueSelection 	#load address of string to be printed into $a0
		syscall			#call operating system to perform operation that is specified in $v0
		
		li $v0, 12
		syscall
		
		beq $v0, 'y', userMove
		beq $v0, 'n', newGame
		
		li $v0, 4
		la $a0, invalidSelectionString
		syscall
		j aiContinue

newGame:
		li $v0, 4
		la $a0, newGameSelection
		syscall
		
		li $v0, 12
		syscall
		
		beq $v0, 'y', resetGame
		beq $v0, 'n', endGame
		j newGame

resetGame:
		li $t0, 0
		
resetLoop: 
		lb $t1, newBoard($t0) #address offset goes in the parenthesiss
		sb $t1, board($t0)
		add $t0, $t0, 1
		blt $t0, 256, resetLoop
		j gameStart
		
		
endGame:

		li $v0,10 #terminate program
		syscall
