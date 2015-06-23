;
; memtest1.s -- memory test
;

; $2 temporary
; $3 tbl address
; $4 mem address
; $7 character to output
; $8 I/O base
; $10 reference value

	.set	mem_base,0xC0000000
	.set	io_base,0xF0300000

	;
	; write memory (words)
	;
wwrite:
	add	$4,$0,mem_base
	add	$3,$0,tbl
	ldw	$2,$3,0
	stw	$2,$4,0
	add	$7,$0,'.'
	jal	out
	ldw	$2,$3,4
	stw	$2,$4,4
	add	$7,$0,'.'
	jal	out
	ldw	$2,$3,8
	stw	$2,$4,8
	add	$7,$0,'.'
	jal	out
	ldw	$2,$3,12
	stw	$2,$4,12
	add	$7,$0,'.'
	jal	out
	add	$7,$0,0x0D
	jal	out
	add	$7,$0,0x0A
	jal	out
	;
	; read memory (words)
	;
wread0:
	ldw	$10,$3,0
	ldw	$2,$4,0
	bne	$10,$2,wread0n
	add	$7,$0,'.'
	jal	out
	j	wread1
wread0n:
	add	$7,$0,'?'
	jal	out
wread1:
	ldw	$10,$3,4
	ldw	$2,$4,4
	bne	$10,$2,wread1n
	add	$7,$0,'.'
	jal	out
	j	wread2
wread1n:
	add	$7,$0,'?'
	jal	out
wread2:
	ldw	$10,$3,8
	ldw	$2,$4,8
	bne	$10,$2,wread2n
	add	$7,$0,'.'
	jal	out
	j	wread3
wread2n:
	add	$7,$0,'?'
	jal	out
wread3:
	ldw	$10,$3,12
	ldw	$2,$4,12
	bne	$10,$2,wread3n
	add	$7,$0,'.'
	jal	out
	j	wread4
wread3n:
	add	$7,$0,'?'
	jal	out
wread4:
	add	$7,$0,0x0D
	jal	out
	add	$7,$0,0x0A
	jal	out
	add	$7,$0,0x0D
	jal	out
	add	$7,$0,0x0A
	jal	out
	;
	; write memory (halfwords)
	;
hwrite:
	add	$4,$0,mem_base
	add	$3,$0,tbl
	ldhu	$2,$3,16
	sth	$2,$4,16
	add	$7,$0,'.'
	jal	out
	ldhu	$2,$3,18
	sth	$2,$4,18
	add	$7,$0,'.'
	jal	out
	ldhu	$2,$3,20
	sth	$2,$4,20
	add	$7,$0,'.'
	jal	out
	ldhu	$2,$3,22
	sth	$2,$4,22
	add	$7,$0,'.'
	jal	out
	add	$7,$0,0x0D
	jal	out
	add	$7,$0,0x0A
	jal	out
	;
	; read memory (halfwords)
	;
hread0:
	ldhu	$10,$3,16
	ldhu	$2,$4,16
	bne	$10,$2,hread0n
	add	$7,$0,'.'
	jal	out
	j	hread1
hread0n:
	add	$7,$0,'?'
	jal	out
hread1:
	ldhu	$10,$3,18
	ldhu	$2,$4,18
	bne	$10,$2,hread1n
	add	$7,$0,'.'
	jal	out
	j	hread2
hread1n:
	add	$7,$0,'?'
	jal	out
hread2:
	ldhu	$10,$3,20
	ldhu	$2,$4,20
	bne	$10,$2,hread2n
	add	$7,$0,'.'
	jal	out
	j	hread3
hread2n:
	add	$7,$0,'?'
	jal	out
hread3:
	ldhu	$10,$3,22
	ldhu	$2,$4,22
	bne	$10,$2,hread3n
	add	$7,$0,'.'
	jal	out
	j	hread4
hread3n:
	add	$7,$0,'?'
	jal	out
hread4:
	add	$7,$0,0x0D
	jal	out
	add	$7,$0,0x0A
	jal	out
	add	$7,$0,0x0D
	jal	out
	add	$7,$0,0x0A
	jal	out
	;
	; write memory (bytes)
	;
bwrite:
	add	$4,$0,mem_base
	add	$3,$0,tbl
	ldbu	$2,$3,32
	stb	$2,$4,32
	add	$7,$0,'.'
	jal	out
	ldbu	$2,$3,33
	stb	$2,$4,33
	add	$7,$0,'.'
	jal	out
	ldbu	$2,$3,34
	stb	$2,$4,34
	add	$7,$0,'.'
	jal	out
	ldbu	$2,$3,35
	stb	$2,$4,35
	add	$7,$0,'.'
	jal	out
	add	$7,$0,0x0D
	jal	out
	add	$7,$0,0x0A
	jal	out
	;
	; read memory (bytes)
	;
bread0:
	ldbu	$10,$3,32
	ldbu	$2,$4,32
	bne	$10,$2,bread0n
	add	$7,$0,'.'
	jal	out
	j	bread1
bread0n:
	add	$7,$0,'?'
	jal	out
bread1:
	ldbu	$10,$3,33
	ldbu	$2,$4,33
	bne	$10,$2,bread1n
	add	$7,$0,'.'
	jal	out
	j	bread2
bread1n:
	add	$7,$0,'?'
	jal	out
bread2:
	ldbu	$10,$3,34
	ldbu	$2,$4,34
	bne	$10,$2,bread2n
	add	$7,$0,'.'
	jal	out
	j	bread3
bread2n:
	add	$7,$0,'?'
	jal	out
bread3:
	ldbu	$10,$3,35
	ldbu	$2,$4,35
	bne	$10,$2,bread3n
	add	$7,$0,'.'
	jal	out
	j	bread4
bread3n:
	add	$7,$0,'?'
	jal	out
bread4:
	add	$7,$0,0x0D
	jal	out
	add	$7,$0,0x0A
	jal	out
	add	$7,$0,0x0D
	jal	out
	add	$7,$0,0x0A
	jal	out
	;
	; finally, halt
	;
halt:
	j	halt

	;
	; output on terminal
	;
out:
	add	$8,$0,io_base
out1:
	ldw	$9,$8,8
	and	$9,$9,1
	beq	$9,$0,out1
	stw	$7,$8,12
	jr	$31

	;
	; table of random values
	;
	.align	4
tbl:
	.byte	0x45,0x23,0x98,0x48,0xDC,0x5C,0x94,0x58
	.byte	0x1F,0x7C,0x58,0xD7,0x41,0x1E,0xA9,0xE1
	.byte	0x00,0x62,0x08,0x27,0x23,0xE9,0xCD,0x43
	.byte	0x0F,0x25,0xF9,0x72,0xC2,0xD7,0xC4,0x07
	.byte	0xFB,0x5D,0x50,0xD7,0xBA,0xE4,0x30,0xD9
	.byte	0x61,0x89,0xB1,0xA3,0xA8,0x5A,0x84,0xA8
	.byte	0xBD,0x8C,0xD0,0xE0,0x76,0x9E,0x24,0x86
	.byte	0xC4,0x1D,0xF8,0x86,0xF5,0xBD,0x8D,0xF0
	.byte	0x1A,0xDD,0xC8,0xD4,0xC2,0xF8,0xAD,0x23
	.byte	0x82,0x5F,0xC6,0x2A,0xB9,0x4A,0xD3,0x77
	.byte	0xD7,0xA4,0x58,0x4E,0x42,0x7C,0xD4,0x06
	.byte	0x9A,0xCC,0x8D,0x8F,0x89,0x1B,0x7F,0xA4
	.byte	0xF9,0x48,0x78,0xBB,0x40,0x26,0xDE,0xC3
	.byte	0x85,0xA5,0xED,0x3F,0xF0,0xC1,0xB7,0xC7
	.byte	0x65,0x0F,0x15,0xA8,0x8C,0xE9,0xAF,0x26
	.byte	0xB6,0x3C,0xB6,0x40,0x57,0x35,0xE4,0x50
	.byte	0x7E,0x5D,0x0B,0xBF,0x84,0xEA,0x82,0x0A
	.byte	0x8F,0x70,0x4A,0x7F,0x31,0x02,0x47,0x96
	.byte	0x12,0x5D,0x3F,0x9E,0x47,0xEE,0xC5,0xFD
	.byte	0x2B,0x7B,0x3E,0x82,0xB1,0x23,0xD3,0x2F
	.byte	0x81,0xDF,0xEE,0x06,0xCA,0x70,0x11,0x59
	.byte	0xE0,0x5B,0xD9,0x11,0x5E,0x21,0xA8,0x70
	.byte	0x7E,0xE7,0x0E,0xC5,0xD6,0xD4,0xC3,0x01
	.byte	0x4F,0x01,0x84,0x01,0x24,0x57,0x30,0xA5
	.byte	0x37,0x1E,0xAC,0x01,0x8F,0xBD,0x5A,0x70
	.byte	0x18,0x34,0x82,0x77,0x55,0x2A,0xE7,0xD3
	.byte	0x12,0xF6,0x99,0xE8,0xCA,0x5C,0xEA,0x1A
	.byte	0x5D,0x6E,0x1B,0x82,0xC5,0x4B,0x28,0xFD
	.byte	0x6A,0xD4,0xFE,0xFA,0x91,0x59,0x6A,0xAA
	.byte	0x8D,0xEC,0x21,0xE3,0x17,0x09,0xB7,0x29
	.byte	0xFF,0x50,0x12,0xC9,0xAC,0xFC,0xE3,0x0A
	.byte	0x6B,0xFF,0x8D,0x31,0x4A,0xB5,0x2E,0xB5
	.byte	0x8A
augment:
	.byte	0x45,0x23,0x98
