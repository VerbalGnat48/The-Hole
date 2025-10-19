;;;;;;;;;;;;;;;;;;;;;;;;;
_character_equals_0:

	; Small Mattio draws
	;Mattio standing facing right
	mov T1,			0
	out Texture,	T1
	out Region,		T1
	mov T1,			0
	mov T2,			16
	mov X,			15
	mov Y,			31
	mov R4,			8
	mov R5,			24
	call _define_region

	;Mattio running leftmost right
	mov T1, 		0
	out Texture, 	T1
	out Region, 	1
	mov T1, 		32
	mov T2, 		16
	mov X, 			47
	mov Y, 			32
	mov R4, 		40
	mov R5, 		24
	call _define_region

	;Mattio running middle right
	mov T1, 		0
	out Texture, 	T1
	out Region, 	2
	mov T1, 		49
	mov T2, 		16
	mov X, 			61
	mov Y, 			32
	mov R4, 		56
	mov R5, 		24
	call _define_region

	;Mattio running rightmost right
	mov T1, 		0
	out Texture, 	T1
	out Region, 	3
	mov T1, 		64
	mov T2, 		16
	mov X, 			79
	mov Y, 			31
	mov R4, 		72
	mov R5, 		24
	call _define_region

	;Mattio Jumping right
	mov T1, 		0
	out Texture, 	T1
	out Region, 	4
	mov T1, 		96
	mov T2, 		16
	mov X, 			112
	mov Y, 			31
	mov R4, 		105
	mov R5, 		26
	call _define_region

	;Mattio Dies
	mov T1,			0
	out Texture,	T1
	out Region,		5
	mov T1,			129
	mov T2,			12
	mov X,			143
	mov Y,			30
	call _define_region
;;;;;;;;;;;;;;;;;;;;;;;;;

	;Mattio between sizes
	mov T1,			0
	out Texture,	T1
	mov T1,			7
	out Region,		T1
	mov T1,			16
	mov T2,			72
	mov X,			31
	mov Y,			96
	mov R4,			24
	mov R5,			87
	call _define_region

;;;;;;;;;;;;;;;;;;;;;;;;;
	; Big Mattio Draws
	;Mattio Big Standing
	mov T1,			0
	out Texture,	T1
	mov T1,			10
	out Region,		T1
	mov T1,			0
	mov T2,			32
	mov X,			15
	mov Y,			63
	mov R4,			8
	mov R5,			48
	call _define_region

	;Mattio Big running leftmost right
	mov T1, 		0
	out Texture, 	T1
	out Region, 	11
	mov T1, 		32
	mov T2, 		34
	mov X, 			47
	mov Y, 			63
	mov R4, 		40
	mov R5, 		48
	call _define_region

	;Mattio Big running middle right
	mov T1, 		0
	out Texture, 	T1
	out Region, 	12
	mov T1, 		48
	mov T2, 		33
	mov X, 			63
	mov Y, 			64
	mov R4, 		56
	mov R5, 		48
	call _define_region

	;Mattio running rightmost right
	mov T1, 		0
	out Texture, 	T1
	out Region, 	13
	mov T1, 		64
	mov T2, 		32
	mov X, 			80
	mov Y, 			63
	mov R4, 		72
	mov R5, 		48
	call _define_region

	;Mattio Jumping right
	mov T1, 		0
	out Texture, 	T1
	out Region, 	14
	mov T1, 		96
	mov T2, 		32
	mov X, 			112
	mov Y, 			64
	mov R4, 		105
	mov R5, 		48
	call _define_region

	
_character_equals_0_ret:
    ret
;;;;;;;;;;;;;;;;;;;;;;;;;
