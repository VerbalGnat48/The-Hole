;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Definitions
;;
%define VALUE		R1
%define X			R2
%define Y			R3
%define MASK		R4
%define SHIFT		R5
%define BYTE		R6
%define MEM			R7
%define MEMEND		R8
%define Command		GPU_Command
%define DrawRegion	GPUCommand_DrawRegion
%define DrawX		GPU_DrawingPointX
%define DrawY		GPU_DrawingPointY
%define Region		GPU_SelectedRegion
%define Texture		GPU_SelectedTexture

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; How to Debug
;;
;;DEBUG PART (24-36)
;--------------------------------------------------------------------
;   mov R0, R13                         ;Content of Register
;   push R0
;   mov R0, 20                          ;X
;   push R0
;   mov R0, 20                          ;Y
;   push R0
;   call __debug
;   pop R0
;   pop R0
;	pop R0
;--------------------------------------------------------------------

;;DEBUG MEM PART (38-46)
;--------------------------------------------------------------------
;   mov R0, Bonged                      ;Start Literal Mem Address
;   push R0
;   iadd R0, 3                          ;End Literal Mem Address
;   push R0
;   call __debugmemory
;   pop R0
;--------------------------------------------------------------------

;;DEBUG REG PART (48-51)
;--------------------------------------------------------------------
;	call __debugreg
;--------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Main Functions
;;

__debugreg:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Save Values
;;
	push BP
	mov BP, SP
	push R0
	in R0, Texture										;Save Texture
	push R0
	in R0, Region										;Save Region
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Main of Debug Registers
;;
	call __initial_dreg
	mov R10, 0
	mov R11, [BP-1]										;R0
	call __main_dreg
	mov R11, [BP-4]										;R1,	We push the Texture and Region hence R1 is -4 and not -2
	call __main_dreg
	mov R11, [BP-5]										;R2
	call __main_dreg
	mov R11, [BP-6]										;R3
	call __main_dreg
	mov R11, [BP-7]										;R4
	call __main_dreg
	mov R11, [BP-8]										;R5
	call __main_dreg
	mov R11, [BP-9]										;R6
	call __main_dreg
	mov R11, [BP-10]									;R7
	call __main_dreg
	mov R11, [BP-11]									;R8
	call __main_dreg
	mov R11, [BP-12]									;R9
	call __main_dreg
	mov R10, 16											;Make itoa2 print 10
	mov R11, [BP-13]									;R10
	call __main_dreg
	mov R11, [BP-14]									;R11
	call __main_dreg
	mov R11, [BP-15]									;R12
	call __main_dreg
	mov R11, [BP-16]									;R13
	call __main_dreg
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Load Saved Values
;;
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
	out Region, R0										;Load Saved Region ID
	pop R0
	out Texture, R0										;Load Saved Texture ID
	pop R0
	mov SP, BP
	pop BP
	ret




__debugmemory:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Save Values
;;
	push BP
	mov BP, SP
	push R0
	in R0, Texture										;Save Texture
	push R0
	in R0, Region										;Save Region
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Main of Debug Mem
;;
	call __initial_dm
__main_dm:
	mov R10, MEM
	igt R10, MEMEND										;If Current Memory Address is greater than the End Memory Address then stop
	jt R10, __end_dm_end
	call __bracket_start
	push MEM
	push X
	push Y
	call __debug
	pop Y
	pop X
	pop MEM
	call __bracket_end
	call __colon
	call __space
	mov R9,	[MEM]
	push R9
	push X
	push Y
	call __debug
	pop	Y
	pop	X
	pop	R9
	mov X,	0
	iadd Y,	22
	iadd MEM, 1
	jmp __main_dm
__end_dm_end:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Load Saved Values
;;
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
	out Region, R0										;Load Saved Region ID
	pop R0
	out Texture, R0										;Load Saved Texture ID
	pop R0
	mov SP, BP
	pop BP
	ret




__debug:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Save Values
;;
	push BP
	mov BP, SP
	push R0
	in R0, Texture										;Save Texture
	push R0
	in R0, Region										;Save Region
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Main
;;
	call __initial_d
	call __0x
	call __itoa
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Load Saved Values
;;
	mov [BP+3],	X									;Update X and Y for debugmemory
	mov [BP+2],	Y

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
	out Region, R0									;Load Saved Region ID
	pop R0
	out Texture, R0									;Load Saved Texture ID
	pop R0
	mov SP, BP
	pop BP
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Useful Functions
;;
__drawregion_at:
	out DrawX, X
	out DrawY, Y
	out Command, DrawRegion
	ret

;;Different initials based on debug call like normal debug vs debugmemaddrs
__initial_d:
	mov R0,		-1
	out Texture, R0
	mov VALUE,	[BP+4]							;Value that is being printed
	mov X,		[BP+3]							;X Value
	mov Y,		[BP+2]							;Y Value
	ret

__initial_dm:
	mov R0,		-1
	out Texture, R0
	mov X,		0
	mov Y,		0
	mov MEM,	[BP+3]
	mov MEMEND,	[BP+2]
	ret

__initial_dreg:
	mov R0,		-1
	out Texture, R0
	mov X,		0
	mov Y,		0
	ret

__bracket_start:
	mov R9, 91									;"[" in Ascii
	out Region, R9
	call __drawregion_at
	iadd X, 12
	ret

__bracket_end:
	mov R9, 93									;"]" in Ascii
	out Region, R9
	call __drawregion_at
	iadd X, 12
	ret

__colon:
	mov R9, 58									;":" in Ascii
	out Region, R9
	call __drawregion_at
	iadd X, 12
	ret

__space:
	mov R9, 32									;" " in Ascii
	out Region, R9
	call __drawregion_at
	iadd X, 12
	ret

__0x:
	mov R9, 48									;"0" in Ascii
	out Region, R9
	call __drawregion_at
	iadd X, 12
	mov R9, 120									;"x" in Ascii
	out Region, R9
	call __drawregion_at
	iadd X, 12
	ret

__R:
	mov R9, 82									;"R" in ascii
	out Region, R9
	call __drawregion_at
	iadd X, 12
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Main function for debugreg
;;
__main_dreg:
	call __R
	mov VALUE, R10
	call __itoa2
	call __colon
	mov R0, R10									;If >= 10 don't add a space
	ige R0, 10
	jt R0, __con_dreg
	call __space
__con_dreg:
	push R11
	push X
	push Y
	call __debug
	pop Y
	pop X
	pop R11
	mov X, 192									;Set X for second set of Registers
	iadd Y,	22
	mov R0, R10
	ilt R0, 7									;If lt 7 then we will be in the first set of Registers, so set values accordingly
	jf R0, __gt7								;If not then keep 192 as X value
	mov X, 0
__gt7:
	mov R0, R10									;If equal to 7 then next Y must be 0
	ieq R0, 7
	jf R0, __main_dreg_end
	mov Y, 0
__main_dreg_end:
	iadd R10, 1									;Add 1 to Register count
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Convert Int to Ascii
;;
__itoa:
	mov MASK,	0xF0000000
	mov SHIFT,	28
__mask:
	mov BYTE,	VALUE							;Move the value into BYTE to mask
	and BYTE,	MASK							;Mask the value
	mov R0,		SHIFT							;Two's complement
	not R0
	iadd R0,	1
	shl BYTE,	R0
	mov R0,		BYTE	
	igt R0,		9								;Hex has A-F for 10-15 so add 7 igt 9
	jf R0,		__ngt
__gt:											;Is greater than
	iadd BYTE,	7
__ngt:											;Not greater than
	iadd BYTE,	48								;Add 48 for ascii equivalency
	out Region, BYTE
	call		__drawregion_at
	iadd X,		12								;Move X to draw next value at a different spot
	shl MASK,	-4								;Right shift MASK by 4
	isub SHIFT,	4								;Adjust shift count (28->24->20...->4->0)
	mov R0, SHIFT								;Check if shift has gone through all values
	ilt R0, 0
	jf R0, __mask
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Convert Int to Ascii 2
;;
__itoa2:
	mov MASK,	0x000000F0
	mov SHIFT,	4
__mask2:
	mov R0, VALUE								;If VALUE is 0-9 then we don't want that extra mask space and not want to print 0[0-9], so we get rid of the leading 0
	ile R0, 9
	jf R0, __mask2end
	shl MASK,	-4
	isub SHIFT,	4
__mask2end:
	mov BYTE,	VALUE
	and BYTE,	MASK
	mov R0,		SHIFT
	not R0
	iadd R0,	1
	shl BYTE,	R0
	iadd BYTE,	48
	out Region,	BYTE
	call		__drawregion_at
	iadd X,		12
	shl MASK,	-4
	isub SHIFT,	4
	mov R0,		SHIFT
	ilt R0,		0
	jf R0,		__mask2
	ret
