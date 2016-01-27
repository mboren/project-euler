main:
	# $t0 holds current number
	li	$t0, 3

	# $t1 holds sum
	li	$t1, 0

loopstart:

	# if $t0 > 999, goto loopend
	bgtu	$t0, 999, loopend

	# if $t0 divisble by 3, goto accept
	remu	$t3, $t0, 3
	beqz	$t3, accept

	# else if $t0 divisible by 5, goto accept
	remu	$t5, $t0, 5
	beqz	$t5, accept

	# else
	j reject

accept:
	# add current value to total
	addu	$t1, $t1, $t0

reject:
	# increment $t0
	addiu	$t0, $t0, 1

	j loopstart

loopend:

	# print integer
	li	$v0, 1
	move	$a0, $t1
	syscall

	# exit
	li	$v0, 10
	syscall
