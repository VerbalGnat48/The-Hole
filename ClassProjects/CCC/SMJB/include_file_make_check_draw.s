
_MCD_main:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Update Boundaries
;;
_Background_Initializer_1:
	mov T1,			[BGF1]			;Chcking if Background 1 is active
	ieq T1,			0
	jf T1,			_bgi2			;If not check the next background

	;Pipe 1 Boundary values
	mov T1,			[BGX1]
	iadd T1,		640
	isub T1,		384			;1280 - (X on Sprite Sheet x 2) is the sub number
	mov [PipeL1],		T1
	iadd T1,		64
	mov [PipeR1],		T1
	mov T1,			[BGY]
	iadd T1,		204			;Samll Pipe top
	mov [PipeT1],		T1

	;Pipe 2 Boundary values
	mov T1,			[BGX1]
	iadd T1,		640
	isub T1,		64
	mov [PipeL2],		T1
	iadd T1,		64
	mov [PipeR2],		T1
	mov T1,			[BGY]
	iadd T1,		172			;Medium Pipe Top
	mov [PipeT2],		T1

	;Brick 1 Boundary Values
	mov T2,			[BGX1]
	mov T3,			BrickL1
	mov T4,			640
	mov T5,			140
	call _brick_maker

	;Brick 2 Boundary Values
	mov T2,			[BGX1]
	mov T3,			BrickL2
	mov T4,			576
	mov T5,			140
	call _brick_maker

	;Brick 3 Boundary Values
	mov T2,			[BGX1]
	mov T3,			BrickL3
	mov T4,			512
	mov T5,			140
	call _brick_maker

	;Mystery 1 Boundary Values (Coin 1)
	mov T2,			[BGX1]
	mov T3,			MystL1
	mov T4,			768
	mov T5,			140
	call _brick_maker
	mov T3,			CoinL1
	isub T5,		32
	call _item_maker

	;Mystery 2 Boundary Values (Mushroom 1)
	mov T2,			[BGX1]
	mov T3,			MystL2
	mov T4,			608
	mov T5,			140
	call _brick_maker
	mov T3,			MushL1
	mov T4,			[MushX1]
	mov T5,			[MushY1]
	call _item_maker

	;Mystery 3 Boundary Values (Coin 2)
	mov T2,			[BGX1]
	mov T3,			MystL3
	mov T4,			576
	mov T5,			0
	call _brick_maker
	mov T3,			CoinL2
	isub T5,		32
	call _item_maker

	;Mystery 4 Boundary Values (Coin 3)
	mov T2,			[BGX1]
	mov T3,			MystL4
	mov T4,			544
	mov T5,			140
	call _brick_maker
	mov T3,			CoinL3
	isub T5,		32
	call _item_maker

	;Goomba 1 Boundary Values
	mov T2,			[BGX1]
	mov T3,			GoomL1
	mov T4,			[GoomX1]
	mov T5,			[GoomY1]
	call _goomba_maker

_bgi2:
	mov T1,			[BGF2]
	ieq T1,			0
	jf T1,			_bgi3

	;Pipe 3 Boundary values
	mov T1,			[BGX2]
	iadd T1,		640
	isub T1,		1088
	mov [PipeL3],		T1
	iadd T1,		64
	mov [PipeR3],		T1
	mov T1,			[BGY]
	iadd T1,		140			;Tall Pipe Top
	mov [PipeT3],		T1

	;Pipe 4 Boundary values
	mov T1,			[BGX2]
	iadd T1,		640
	isub T1,		736
	mov [PipeL4],		T1
	iadd T1,		64
	mov [PipeR4],		T1
	mov T1,			[BGY]
	iadd T1,		140
	mov [PipeT4],		T1

	;Brick 4 Boundary Values
	mov T2,			[BGX2]
	mov T3,			BrickL4
	mov T4,			96
	mov T5,			140
	call _brick_maker

	;Brick 5 Boundary Values
	mov T2,			[BGX2]
	mov T3,			BrickL5
	mov T4,			32
	mov T5,			140
	call _brick_maker

	;Hole 1 Boundary values
	mov T1,			[BGX2]
	iadd T1,		640
	isub T1,		352
	mov [HoleL1],		T1
	iadd T1,		64
	mov [HoleR1],		T1
	mov T1,			[BGY]
	iadd T1,		268
	mov [HoleT1],		T1

	;Mystery 5 Boundary Values
	mov T2,			[BGX2]
	mov T3,			MystL5
	mov T4,			64
	mov T5,			140
	call _brick_maker
	mov T3,			MushL2
	mov T4,			[MushX2]
	mov T5,			[MushY2]
	call _item_maker

	;Invis 1 Boundary Values
	mov T2,			[BGX2]
	mov T3,			InvisL1
	mov T4,			512
	mov T5,			140
	call _brick_maker
	mov T3,			OneUpL1
	mov T4,			[OneUpX1]
	mov T5,			[OneUpY1]
	call _item_maker

	;Goomba 2 Boundary Values
	mov T2,			[BGX2]
	mov T3,			GoomL2
	mov T4,			[GoomX2]
	mov T5,			[GoomY2]
	call _goomba_maker

	;Goomba 3 Boundary Values
	mov T2,			[BGX2]
	mov T3,			GoomL3
	mov T4,			[GoomX3]
	mov T5,			[GoomY3]
	call _goomba_maker

	;Goomba 4 Boundary Values
	mov T2,			[BGX2]
	mov T3,			GoomL4
	mov T4,			[GoomX4]
	mov T5,			[GoomY4]
	call _goomba_maker

	;Goomba 5 Boundary Values
	mov T2,			[BGX2]
	mov T3,			GoomL5
	mov T4,			[GoomX5]
	mov T5,			[GoomY5]
	call _goomba_maker

	;Goomba 6 Boundary Values
	mov T2,			[BGX2]
	mov T3,			GoomL6
	mov T4,			[GoomX6]
	mov T5,			[GoomY6]
	call _goomba_maker

	;Dummy Goomba Boundary Values
	mov T2,			[BGX2]
	mov T3,			DGoomL
	mov T4,			[DGoomX]
	mov T5,			[DGoomY]
	call _goomba_maker

_bgi3:
	mov T1,			[BGF3]
	ieq T1,			0
	jf T1,			_bgi4

	;Brick 6 Boundary Values
	mov T2,			[BGX3]
	mov T3,			BrickL6
	mov T4,			1280
	mov T5,			0
	call _brick_maker

	;Brick 7 Boundary Values
	mov T2,			[BGX3]
	mov T3,			BrickL7
	mov T4,			1248
	mov T5,			0
	call _brick_maker

	;Brick 8 Boundary Values
	mov T2,			[BGX3]
	mov T3,			BrickL8
	mov T4,			1216
	mov T5,			0
	call _brick_maker

	;Brick 9 Boundary Values
	mov T2,			[BGX3]
	mov T3,			BrickL9
	mov T4,			1184
	mov T5,			0
	call _brick_maker

	;Brick 10 Boundary Values
	mov T2,			[BGX3]
	mov T3,			BrickL10
	mov T4,			1152
	mov T5,			0
	call _brick_maker

	;Brick 11 Boundary Values
	mov T2,			[BGX3]
	mov T3,			BrickL11
	mov T4,			1120
	mov T5,			0
	call _brick_maker

	;Brick 12 Boundary Values
	mov T2,			[BGX3]
	mov T3,			BrickL12
	mov T4,			1088
	mov T5,			0
	call _brick_maker

	;Brick 13 Boundary Values
	mov T2,			[BGX3]
	mov T3,			BrickL13
	mov T4,			1056
	mov T5,			0
	call _brick_maker

	;Brick 14 Boundary Values
	mov T2,			[BGX3]
	mov T3,			BrickL14
	mov T4,			928
	mov T5,			0
	call _brick_maker

	;Brick 15 Boundary Values
	mov T2,			[BGX3]
	mov T3,			BrickL15
	mov T4,			896
	mov T5,			0
	call _brick_maker

	;Brick 16 Boundary Values
	mov T2,			[BGX3]
	mov T3,			BrickL16
	mov T4,			864
	mov T5,			0
	call _brick_maker

	;Brick 17 Boundary Values
	mov T2,			[BGX3]
	mov T3,			BrickL17
	mov T4,			832
	mov T5,			140
	call _brick_maker

	;Brick 18 Boundary Values
	mov T2,			[BGX3]
	mov T3,			BrickL18
	mov T4,			640
	mov T5,			140
	call _brick_maker

	;Brick 19 Boundary Values
	mov T2,			[BGX3]
	mov T3,			BrickL19
	mov T4,			608
	mov T5,			140
	call _brick_maker

	;Brick 20 Boundary Values
	mov T2,			[BGX3]
	mov T3,			BrickL20
	mov T4,			64
	mov T5,			140
	call _brick_maker

	;Hole 2 Boundary values
	mov T1,			[BGX3]
	iadd T1,		640
	isub T1,		1088
	mov [HoleL2],		T1
	iadd T1,		96
	mov [HoleR2],		T1
	mov T1,			[BGY]
	iadd T1,		268

	;Mystery 6 Boundary Values (Coin 4)
	mov T2,			[BGX3]
	mov T3,			MystL6
	mov T4,			832
	mov T5,			0
	call _brick_maker
	mov T3,			CoinL4
	isub T5,		32
	call _item_maker

	;Mystery 7 Boundary Values (Coin 5)
	mov T2,			[BGX3]
	mov T3,			MystL7
	mov T4,			448
	mov T5,			140
	call _brick_maker
	mov T3,			CoinL5
	isub T5,		32
	call _item_maker

	;Mystery 1 Boundary Values (Mushroom 1)
	mov T2,			[BGX3]
	mov T3,			MystL1
	mov T4,			352
	mov T5,			0
	call _brick_maker
	mov T3,			MushL1
	mov T4,			[MushX1]
	mov T5,			[MushY1]
	call _item_maker

	;Mystery 2 Boundary Values (Coin 6)
	mov T2,			[BGX3]
	mov T3,			MystL2
	mov T4,			352
	mov T5,			140
	call _brick_maker
	mov T3,			CoinL6
	isub T5,		32
	call _item_maker

	;Mystery 3 Boundary Values (Coin 1)
	mov T2,			[BGX3]
	mov T3,			MystL3
	mov T4,			256
	mov T5,			140
	call _brick_maker
	mov T3,			CoinL1
	isub T5,		32
	call _item_maker

	;Goomba 7 Boundary Values
	mov T2,			[BGX3]
	mov T3,			GoomL7
	mov T4,			[GoomX7]
	mov T5,			[GoomY7]
	call _goomba_maker

	;Goomba 8 Boundary Values
	mov T2,			[BGX3]
	mov T3,			GoomL8
	mov T4,			[GoomX8]
	mov T5,			[GoomY8]
	call _goomba_maker

	;Goomba 9 Boundary Values
	mov T2,			[BGX3]
	mov T3,			GoomL9
	mov T4,			[GoomX9]
	mov T5,			[GoomY9]
	call _goomba_maker

	;Goomba 10 Boundary Values
	mov T2,			[BGX3]
	mov T3,			GoomL10
	mov T4,			[GoomX10]
	mov T5,			[GoomY10]
	call _goomba_maker

	;Dummy 2 Goomba Boundary Values
;	mov T2,			[BGX3]
;	mov T3,			DGoomL
;	mov T4,			[DGoomX]
;	mov T5,			[DGoomY]
;	call _goomba_maker

_bgi4:
	mov T1,			[BGF4]
	ieq T1,			0
	jf T1,			_bgi5

	;Brick 21 Boundary Values
	mov T2,			[BGX4]
	mov T3,			BrickL21
	mov T4,			1248
	mov T5,			0
	call _brick_maker

	;Brick 22 Boundary Values
	mov T2,			[BGX4]
	mov T3,			BrickL22
	mov T4,			1216
	mov T5,			0
	call _brick_maker

	;Brick 1 Boundary Values
	mov T2,			[BGX4]
	mov T3,			BrickL1
	mov T4,			1184
	mov T5,			0
	call _brick_maker

	;Brick 2 Boundary Values
	mov T2,			[BGX4]
	mov T3,			BrickL2
	mov T4,			1024
	mov T5,			0
	call _brick_maker

	;Brick 3 Boundary Values
	mov T2,			[BGX4]
	mov T3,			BrickL3
	mov T4,			992
	mov T5,			140
	call _brick_maker

	;Brick 4 Boundary Values
	mov T2,			[BGX4]
	mov T3,			BrickL4
	mov T4,			960
	mov T5,			140
	call _brick_maker

	;Brick 5 Boundary Values
	mov T2,			[BGX4]
	mov T3,			BrickL5
	mov T4,			928
	mov T5,			0
	call _brick_maker

	;Hole 3 Boundary values
	mov T1,			[BGX4]
	iadd T1,		640
	isub T1,		222
	mov [HoleL3],		T1
	iadd T1,		64
	mov [HoleR3],		T1
	mov T1,			[BGY]
	iadd T1,		268
	mov [HoleT3],		T1

	;Stair 1 Boundary values
	mov R6,			[BGX4]
	mov R7,			StairL1A
	mov R8,			832
	mov R9,			128
	mov R10,		236
	mov R11,		4
	mov R12,		0
	call _stair_boundaries

	;Stair 2 Boundary values
	mov R6,			[BGX4]
	mov R7,			StairL2A
	mov R8,			640
	mov R9,			128
	mov R10,		236
	mov R11,		4
	mov R12,		1
	call _stair_boundaries

	;Stair 3 Boundary values
	mov R6,			[BGX4]
	mov R7,			StairL3A
	mov R8,			384
	mov R9,			160
	mov R10,		236
	mov R11,		4
	mov R12,		0
	call _stair_boundaries

	;Stair 4 Boundary values
	mov R6,			[BGX4]
	mov R7,			StairL4A
	mov R8,			160
	mov R9,			128
	mov R10,		236
	mov R11,		4
	mov R12,		1
	call _stair_boundaries

	;Mystery 4 Boundary Values (Coin 2)
	mov T2,			[BGX4]
	mov T3,			MystL4
	mov T4,			992
	mov T5,			0
	call _brick_maker
	mov T3,			CoinL2
	isub T5,		32
	call _item_maker

	;Mystery 5 Boundary Values (Coin 3)
	mov T2,			[BGX4]
	mov T3,			MystL5
	mov T4,			960
	mov T5,			0
	call _brick_maker
	mov T3,			CoinL3
	isub T5,		32
	call _item_maker

	;Goomba 11 Boundary Values
	mov T2,			[BGX4]
	mov T3,			GoomL11
	mov T4,			[GoomX11]
	mov T5,			[GoomY11]
	call _goomba_maker

	;Goomba 12 Boundary Values
	mov T2,			[BGX4]
	mov T3,			GoomL12
	mov T4,			[GoomX12]
	mov T5,			[GoomY12]
	call _goomba_maker

	;Goomba 13 Boundary Values
	mov T2,			[BGX4]
	mov T3,			GoomL13
	mov T4,			[GoomX13]
	mov T5,			[GoomY13]
	call _goomba_maker

	;Goomba 14 Boundary Values
	mov T2,			[BGX4]
	mov T3,			GoomL14
	mov T4,			[GoomX14]
	mov T5,			[GoomY14]
	call _goomba_maker

	;Dummy Goomba 3 Boundary Values
	mov T2,			[BGX4]
	mov T3,			dGoomL
	mov T4,			[dGoomX]
	mov T5,			[dGoomY]
	call _goomba_maker

_bgi5:
	mov T1,			[BGF5]
	ieq T1,			0
	jf T1,			_bgi6

	;Pipe 5 Boundary values
	mov T1,			[BGX5]
	iadd T1,		640
	isub T1,		1184
	mov [PipeL5],		T1
	iadd T1,		64
	mov [PipeR5],		T1
	mov T1,			[BGY]
	iadd T1,		204
	mov [PipeT5],		T1

	;Pipe 6 Boundary values
	mov T1,			[BGX5]
	iadd T1,		640
	isub T1,		672
	mov [PipeL6],		T1
	iadd T1,		64
	mov [PipeR6],		T1
	mov T1,			[BGY]
	iadd T1,		204
	mov [PipeT6],		T1

	;Stair 5 Boundary values
	mov R6,			[BGX5]
	mov R7,			StairL5A
	mov R8,			608
	mov R9,			288
	mov R10,		236
	mov R11,		8
	mov R12,		0
	call _stair_boundaries

	;Metal 1 Boundary Values
	mov T1,			[BGX5]
	iadd T1,		640
	isub T1,		64
	mov [MetalL1],		T1
	iadd T1,		32
	mov [MetalR1],		T1
	mov T1,			[BGY]
	iadd T1,		236
	mov [MetalT1],		T1

	;Mystery 6 Boundary Values (Coin 4)
	mov T2,			[BGX5]
	mov T3,			MystL6
	mov T4,			960
	mov T5,			140
	call _brick_maker
	mov T3,			CoinL4
	isub T5,		32
	call _item_maker

	;Goomba 15 Boundary Values
	mov T2,			[BGX5]
	mov T3,			GoomL15
	mov T4,			[GoomX15]
	mov T5,			[GoomY15]
	call _goomba_maker

	;Goomba 16 Boundary Values
	mov T2,			[BGX5]
	mov T3,			GoomL16
	mov T4,			[GoomX16]
	mov T5,			[GoomY16]
	call _goomba_maker

	;Dummy Goomba 4 Boundary Values
	mov T2,			[BGX5]
	mov T3,			dGoomL
	mov T4,			[dGoomX]
	mov T5,			[dGoomY]
	call _goomba_maker

_bgi6:
	mov T1,			[BGF6]
	ieq T1,			0
	jf T1,			_bgi7

	;Ceiling 1 Boundary values
	mov T2,			[BGX6]
	mov T3,			COBJL1
	mov T4,			736
	mov T5,			352
	isgn T5
	mov R8,			736
	mov R10,		256
	call _ceiling_maker

	;Ceiling 2 Boundary values
	mov T2,			[BGX6]
	mov T3,			COBJL2
	mov T4,			736
	mov T5,			96
	isgn T5
	mov R8,			224
	mov R10,		64
	call _ceiling_maker

	;Stair 6 Boundary values
	mov R6,			[BGX6]
	mov R7,			StairL6A
	mov R8,			864
	mov R9,			128
	mov R10,		236
	mov R11,		4
	mov R12,		0
	call _stair_boundaries

	;Ground Object 1 Boundary values
	mov T1,			[BGX6]
	iadd T1,		640
	isub T1,		736
	mov [GOBJL1],		T1
	iadd T1,		224
	mov [GOBJR1],		T1
	mov T1,			[BGY]
	iadd T1,		140
	mov [GOBJT1],		T1

	;Ground Object 2 Boundary values
	mov T1,			[BGX6]
	iadd T1,		640
	isub T1,		128
	mov [GOBJL2],		T1
	iadd T1,		128
	mov [GOBJR2],		T1
	mov T1,			[BGY]
	iadd T1,		140
	mov [GOBJT2],		T1

	;Invis 1 Boundary Values
	mov T2,			[BGX6]
	mov T3,			InvisL1
	mov T4,			448
	mov T5,			108
	call _brick_maker

	;Invis 2 Boundary Values
	mov T2,			[BGX6]
	mov T3,			InvisL2
	mov T4,			416
	mov T5,			20
	isgn T5
	call _brick_maker

	;Invis 3 Boundary Values
	mov T2,			[BGX6]
	mov T3,			InvisL3
	mov T4,			352
	mov T5,			108
	call _brick_maker

	;Invis 4 Boundary Values
	mov T2,			[BGX6]
	mov T3,			InvisL4
	mov T4,			320
	mov T5,			20
	isgn T5
	call _brick_maker

	;Invis 5 Boundary Values
	mov T2,			[BGX6]
	mov T3,			InvisL5
	mov T4,			256
	mov T5,			108
	call _brick_maker

	;Invis 6 Boundary Values
	mov T2,			[BGX6]
	mov T3,			InvisL6
	mov T4,			224
	mov T5,			20
	isgn T5
	call _brick_maker

	;Dummy Goomba 5 Boundary Values
	mov T2,			[BGX6]
	mov T3,			TGoomL
	mov T4,			[TGoomX]
	mov T5,			[TGoomY]
	call _goomba_maker

_bgi7:
	mov T1,			[BGF7]
	ieq T1,			0
	jf T1,			_bgiU

	;Ceiling 3 Boundary values
	mov T2,			[BGX7]
	mov T3,			COBJL3
	mov T4,			1280
	mov T5,			352
	isgn T5
	mov R8,			1280
	mov R10,		288
	call _ceiling_maker

	;Ceiling 4 Boundary values
	mov T2,			[BGX7]
	mov T3,			COBJL5
	mov T4,			0
	mov T5,			64
	isgn T5
	mov R8,			96
	mov R10,		32
	call _ceiling_maker

	;Ceiling 5 Boundary values
	mov T2,			[BGX7]
	mov T3,			COBJL5
	mov T4,			1184
	mov T5,			64
	isgn T5
	mov R8,			160
	mov R10,		64
	call _ceiling_maker

	;Ceiling 6 Boundary values
	mov T2,			[BGX7]
	mov T3,			COBJL6
	mov T4,			576
	mov T5,			64
	isgn T5
	mov R8,			64
	mov R10,		96
	call _ceiling_maker

	;Ground Object 3 Boundary values
	mov T1,			[BGX7]
	iadd T1,		640
	isub T1,		1184
	mov [GOBJL3],		T1
	iadd T1,		160
	mov [GOBJR3],		T1
	mov T1,			[BGY]
	iadd T1,		172
	mov [GOBJT3],		T1

	;Ground Object 4 Boundary values
	mov T1,			[BGX7]
	iadd T1,		640
	isub T1,		608
	mov [GOBJL4],		T1
	iadd T1,		96
	mov [GOBJR4],		T1
	mov T1,			[BGY]
	iadd T1,		140
	mov [GOBJT4],		T1

	;Hole 4 Boundary values
	mov T1,			[BGX7]
	iadd T1,		640
	isub T1,		1024
	mov [HoleL4],		T1
	iadd T1,		416
	mov [HoleR4],		T1
	mov T1,			[BGY]
	iadd T1,		268
	mov [HoleT4],		T1

	;Trap Boundary values
	mov T1,			[TrapF1]
	ieq T1,			1
	jt T1,			_no_trap_check
	mov T1,			[BGX7]
	iadd T1,		640
	isub T1,		1024
	mov [TrapL1],		T1
	iadd T1,		416
	mov [TrapR1],		T1
	mov T1,			[BGY]
	iadd T1,		172
	mov [TrapT1],		T1
_no_trap_check:

	;Koopa 1 Boundary Values
	mov T2,			[BGX7]
	mov T3,			KoopL1
	mov T4,			[KoopX1]
	mov T5,			[KoopY1]
	call _koopa_maker

	;Dummy Goomba 6 Boundary Values
	mov T2,			[BGX7]
	mov T3,			dGoomL
	mov T4,			[dGoomX]
	mov T5,			[dGoomY]
	call _goomba_maker

_bgiU:
	mov T1,			[BGFU]
	ieq T1,			0
	jf T1,			_bgi_end

_bgi_end:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Check Boundaries against Player
;;
_Background_Boundary_Checks_1:
	mov T1,			[BGF1]						;Check if Background 1 is active
	ieq T1,			0
	jf T1,			_bgbc2						;If not then check next background

	;Pipe 1
	mov X,			[PX]
	mov Y,			[PY]
	mov R6,			[PipeL1]
	mov R7,			[PipeR1]
	mov R8,			[PipeT1]
	mov R10,		[PYHB]
	call _pipe_check

	;Pipe 2
	mov X,			[PX]
	mov Y,			[PY]
	mov R6,			[PipeL2]
	mov R7,			[PipeR2]
	mov R8,			[PipeT2]
	mov R10,		[PYHB]
	call _pipe_check

	;Bricks 1-3
	mov T1,			0
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R10,		BrickF1
	mov R11,		BrickL1
	mov R12,		3
	call _brick_boundaries

	;Mystery 1 (Coin 1)
	mov T1,			2
	mov [ItemID],	T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,			CoinF1
	mov R10,		MystF1
	mov R11,		MystL1
	mov R12,		1
	call _brick_boundaries

	;Mystery 2 (Mushroom 1)
	mov T1,			1
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,			MushF1
	mov R10,		MystF2
	mov R11,		MystL2
	mov R12,		1
	call _brick_boundaries

	;Mystery 3 (Coin 2)
	mov T1,			2
	mov [ItemID],	T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,			CoinF2
	mov R10,		MystF3
	mov R11,		MystL3
	mov R12,		1
	call _brick_boundaries

	;Mystery 4 (Coin 3)
	mov T1,			2
	mov [ItemID],	T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,			CoinF3
	mov R10,		MystF4
	mov R11,		MystL4
	mov R12,		1
	call _brick_boundaries

	;Mushroom 1
	mov T1,			1
	mov [ItemID],	T1
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			MushF1
	mov R6,			MushL1
	call _item_check

	;Coin 1
	mov T1,			2
	mov [ItemID],	T1
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			CoinF1
	mov R6,			CoinL1
	call _item_check

	;Coin 2
	mov T1,			2
	mov [ItemID],	T1
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			CoinF2
	mov R6,			CoinL2
	call _item_check

	;Coin 3
	mov T1,			2
	mov [ItemID],	T1
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			CoinF3
	mov R6,			CoinL3
	call _item_check

	;Goomba 1
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			GoomF1
	mov R6,			GoomL1
	mov R12,		GoomRID
	call _goomba_check_maker

_bgbc2:
	mov T1,			[BGF2]
	ieq T1,			0
	jf T1,			_bgbc3

	;Pipe 3
	mov X,			[PX]
	mov Y,			[PY]
	mov R6,			[PipeL3]
	mov R7,			[PipeR3]
	mov R8,			[PipeT3]
	mov R10,		[PYHB]
	call _pipe_check

	;Pipe 4
	mov X,			[PX]
	mov Y,			[PY]
	mov R6,			[PipeL4]
	mov R7,			[PipeR4]
	mov R8,			[PipeT4]
	mov R10,		[PYHB]
	call _pipe_check

	;Bricks 4-5
	mov T1,			0
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R10,		BrickF4
	mov R11,		BrickL4
	mov R12,		2
	call _brick_boundaries

	;Hole 1
	mov X,			[PX]
	mov Y,			[PY]
	mov R6,			[HoleL1]
	mov R7,			[HoleR1]
	mov R8,			[HoleT1]
	mov R10,		[PYHB]
	mov R12,		[HoleL1]
	mov R13,		[HoleR1]
	call _hole_check

	;Mystery 5 (Mushroom 2)
	mov T1,			1
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,			MushF2
	mov R10,		MystF5
	mov R11,		MystL5
	mov R12,		1
	call _brick_boundaries

	;Invis 1 (OneUp 1)
	mov T1,			3
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,			VisF1
	mov R10,		InvisF1
	mov R11,		InvisL1
	mov R12,		1
	call _brick_boundaries

	;Mushroom 2
	mov T1,			1
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			MushF2
	mov R6,			MushL2
	call _item_check

	;OneUp 1
	mov T1,			2
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			OneUpF1
	mov R6,			OneUpL1
	call _item_check

	;Goomba 2
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			GoomF2
	mov R6,			GoomL2
	mov R12,		GoomRID
	call _goomba_check_maker
	mov R8,			2
	mov R9,			GoomS2
	mov R10,		[PipeR2]
	mov R11,		[PipeL3]
	call _goomba_object_check

	;Goomba 3
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			GoomF3
	mov R6,			GoomL3
	mov R12,		GoomRID
	call _goomba_check_maker
	mov R8,			2
	mov R9,			GoomS3
	mov R10,		[PipeR3]
	mov R11,		[PipeL4]
	call _goomba_object_check

	;Goomba 4
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			GoomF4
	mov R6,			GoomL4
	mov R12,		GoomRID
	call _goomba_check_maker
	mov R8,			2
	mov R9,			GoomS4
	mov R10,		[PipeR3]
	mov R11,		[PipeL4]
	call _goomba_object_check

	;Goomba 5
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			GoomF5
	mov R6,			GoomL5
	mov R12,		GoomRID
	call _goomba_check_maker
	mov R8,			3
	mov R9,			GoomG5
	mov R10,		[HoleR1]
	mov R11,		[HoleL1]
	call _goomba_object_check

	;Goomba 6
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			GoomF6
	mov R6,			GoomL6
	mov R12,		GoomRID
	call _goomba_check_maker
	mov R8,			3
	mov R9,			GoomG6
	mov R10,		[HoleR1]
	mov R11,		[HoleL1]
	call _goomba_object_check

_bgbc3:
	mov T1,			[BGF3]
	ieq T1,			0
	jf T1,			_bgbc4

	;Bricks 6-20
	mov T1,			0
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R10,		BrickF6
	mov R11,		BrickL6
	mov R12,		15
	call _brick_boundaries

	;Hole 2
	mov X,			[PX]
	mov Y,			[PY]
	mov R6,			[HoleL2]
	mov R7,			[HoleR2]
	mov R8,			[HoleT2]
	mov R10,		[PYHB]
	mov R12,		[HoleL1]
	mov R13,		[HoleR1]
	call _hole_check

	;Mystery 6 (Coin 4)
	mov T1,			2
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,			CoinF4
	mov R10,		MystF6
	mov R11,		MystL6
	mov R12,		1
	call _brick_boundaries

	;Mystery 7 (Coin 5)
	mov T1,			2
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,			CoinF5
	mov R10,		MystF7
	mov R11,		MystL7
	mov R12,		1
	call _brick_boundaries

	;Mystery 1 (Mushroom 1)
	mov T1,			1
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,			MushF1
	mov R10,		MystF1
	mov R11,		MystL1
	mov R12,		1
	call _brick_boundaries

	;Mystery 2 (Coin 6)
	mov T1,			2
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,			CoinF6
	mov R10,		MystF2
	mov R11,		MystL2
	mov R12,		1
	call _brick_boundaries

	;Mystery 3 (Coin 1)
	mov T1,			2
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,                 CoinF1
	mov R10,		MystF3
	mov R11,		MystL3
	mov R12,		1
	call _brick_boundaries

	;Mushroom 3
	mov T1,			1
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			MushF1;3
	mov R6,			MushL1;3
	call _item_check

	;Coin 4
	mov T1,			2
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			CoinF4
	mov R6,			CoinL4
	call _item_check

	;Coin 5
	mov T1,			2
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			CoinF5
	mov R6,			CoinL5
	call _item_check

	;Coin 6
	mov T1,			2
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			CoinF6
	mov R6,			CoinL6
	call _item_check

	;Coin 1
	mov T1,			2
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			CoinF1
	mov R6,			CoinL1
	call _item_check

	;Goomba 7
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			GoomF7
	mov R6,			GoomL7
	mov R12,		GoomRID
	call _goomba_check_maker
	mov R8,			3
	mov R9,			GoomG7
	mov R10,		[HoleR2]
	mov R11,		[HoleL2]
	call _goomba_object_check

	;Goomba 8
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			GoomF8
	mov R6,			GoomL8
	mov R12,		GoomRID
	call _goomba_check_maker
	mov R8,			3
	mov R9,			GoomG8
	mov R10,		[HoleR2]
	mov R11,		[HoleL2]
	call _goomba_object_check

	;Goomba 9
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			GoomF9
	mov R6,			GoomL9
	mov R12,		GoomRID
	call _goomba_check_maker

	;Goomba 10
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			GoomF10
	mov R6,			GoomL10
	mov R12,		GoomRID
	call _goomba_check_maker

_bgbc4:
	mov T1,			[BGF4]
	ieq T1,			0
	jf T1,			_bgbc5

	;Bricks 21-22
	mov T1,			0
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R10,		BrickF21
	mov R11,		BrickL21
	mov R12,		2
	call _brick_boundaries

	;Bricks 1-5
	mov T1,			0
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R10,		BrickF1
	mov R11,		BrickL1
	mov R12,		5
	call _brick_boundaries

	;Hole 3
	mov X,			[PX]
	mov Y,			[PY]
	mov R6,			[HoleL3]
	mov R7,			[HoleR3]
	mov R8,			[HoleT3]
	mov R10,		[PYHB]
	mov R12,		[HoleL1]
	mov R13,		[HoleR1]
	call _hole_check

	;Stair 1
	mov X,			[PX]
	mov Y,			[PY]
	mov R11,		StairL1A
	mov R9,			4
	mov R10,		[PYHB]
	call _stair_check

	;Stair 2
	mov X,			[PX]
	mov Y,			[PY]
	mov R11,		StairL2A
	mov R9,			4
	mov R10,		[PYHB]
	call _stair_check

	;Stair 3
	mov X,			[PX]
	mov Y,			[PY]
	mov R11,		StairL3A
	mov R9,			4
	mov R10,		[PYHB]
	call _stair_check

	;Stair 4
	mov X,			[PX]
	mov Y,			[PY]
	mov R11,		StairL4A
	mov R9,			4
	mov R10,		[PYHB]
	call _stair_check

	;Mystery 4 (Coin 2)
	mov T1,			2
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,                 CoinF2
	mov R10,		MystF4
	mov R11,		MystL4
	mov R12,		1
	call _brick_boundaries

	;Mystery 5 (Coin 3)
	mov T1,			2
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,                 CoinF3
	mov R10,		MystF5
	mov R11,		MystL5
	mov R12,		1
	call _brick_boundaries
	
	;Coin 2
	mov T1,			2
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			CoinF2
	mov R6,			CoinL2
	call _item_check

	;Coin 3
	mov T1,			2
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			CoinF3
	mov R6,			CoinL3
	call _item_check

	;Goomba 11
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			GoomF11
	mov R6,			GoomL11
	mov R12,		GoomRID
	call _goomba_check_maker

	;Goomba 12
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			GoomF12
	mov R6,			GoomL12
	mov R12,		GoomRID
	call _goomba_check_maker

	;Goomba 13
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			GoomF13
	mov R6,			GoomL13
	mov R12,		GoomRID
	call _goomba_check_maker

	;Goomba 14
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			GoomF14
	mov R6,			GoomL14
	mov R12,		GoomRID
	call _goomba_check_maker

_bgbc5:
	mov T1,			[BGF5]
	ieq T1,			0
	jf T1,			_bgbc6

	;Pipe 5
	mov X,			[PX]
	mov Y,			[PY]
	mov R6,			[PipeL5]
	mov R7,			[PipeR5]
	mov R8,			[PipeT5]
	mov R10,		[PYHB]
	call _pipe_check

	;Pipe 6
	mov X,			[PX]
	mov Y,			[PY]
	mov R6,			[PipeL6]
	mov R7,			[PipeR6]
	mov R8,			[PipeT6]
	mov R10,		[PYHB]
	call _pipe_check

	;Stair 5
	mov X,			[PX]
	mov Y,			[PY]
	mov R11,		StairL5A
	mov R9,			8
	mov R10,		[PYHB]
	call _stair_check

	;Metal 1
	mov X,			[PX]
	mov Y,			[PY]
	mov R6,			[MetalL1]
	mov R7,			[MetalR1]
	mov R8,			[MetalT1]
	mov R10,		[PYHB]
	call _pipe_check

	;Mystery 6 (Coin 4)
	mov T1,			2
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,                 CoinF6
	mov R10,		MystF6
	mov R11,		MystL6
	mov R12,		1
	call _brick_boundaries

	;Coin 4
	mov T1,			2
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			CoinF4
	mov R6,			CoinL4
	call _item_check

	;Goomba 15
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			GoomF15
	mov R6,			GoomL15
	mov R12,		GoomRID
	call _goomba_check_maker
	mov R8,			2
	mov R9,			GoomS15
	mov R10,		[PipeR5]
	mov R11,		[PipeL6]
	call _goomba_object_check

	;Goomba 16
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			GoomF16
	mov R6,			GoomL16
	mov R12,		GoomRID
	call _goomba_check_maker
	mov R8,			2
	mov R9,			GoomS16
	mov R10,		[PipeR5]
	mov R11,		[PipeL6]
	call _goomba_object_check

_bgbc6:
	mov T1,			[BGF6]
	ieq T1,			0
	jf T1,			_bgbc7

	;Ceiling 1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R11,		COBJL1
	call _ceiling_boundaries

	;Ceiling 2
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R11,		COBJL2
	call _ceiling_boundaries

	;Stair 6
	mov X,			[PX]
	mov Y,			[PY]
	mov R11,		StairL6A
	mov R9,			4
	mov R10,		[PYHB]
	call _stair_check

	;Ground Object 1
	mov X,			[PX]
	mov Y,			[PY]
	mov R6,			[GOBJL1]
	mov R7,			[GOBJR1]
	mov R8,			[GOBJT1]
	mov R10,		[PYHB]
	call _pipe_check

	;Ground Object 2
	mov X,			[PX]
	mov Y,			[PY]
	mov R6,			[GOBJL2]
	mov R7,			[GOBJR2]
	mov R8,			[GOBJT2]
	mov R10,		[PYHB]
	call _pipe_check

	;Invis 1
	mov T1,			0
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,			VisF1
	mov R10,		InvisF1
	mov R11,		InvisL1
	mov R12,		1
	call _brick_boundaries

	;Invis 2
	mov T1,			0
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,			VisF2
	mov R10,		InvisF2
	mov R11,		InvisL2
	mov R12,		1
	call _brick_boundaries

	;Invis 3
	mov T1,			0
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,			VisF3
	mov R10,		InvisF3
	mov R11,		InvisL3
	mov R12,		1
	call _brick_boundaries

	;Invis 4 
	mov T1,			0
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,			VisF4
	mov R10,		InvisF4
	mov R11,		InvisL4
	mov R12,		1
	call _brick_boundaries

	;Invis 5
	mov T1,			0
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,			VisF5
	mov R10,		InvisF5
	mov R11,		InvisL5
	mov R12,		1
	call _brick_boundaries

	;Invis 6
	mov T1,			0
	mov [ItemID],		T1
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R5,			VisF6
	mov R10,		InvisF6
	mov R11,		InvisL6
	mov R12,		1
	call _brick_boundaries
_bgbc7:
	mov T1,			[BGF7]
	ieq T1,			0
	jf T1,			_bgbcU

	;Ceiling 3
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R11,		COBJL3
	call _ceiling_boundaries

	;Ceiling 4
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R11,		COBJL4
	call _ceiling_boundaries

	;Ceiling 5
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R11,		COBJL5
	call _ceiling_boundaries

	;Ceiling 6
	mov X,			[PX]
	mov Y,			[PY]
	mov T2,			[PYHB]
	mov R11,		COBJL6
	call _ceiling_boundaries

	;Ground Object 3
	mov X,			[PX]
	mov Y,			[PY]
	mov R6,			[GOBJL3]
	mov R7,			[GOBJR3]
	mov R8,			[GOBJT3]
	mov R10,		[PYHB]
	call _pipe_check

	;Ground Object 4
	mov X,			[PX]
	mov Y,			[PY]
	mov R6,			[GOBJL4]
	mov R7,			[GOBJR4]
	mov R8,			[GOBJT4]
	mov R10,		[PYHB]
	call _pipe_check

	;Hole 4
	mov X,			[PX]
	mov Y,			[PY]
	mov R6,			[HoleL4]
	mov R7,			[HoleR4]
	mov R8,			[HoleT4]
	mov R10,		[PYHB]
	mov R12,		[HoleL1]
	mov R13,		[HoleR1]
	call _hole_check

	;Trap 1
	mov T1,			[TrapF1]
	ieq T1,			1
	jt T1,			_tbc1_end
	mov X,			[PX]
	mov Y,			[PY]
	mov R6,			[TrapL1]
	mov R7,			[TrapR1]
	mov R8,			[TrapT1]
	mov R10,		[PYHB]
	call _pipe_check
_tbc1_end:

	;Koopa 1
	mov X,			[PX]
	mov Y,			[PY]
	mov R4,			KoopF1
	mov R6,			KoopL1
	mov R12,		KoopRID
	call _goomba_check_maker
	mov R8,			2
	mov R9,			KoopS1
	mov R10,		[GOBJR3]
	mov R11,		[GOBJL4]
	call _goomba_object_check

_bgbcU:
	mov T1,			[BGFU]
	ieq T1,			0
	jf T1,			_bgbc_end

_bgbc_end:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Drawing
;;
_Background_Draws_1:
	mov T1,			[BGF1]						;Check if Background 1 is active
	ieq T1,			0
	jf T1,			_bgdc2						;If not then check next background

	;Brick Draw 1-3
	mov T3,			3
	mov T4,			BrickL1
	mov T5,			BrickT1	
	mov R8,			100
	call _draw_brick

	;Mystery Draw 1
	mov T3,			1
	mov T4,			MystL1
	mov T5,			MystT1	
	mov R8,			[MystTex1]
	call _draw_brick

	;Mystery Draw 2
	mov T3,			1
	mov T4,			MystL2
	mov T5,			MystT2	
	mov R8,			[MystTex2]
	call _draw_brick

	;Mystery Draw 3
	mov T3,			1
	mov T4,			MystL3
	mov T5,			MystT3	
	mov R8,			[MystTex3]
	call _draw_brick

	;Mystery Draw 4
	mov T3,			1
	mov T4,			MystL4
	mov T5,			MystT4	
	mov R8,			[MystTex4]
	call _draw_brick

	;Mushroom 1 Draw
	mov R6,			[MushF1]
	mov R7,			[MushL1]
	mov R8,			[MushT1]
	mov R9,			108
	call _draw_item

	;Coin Draw 1
	mov R6,			[CoinF1]
	mov R7,			[CoinL1]
	mov R8,			[CoinT1]
	call _coin_animation
	mov R9,			[CoinID]
	call _draw_item

	;Coin Draw 2
	mov R6,			[CoinF2]
	mov R7,			[CoinL2]
	mov R8,			[CoinT2]
	call _coin_animation
	mov R9,			[CoinID]
	call _draw_item

	;Coin Draw 3
	mov R6,			[CoinF3]
	mov R7,			[CoinL3]
	mov R8,			[CoinT3]
	call _coin_animation
	mov R9,			[CoinID]
	call _draw_item

	;Goomba 1 Draw
	mov R6,			GoomF1
	mov R7,			[GoomL1]
	mov R8,			[GoomT1]
	call _goomba_animation
	mov R12,		GoomRID
	call _draw_goomba

_bgdc2:
	mov T1,			[BGF2]
	ieq T1,			0
	jf T1,			_bgdc3

	;Brick Draw 4-5
	mov T3,			2
	mov T4,			BrickL4
	mov T5,			BrickT4	
	mov R8,			100
	call _draw_brick

	;Mystery Draw 5
	mov T3,			1
	mov T4,			MystL5
	mov T5,			MystT5	
	mov R8,			[MystTex5]
	call _draw_brick

	;Invisible Draw 1
	mov T1,			[VisF1]
	ieq T1,			1
	jt T1,			_vc1_end
	mov T3,			1
	mov T4,			InvisL1
	mov T5,			InvisT1	
	mov R8,			102
	call _draw_brick
_vc1_end:

	;Mushroom 2
	mov R6,			[MushF2]
	mov R7,			[MushL2]
	mov R8,			[MushT2]
	mov R9,			108
	call _draw_item

	;OneUp 1 Draw
	mov R6,			[OneUpF1]
	mov R7,			[OneUpL1]
	mov R8,			[OneUpT1]
	mov R9,			107
	call _draw_item

	;Goomba 2 Draw
	mov R6,			GoomF2
	mov R7,			[GoomL2]
	mov R8,			[GoomT2]
	call _goomba_animation
	mov R12,		GoomRID
	call _draw_goomba

	;Goomba 3 Draw
	mov R6,			GoomF3
	mov R7,			[GoomL3]
	mov R8,			[GoomT3]
	call _goomba_animation
	mov R12,		GoomRID
	call _draw_goomba

	;Goomba 4 Draw
	mov R6,			GoomF4
	mov R7,			[GoomL4]
	mov R8,			[GoomT4]
	call _goomba_animation
	mov R12,		GoomRID
	call _draw_goomba

	;Goomba 5 Draw
	mov R6,			GoomF5
	mov R7,			[GoomL5]
	mov R8,			[GoomT5]
	call _goomba_animation
	mov R12,		GoomRID
	call _draw_goomba

	;Goomba 6 Draw
	mov R6,			GoomF6
	mov R7,			[GoomL6]
	mov R8,			[GoomT6]
	call _goomba_animation
	mov R12,		GoomRID
	call _draw_goomba

_bgdc3:
	mov T1,			[BGF3]
	ieq T1,			0
	jf T1,			_bgdc4

	;Brick Draw 6-20
	mov T3,			15
	mov T4,			BrickL6
	mov T5,			BrickT6	
	mov R8,			100
	call _draw_brick

	;Mystery Draw 6
	mov T3,			1
	mov T4,			MystL6
	mov T5,			MystT6	
	mov R8,			[MystTex6]
	call _draw_brick

	;Mystery Draw 7
	mov T3,			1
	mov T4,			MystL7
	mov T5,			MystT7	
	mov R8,			[MystTex7]
	call _draw_brick

	;Mystery Draw 1
	mov T3,			1
	mov T4,			MystL1
	mov T5,			MystT1	
	mov R8,			[MystTex1]
	call _draw_brick

	;Mystery Draw 2
	mov T3,			1
	mov T4,			MystL2
	mov T5,			MystT2	
	mov R8,			[MystTex2]
	call _draw_brick

	;Mystery Draw 3
	mov T3,			1
	mov T4,			MystL3
	mov T5,			MystT3	
	mov R8,			[MystTex3]
	call _draw_brick

	;Mushroom 1 Draw
	mov R6,			[MushF1]
	mov R7,			[MushL1]
	mov R8,			[MushT1]
	mov R9,			108
	call _draw_item

	;Coin Draw 4
	mov R6,			[CoinF4]
	mov R7,			[CoinL4]
	mov R8,			[CoinT4]
	call _coin_animation
	mov R9,			[CoinID]
	call _draw_item

	;Coin Draw 5
	mov R6,			[CoinF5]
	mov R7,			[CoinL5]
	mov R8,			[CoinT5]
	call _coin_animation
	mov R9,			[CoinID]
	call _draw_item

	;Coin Draw 6
	mov R6,			[CoinF6]
	mov R7,			[CoinL6]
	mov R8,			[CoinT6]
	call _coin_animation
	mov R9,			[CoinID]
	call _draw_item

	;Coin Draw 1
	mov R6,			[CoinF1]
	mov R7,			[CoinL1]
	mov R8,			[CoinT1]
	call _coin_animation
	mov R9,			[CoinID]
	call _draw_item

	;Goomba 7 Draw
	mov R6,			GoomF7
	mov R7,			[GoomL7]
	mov R8,			[GoomT7]
	call _goomba_animation
	mov R12,		GoomRID
	call _draw_goomba

	;Goomba 8 Draw
	mov R6,			GoomF8
	mov R7,			[GoomL8]
	mov R8,			[GoomT8]
	call _goomba_animation
	mov R12,		GoomRID
	call _draw_goomba

	;Goomba 9 Draw
	mov R6,			GoomF9
	mov R7,			[GoomL9]
	mov R8,			[GoomT9]
	call _goomba_animation
	mov R12,		GoomRID
	call _draw_goomba

	;Goomba 10 Draw
	mov R6,			GoomF10
	mov R7,			[GoomL10]
	mov R8,			[GoomT10]
	call _goomba_animation
	mov R12,		GoomRID
	call _draw_goomba

_bgdc4:
	mov T1,			[BGF4]
	ieq T1,			0
	jf T1,			_bgdc5

	;Brick Draw 21-22
	mov T3,			2
	mov T4,			BrickL21
	mov T5,			BrickT21
	mov R8,			100
	call _draw_brick

	;Brick Draw 1-5
	mov T3,			5
	mov T4,			BrickL1
	mov T5,			BrickT1
	mov R8,			100
	call _draw_brick

	;Mystery Draw 4
	mov T3,			1
	mov T4,			MystL4
	mov T5,			MystT4	
	mov R8,			[MystTex4]
	call _draw_brick

	;Mystery Draw 5
	mov T3,			1
	mov T4,			MystL5
	mov T5,			MystT5	
	mov R8,			[MystTex5]
	call _draw_brick

	;Coin Draw 2
	mov R6,			[CoinF2]
	mov R7,			[CoinL2]
	mov R8,			[CoinT2]
	call _coin_animation
	mov R9,			[CoinID]
	call _draw_item

	;Coin Draw 3
	mov R6,			[CoinF3]
	mov R7,			[CoinL3]
	mov R8,			[CoinT3]
	call _coin_animation
	mov R9,			[CoinID]
	call _draw_item

	;Goomba 11 Draw
	mov R6,			GoomF11
	mov R7,			[GoomL11]
	mov R8,			[GoomT11]
	call _goomba_animation
	mov R12,		GoomRID
	call _draw_goomba

	;Goomba 12 Draw
	mov R6,			GoomF12
	mov R7,			[GoomL12]
	mov R8,			[GoomT12]
	call _goomba_animation
	mov R12,		GoomRID
	call _draw_goomba

	;Goomba 13 Draw
	mov R6,			GoomF13
	mov R7,			[GoomL13]
	mov R8,			[GoomT13]
	call _goomba_animation
	mov R12,		GoomRID
	call _draw_goomba

	;Goomba 14 Draw
	mov R6,			GoomF14
	mov R7,			[GoomL14]
	mov R8,			[GoomT14]
	call _goomba_animation
	mov R12,		GoomRID
	call _draw_goomba

_bgdc5:
	mov T1,			[BGF5]
	ieq T1,			0
	jf T1,			_bgdc6

	;Mystery Draw 6
	mov T3,			1
	mov T4,			MystL6
	mov T5,			MystT6	
	mov R8,			[MystTex6]
	call _draw_brick

	;Coin Draw 4
	mov R6,			[CoinF4]
	mov R7,			[CoinL4]
	mov R8,			[CoinT4]
	call _coin_animation
	mov R9,			[CoinID]
	call _draw_item

	;Goomba 15 Draw
	mov R6,			GoomF15
	mov R7,			[GoomL15]
	mov R8,			[GoomT15]
	call _goomba_animation
	mov R12,		GoomRID
	call _draw_goomba

	;Goomba 16 Draw
	mov R6,			GoomF16
	mov R7,			[GoomL16]
	mov R8,			[GoomT16]
	call _goomba_animation
	mov R12,		GoomRID
	call _draw_goomba

_bgdc6:
	mov T1,			[BGF6]
	ieq T1,			0
	jf T1,			_bgdc7

	;Invisible Draw 1
	mov T1,			[VisF1]
	ieq T1,			1
	jt T1,			_vc1_again_end
	mov T3,			1
	mov T4,			InvisL1
	mov T5,			InvisT1	
	mov R8,			102
	call _draw_brick
_vc1_again_end:

	;Invisible Draw 2
	mov T1,			[VisF2]
	ieq T1,			1
	jt T1,			_vc2_end
	mov T3,			1
	mov T4,			InvisL2
	mov T5,			InvisT2	
	mov R8,			102
	call _draw_brick
_vc2_end:

	;Invisible Draw 3
	mov T1,			[VisF3]
	ieq T1,			1
	jt T1,			_vc3_end
	mov T3,			1
	mov T4,			InvisL3
	mov T5,			InvisT3	
	mov R8,			102
	call _draw_brick
_vc3_end:

	;Invisible Draw 4
	mov T1,			[VisF4]
	ieq T1,			1
	jt T1,			_vc4_end
	mov T3,			1
	mov T4,			InvisL4
	mov T5,			InvisT4	
	mov R8,			102
	call _draw_brick
_vc4_end:

	;Invisible Draw 5
	mov T1,			[VisF5]
	ieq T1,			1
	jt T1,			_vc5_end
	mov T3,			1
	mov T4,			InvisL5
	mov T5,			InvisT5	
	mov R8,			102
	call _draw_brick
_vc5_end:

	;Invisible Draw 6
	mov T1,			[VisF6]
	ieq T1,			1
	jt T1,			_vc6_end
	mov T3,			1
	mov T4,			InvisL6
	mov T5,			InvisT6	
	mov R8,			102
	call _draw_brick
_vc6_end:

_bgdc7:
	mov T1,			[BGF7]
	ieq T1,			0
	jf T1,			_bgdcU

	;Trap Draw
	call _trap_draw

	;; Keep the final boss from redrawing
	mov T1,			[Gtest]
	ieq T1,			555
	jf T1,			_G_test

	mov T1,			369
	mov [KoopRID],	T1



_G_test:
	;Koopa 1 Draw
	mov R6,			KoopF1
	mov R7,			[KoopL1]
	mov R8,			[KoopT1]
	call _koopa_animation
	mov R12,		KoopRID
	call _draw_goomba

_bgdcU:
	mov T1,			[BGFU]
	ieq T1,			0
	jf T1,			_bgdc_end

_bgdc_end:
	ret
