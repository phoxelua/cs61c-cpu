MOD:
	# init
	# addi	$r1, $r1, 0x2
	# addi	$r0, $r0, 0x5
	sw		$r3, 2($r1) #remember jump point
	addi	$r2, $r2, 0x1 #set to 1

	#assume r1 = MEM[1], r2 = MEM[2] ..?
	
LOOP:
	slt		$r3, $r0, $r1 #MEM[0] < MEM[1]?
	beq		$r3, $r2, DONE #branch to DONE if MEM[0] < MEM[1]
	sub		$r0, $r0, $r1
	j LOOP

DONE:
	addi 	$r2, $r0, 0x0
	lw		$r3, 2($r1)
	jr		$r3

