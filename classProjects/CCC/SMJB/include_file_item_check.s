;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Item Check Functions and Item Checks agaisnt level objects
;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Item Brick Check
;;
_item_brick_check:
	push R0
	push R1
	push R2
	push R3
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13

;	mov R2,			1
;	mov Y,			MushY1
;	mov R4,			[MushF1]
;	mov R6,			[BrickL1]
;	mov R7,			[BrickR1]
;	mov R8,			[BrickT1]
;	mov R9,			[BrickB1]
;	mov R10,		MushL1
;	mov R11,		MushR1
;	mov R12,		MushT1
;	mov R13,		MushB1
_item_brick_state:
	mov T1,			[R4]
	ieq T1,			0
	jf T1,			_item_brick_check_end
	mov T1,			R2
	ieq T1,			1
	jt T1,			_mushroom_1
	mov T1,			R2
	ieq T1,			2
	jt T1,			_oneup_1
	jmp _item_brick_check_end
_mushroom_1:								;Is ItemR# on level 1 of bricks?
	mov T1,			[R10]
	ile T1,			R7
	mov T2,			[R13]
	mov T3,			R8
	ile T2,			T3
	and T1,			T2
	jf T1,			_mushroom_1_ground_level
	mov T1,			R8
	isub T1,		76
	mov [Y],		T1
	jmp _item_brick_check_end
_mushroom_1_ground_level:
	mov T1,			[R11]					;Is ItemR# ige with PipeL1?
	mov T2,			R6
	ige T1,			T2
	jf T1,			_item_brick_check_end
	mov T1,			0
	isub T1,		2
	mov [Ispeed],		T1
	jmp _item_brick_check_end
_oneup_1:
	mov T1,			[R10]
	ile T1,			R7
	mov T2,			[R13]
	mov T3,			R8
	ile T2,			T3
	and T1,			T2
	jf T1,			_oneup_1_ground_level
	mov T1,			R8
	isub T1,		76
	mov [Y],		T1
	jmp _item_brick_check_end
_oneup_1_ground_level:
	mov T1,			[R10]					;Is ItemL# ige with HoleL1?
	mov T2,			R6
	ige T1,			T2
	jf T1,			_item_brick_check_end
	mov T1,			600
	mov [GroundI],		T1
	jmp _item_brick_check_end
_item_brick_check_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret











_Item_C_main:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Check Boundaries against Item
;;
_Item_Background_Boundary_Checks_1:
	mov T1,			[BGF1]						;Check if Background 1 is active
	ieq T1,			0
	jf T1,			_Item_bgbc2					;If not then check next background

	;Mushroom 1, BG1 Check
	mov Y,			MushY1
	mov R2,			1
	mov R4,			MushF1
	mov R6,			[PipeL1]
	mov R7,			[BrickR3]
	mov R8,			[BrickT3]
	mov R10,		MushL1
	mov R11,		MushR1
	mov R12,		MushT1
	mov R13,		MushB1
	call _item_brick_check

_Item_bgbc2:
	mov T1,			[BGF2]
	ieq T1,			0
	jf T1,			_Item_bgbc_end

	;OneUp 1, BG2 Check
	mov Y,			OneUpY1
	mov R2,			2
	mov R4,			OneUpF1
	mov R6,			[HoleL1]
	mov R7,			[InvisR1]
	mov R8,			[InvisT1]
	mov R10,		OneUpL1
	mov R11,		OneUpR1
	mov R12,		OneUpT1
	mov R13,		OneUpB1
	call _item_brick_check

_Item_bgbc_end:
	ret
