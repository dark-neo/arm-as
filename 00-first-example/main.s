
	@ Copyright (c) 2014 dark_neo
	@ All rights reserved.

	.section .data
msg:
	.ascii	"Hello ARM!"
	.byte	0x0A
	len	= . - msg

# Code section
	.section .text
	.globl _start

_start:
	# syscall write(int fd, const void *buf, size_t count);
	mov	%r0,	$0x01
	ldr	%r1,	=msg
	ldr	%r2,	=len
	mov	%r7,	$0x04
	swi	$0x00

	# syscall exit(int status);
	mov	%r0,	$0x00
	mov	%r7,	$0x01
	swi	$0x00

