OCTAL:
	# init
	addi	$r0, $r0, 0x0
	# addi	$r0, $r0, 0x37
	# sw		$r0, 0($r0)
	# disp 	$r0, 1
	sw		$r3, 2($r0) #remember jump point



	# mid3 = mid3 << 1 | low3
	lw 		$r1, 0($r0) # load 16 bits
	andi	$r0, $r0, 0x0
	addi	$r0, $r0, 0x1 #prep shift amount
	andi	$r3, $r1, 0x7 #get lower 3 bits
	andi	$r2, $r1, 0x38 #get middle 3 bits
	sllv	$r2, $r2, $r0 # mid3 << 1
	or		$r2, $r2, $r3 # mid3 | low3


	# mid3 = high3 << 1 | mid3
	addi	$r0, $r0, 0x5 #shamt now 6
	srlv	$r3, $r1, $r0 #get upper 3 bits (clobber low3 reg)
	andi	$r3, $r3, 0x7 
	addi	$r0, $r0, 0x1 #shamt now 7
	sllv	$r3, $r3, $r0 #high3 << 7
	or		$r2, $r3, $r2 # combine all together

	disp	$r2, 0 #display result on bundle0

	#end
	andi	$r0, $r0, -7 #reset 0
	lw 		$r3, 2($r0)	#restore jump point
	jr		$r3