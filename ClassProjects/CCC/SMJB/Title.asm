;%define T1    R0
;%define T2   R1
;%define X	   R2
;%define Y	   R3
;%define RID    0x00000003
;%define Apos   0x00000100
;%define Bobpos 0x00001000
;%define Cntlr  R11

;%define Command		GPU_Command
;%define DrawRegion	GPUCommand_DrawRegion
;%define DrawX 		GPU_DrawingPointX
;%define DrawY		GPU_DrawingPointY
;%define Region		GPU_SelectedRegion
;%define Texture		GPU_SelectedTexture



_title_screen:



;call _main
;hlt

mov T1, 9
out Texture, T1

mov T1, 9
out Region, T1

; Frame Counter, time-based
;_frame_counter:
;in T1, TIM_FrameCounter
;_frame_counter_ret:
;ret

;_define_region:
;	out GPU_RegionMinX,		R0
;	out GPU_RegionMinY,		R1
;	out GPU_RegionMaxX,		R2
;	out GPU_RegionMaxY,		R3
;	out GPU_RegionHotSpotX,	R4
;	out GPU_RegionHotSpotY, R5
;	ret

;_define_topleft:
;	out GPU_RegionMinX,		R0
;	out GPU_RegionHotSpotX,	R0
;	out GPU_RegionMinY,		R1
;	out GPU_RegionHotSpotY,	R1
;	out GPU_RegionMaxX,		R2
;	out GPU_RegionMaxY,		R3
;	ret






;_main:


;;;; Music goes here
;;;;mov T1,	0
;;;;out SPU_SelectedSound, T1


mov T1,	0
out SPU_ChannelAssignedSound, T1
out SPU_Command, SPUCommand_PlaySelectedChannel

;;;;mov T1,	00
;;;;out SPU_SoundPlayWithLoop,	T1
;;;;SPUCommand_PlaySelectedChannel;, T1







; background stats
mov T1, 		9
out Texture, 	T1
mov T1, 		1300
out Region, 	T1

mov T1, 		0
mov T2, 		0
mov X, 			639
mov Y, 			359
call _define_topleft

; arrow stats
mov T1,			9
out Texture,	T1
mov T1, 		100
mov [RID], 		T1
out Region, 	T1
mov T1, 		0
mov T2, 		360
mov X, 			30
mov Y, 			390
call _define_topleft

; Arrow flag init y
mov T1, 0
mov [Apos], T1

; Arrow flag init x
mov T1, 0
mov [Bobpos], T1

;; Select gamepad
mov Cntlr, 0
out INP_SelectedGamepad, Cntlr

mov R12, 170 ; need some type of feeding registers for x and y, 12 and 13 respectively
mov R13, 200 ; inits for arrow draw

_Title_loop:
; use of frame counter
call _frame_counter
imod T1, 10
ieq T1, 0
jf T1, _Title_loop
jt T1, _switch_arrow_bob

_switch_arrow_bob:
mov T1, [Bobpos]
mov T2, 1
ieq T2, T1
jf T2, _move_arrow_left
jt T2, _move_arrow_right

_move_arrow_left:
isub R12, 20
mov T1, 1
mov [Bobpos], T1
jmp _screen_start

_move_arrow_right:
iadd R12, 20
mov T1, 0
mov [Bobpos], T1
jmp _screen_start


_screen_start:
mov T1, -65536
out GPU_ClearColor, T1
out Command, GPUCommand_ClearScreen

;Draw background
mov T1, 		9
out Texture, 	T1
mov T1,			1300
out Region, 	T1
mov X, 			0
mov Y, 			0
out DrawX, 		X
out DrawY, 		Y
out Command, DrawRegion

;Draw arrow
mov T1,			9
out Texture,	T1
mov T1, 		[RID]
out Region, 	T1
mov X, 			R12
mov Y, 			R13
out DrawX, 		X
out DrawY, 		Y
out Command, DrawRegion

;Check to see for player input to select which character they wish to play as
_check_which_character_to_play:
in Cntlr, INP_GamepadButtonStart
mov T1, 0
ilt T1, Cntlr
jt T1, _I_want_this_character
jf T1, _check_title_keypad_down

_check_title_keypad_down:
in Cntlr, INP_GamepadDown
mov T1, 0
ilt T1, Cntlr
jf T1, _not_title_keypad_down
jt T1, _is_title_keypad_down

_not_title_keypad_down:
;mov T1, 1
;mov [Apos], T1
jmp _check_title_keypad_up

_is_title_keypad_down:
mov T1, 1
mov [Apos], T1
jmp _draw_arrow_down

_check_title_keypad_up:
in Cntlr, INP_GamepadUp
mov T1, 0
ilt T1, Cntlr
jf T1, _not_title_keypad_up
jt T1, _is_title_keypad_up

_not_title_keypad_up:
;mov T1, 1
;mov [Apos], T1
jmp _end_title_frame

_is_title_keypad_up:
mov T1, 0
mov [Apos], T1
jmp _draw_arrow_up


_draw_arrow_down:
;Draw arrow down
;mov T1, [RID]
;out Region, T1
;mov R12, 170
mov R13, 235
;out DrawX, X
;out DrawY, Y
;out Command, DrawRegion
jmp _end_title_frame
;jmp _actually_draw_arrow


_draw_arrow_up:
;Draw arrow down
;mov T1, [RID]
;out Region, T1
;mov R12, 170
mov R13, 200

jmp _end_title_frame
;jmp _actually_draw_arrow



_end_title_frame:
mov T1, R12

wait
jmp _Title_loop

_I_want_this_character:
mov T1, R13
ieq T1, 200
jt T1, _play_as_Mattio
jf T1, _play_as_Joeigi

_play_as_Mattio:
call _Mattio_msg;game

_play_as_Joeigi:
call _Joeigi_msg;game


;%include "Mattio-game.asm"
;%include "Joeigi-game.asm"
