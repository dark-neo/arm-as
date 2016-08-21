
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@ Copyright (c) 2014 dark_neo    @
	@ All rights reseerved.		 @
	@				 @
	@ Licensed under BSD license.	 @
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	@ UNIX I/O kernel functions.

	.section	.bss
	.comm	buffer,	0x40			@ Reserve 64 bytes for input buffer.
	
	.section	.data
msg1:
	.asciz	"Enter your name: "
msg1_len	=	.	- 	msg1

msg2:
	.ascii		"\nYour name is: "
msg2_len	=	.	-	msg2


	.section	.text
	.globl		_start

_start:
	@ ssize_t
	@ write(int fd, const void *buf, size_t nbytes);
	mov			%r0,		$0x01			@ stdout
	ldr			%r1,		=msg1
	ldr			%r2,		=msg1_len
	mov			%r7,		$0x04			@ Android write() sys_call
	swi			$0x00

	@ ssize_t
	@ read(int fd, void *buf, size_t nbytes);
	mov			%r0,		$0x00			@ stdin
	ldr			%r1,		=buffer
	mov			%r2,		$0x40
	mov			%r7,		$0x03			@ Android read() sys_call
	swi			$0x00

	@ write() 
	mov			%r0,		$0x01
	ldr			%r1,		=msg2
	ldr			%r2,		=msg2_len
	mov			%r7,		$0x04
	swi			$0x00

	@ write()
	mov			%r0,		$0x01			@ stdout
	ldr			%r1,		=buffer
	mov			%r2,		$0x40
	mov			%r7,		$0x04
	swi			$0x00

	@ call exit(int status);
	mov			%r0,		$0x00
	mov			%r7,		$0x01
	swi			$0x00

