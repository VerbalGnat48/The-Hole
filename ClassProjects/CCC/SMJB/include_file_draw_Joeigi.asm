;;;;;;;;;;;;;;;;;;;;;;;;;
_character_equals_1:

	; Small Joeigi draws
	;Joeigi standing facing right
	mov T1,			0
	out Texture,	T1
	out Region,		T1
	mov T1,			162
	mov T2,			16
	mov X,			174
	mov Y,			31
	mov R4,			168
	mov R5,			24
	call _define_region

	;Joeigi running leftmost right
	mov T1, 		0
	out Texture, 	T1
	out Region, 	1
	mov T1, 		192
	mov T2, 		16
	mov X, 			207
	mov Y, 			32
	mov R4, 		200
	mov R5, 		24
	call _define_region

	;Joeigi running middle right
	mov T1, 		0
	out Texture, 	T1
	out Region, 	2
	mov T1, 		211
	mov T2, 		16
	mov X, 			222
	mov Y, 			32
	mov R4, 		216
	mov R5, 		24
	call _define_region

	;Joeigi running rightmost right
	mov T1, 		0
	out Texture, 	T1
	out Region, 	3
	mov T1, 		226
	mov T2, 		16
	mov X, 			238
	mov Y, 			31
	mov R4, 		232
	mov R5, 		24
	call _define_region

	;Joeigi Jumping right
	mov T1, 		0
	out Texture, 	T1
	out Region, 	4
	mov T1, 		256
	mov T2, 		16
	mov X, 			272
	mov Y, 			31
	mov R4, 		266
	mov R5, 		26
	call _define_region

	;Joeigi Dies
	mov T1,			0
	out Texture,	T1
	out Region,		5
	mov T1,			289
	mov T2,			12
	mov X,			303
	mov Y,			30
    mov R4,         296
    mov R5,         23
	call _define_region
;;;;;;;;;;;;;;;;;;;;;;;;;

	;Joeigi between sizes
	mov T1,			0
	out Texture,	T1
	mov T1,			7
	out Region,		T1
	mov T1,			176
	mov T2,			72
	mov X,			191
	mov Y,			96
	mov R4,			184
	mov R5,			87
	call _define_region

;;;;;;;;;;;;;;;;;;;;;;;;;
	; Big Joeigi Draws
	;Joeigi Big Standing
	mov T1,			0
	out Texture,	T1
	mov T1,			10
	out Region,		T1
	mov T1,			160
	mov T2,			32
	mov X,			176
	mov Y,			64
	mov R4,			168
	mov R5,			48
	call _define_region

	;Joeigi Big running leftmost right
	mov T1, 		0
	out Texture, 	T1
	out Region, 	11
	mov T1, 		192
	mov T2, 		34
	mov X, 			208
	mov Y, 			63
	mov R4, 		200
	mov R5, 		48
	call _define_region

	;Joeigi Big running middle right
	mov T1, 		0
	out Texture, 	T1
	out Region, 	12
	mov T1, 		210
	mov T2, 		33
	mov X, 			222
	mov Y, 			64
	mov R4, 		216
	mov R5, 		48
	call _define_region

	;Joeigi Big running rightmost right
	mov T1, 		0
	out Texture, 	T1
	out Region, 	13
	mov T1, 		224
	mov T2, 		32
	mov X, 			240
	mov Y, 			63
	mov R4, 		233
	mov R5, 		48
	call _define_region

	;Joeigi Big Jumping right
	mov T1, 		0
	out Texture, 	T1
	out Region, 	14
	mov T1, 		256
	mov T2, 		32
	mov X, 			272
	mov Y, 			64
	mov R4, 		265
	mov R5, 		48
	call _define_region

	
_character_equals_1_ret:
    ret
;;;;;;;;;;;;;;;;;;;;;;;;;
