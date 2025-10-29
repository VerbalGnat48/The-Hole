;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Definitions
;;
%define TMP		R0
%define TMP2		R1
%define X		R2
%define Y		R3
%define TMP3		R4
%define Value		R5
%define HBL		R6										;Hitbox left value
%define HBR		R7										;Hitbox right value
%define HBT		R8										;Hitbox top value
%define HBB		R9										;Hitbox bottom value

%define Cntlr		R11
%define Jndex		R12
%define Index		R13

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Mem Addresses
;;
%define Score		0x00000000								;Score
%define Coins		0x00000001								;Coins
%define Lives		0x00000002								;Lives
%define RID			0x00000003								;Region ID
%define	REND		0x00000004								;Region End for Matrix
%define RRL			0x00000005								;Region Row Limit (if sheet is 6 sprites, each 40px wide then. (6+1)*40 = 240)

%define Death		0x00000007								;Keep track of if dead
%define Direction	0x00000008								;Holds last pressed game direction value
%define LSE			0x00000009								;Left screen edge, will act as a boolean for stuff behind player being active
%define RSE			0x0000000A								;Right screen edge, will act as a boolean for stuff infront of player being active
%define PX			0x0000000B								;Player X
%define PY			0x0000000C								;Player Y
%define PID			0x0000000D								;Which Direction the Player is facing
%define Pspeed		0x0000000E								;Player Speed
%define Gspeed		0x0000000F								;Goomba Speed
%define Kspeed		0x00000010								;Koopa Speed
%define KSspeed		0x00000011								;Koopa Shell Speed
%define Ispeed		0x00000012								;Item Speed
%define Print		0x00000013								;Helps print numbers
%define Jump		0x00000014								;Jump State
%define Side		0x00000015								;Face Left or Right ( 0=Left, 1=Right )
%define Ground		0x00000016								;Ground status

%define BGX			0x00000017								;Background 1 X position
%define BGX2		0x00000018
%define BGX3		0x00000019
%define BGX4		0x0000001A
%define BGX5		0x0000001B
%define BGX6		0x0000001C
%define BGX7		0x0000001D
%define BGF			0x0000001E								;Background Flag (0=Active, 1=Dead)
%define BGF2		0x0000001F
%define BGF3		0x00000020
%define BGF4		0x00000021
%define BGF5		0x00000022
%define BGF6		0x00000023
%define BGF7		0x00000024
%define BGS			0x00000025								;Backghround Sub number

%define PipeL1		0x00000026								;Pipe Left
%define PipeR1		0x00000027								;Pipe Right
%define PipeT1		0x00000028								;Pipe Top

%define Goomba												;16 Goombas, 100pts each
%define Koopa												;Singular koopa, 500pts
%define Kshell												;Singular Koopa sheel
%define Shooms												;2 or 3 Mushrooms, 1000pts each
%define OneUp												;One 1-Up
%define Star												;1 Star, 1000pts
%define Coin												;43~ Coins, 200pts each


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Gian's play space
%define GX 			0x00000098 ; Goom x
%define GY 			0x00000099 ; Goom y
%define GHX  		0x00000100 ; Goom hitbox X
%define GHY  		0x00000101 ; Goom hitbox y
%define GS  		0x00000102 ; goom status (alive/dead)
%define GID        	0x00000103 ; Goom draw id
%define RID			0x00000104 ; Region id
%define RF			0x00000105 ; Region id flag (for animation)

%define BOWSX		0x00000200 ; Bowser x position
%define BOWSY		0x00000201 ; Bowser y position
%define BOWSS		0x00000202 ; Bowser status (alive /dead)
%define BOWSID		0x00000203 ; Bowser sprite id
%define BOWSWLK		0x00000204 ; Bowser walk flag (changes every few seconds)
%define BOWSATKF	0x00000205 ; Flag holder, counts until bowser can do attack
%define BOWSATK		0x00000206 ; Bowser's attacks (jumping / fireball)
%define BOWSJMPF	0x00000207 ; Bowser jump flag (0/1)
%define BOWSFBID	0x00000208 ; Bowser Fireball ID (there's two to switch between for animation)
%define BOWSFBX		0x00000209 ; Bowser Fireball X
%define BOWSFBY		0x0000020A ; Bowser Fireball Y
%define BOWSFBS		0x0000020B ; Bowser Fireball Status
%define BOWSSIDE	0x0000020C ; Bowser facing side
%define BOWSFBD		0x0000020D ; Fireball's direction flag 0 = left / 1 = right

%define BFF			0x0000020E ; Boss fight flag (if it adds up to 2, game over)
%define FBF			0x0000020F ; Flags for fireball

%define Playstate	0x00000300 ; Player state (0 = dead, 1 = small, 2 = big)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Aliases
;;
%define Command		GPU_Command
%define DrawRegion	GPUCommand_DrawRegion
%define DrawX 		GPU_DrawingPointX
%define DrawY		GPU_DrawingPointY
%define Region		GPU_SelectedRegion
%define Texture		GPU_SelectedTexture

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Call Game
;;
call _main
hlt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Functions
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Regions and Draws
;;
_define_region:
	out GPU_RegionMinX,		R0
	out GPU_RegionMinY,		R1
	out GPU_RegionMaxX,		R2
	out GPU_RegionMaxY,		R3
	out GPU_RegionHotSpotX,	R4
	out GPU_RegionHotSpotY, R5
	ret

_define_topleft:
	out GPU_RegionMinX,		R0
	out GPU_RegionHotSpotX,	R0
	out GPU_RegionMinY,		R1
	out GPU_RegionHotSpotY,	R1
	out GPU_RegionMaxX,		R2
	out GPU_RegionMaxY,		R3
	ret

_define_matrix:
	out Texture,	TMP
_matrix_loop:
	mov TMP2,		[RRL]
	mov R4,		[REND]
	mov R6,		[RID]
	mov TMP,	R6
	igt TMP,	R4											;Check if RID is > REND and if so stop
	jt TMP,		_matrix_end
	out Region,	R6											;Send RID to Region
	mov TMP,	X											;Put X in TMP as X will need to start at the same spot every loop
	mov TMP,	0
	out GPU_RegionMinX,	TMP
	iadd TMP,	8
	out GPU_RegionHotSpotX, TMP
	iadd TMP,	7
	out GPU_RegionMaxX,	TMP
	mov TMP,	Y											;Put Y in TMP as Y will need to start at the same spot every loop
	mov TMP,	0
	out GPU_RegionMinY,	TMP
	iadd TMP,	16
	out GPU_RegionHotSpotY,	TMP
	iadd TMP,	15
	out GPU_RegionMaxY,	TMP
	iadd R6,	1											;Add one to RID
	iadd X,		16											;Set X to next RID start
	mov [RID],	R6
	mov TMP,	X
	ieq TMP,	TMP2										;Check if X == RRL in order to know to go to next Row
	jf TMP,		_matrix_loop								;If not next row then start at new X on same row
	mov X,		0											;If next Row indeed then reset X to 0 and set Y to next row start
	iadd Y,		16
	jmp			_matrix_loop
_matrix_end:
	ret

_draw_region_at:
	out DrawX,	X
	out DrawY,	Y
	out Command,	DrawRegion
	ret

_set_drawing_scale:
	out GPU_DrawingScaleX,	X
	out GPU_DrawingScaleY,  Y
	ret

_scale:
	mov X,		2
	cif X													;turn int into float for set_drawing_scale
	mov Y,		2
	cif Y
	call _set_drawing_scale
	ret

_neg_scale_X:
	mov X,		2
	cif X
	isgn X													;Make X negative for mirror across Y axis
	mov Y,		2
	cif Y
	call _set_drawing_scale
	ret

_neg_scale_Y:
	mov X,		2
	cif X
	mov Y,		2
	cif Y
	isgn Y													;Make Y negative for mirror across X axis
	call _set_drawing_scale
	ret

_neg_scale_both:
	mov X,		2
	cif X
	isgn X													;Make X negative for mirror across Y axis
	mov Y,		2
	cif Y
	isgn Y													;Make Y negative for mirror across X axis
	call _set_drawing_scale
	ret

_draw_region_zoomed:
    out Command,    GPUCommand_DrawRegionZoomed
    ret

_draw_region_zoomed_at:
    out DrawX,      X
    out DrawY,      Y
    out Command,    GPUCommand_DrawRegionZoomed
    ret

_print_background:
	ieq TMP,		0
	jf TMP,			_print_background_end
    out Texture,    TMP3
    out Region,     TMP3
    mov X,          TMP2
    mov Y,          28
    call _draw_region_zoomed_at
_print_background_end:
	ret

_define_background:
    out Texture,    TMP
    out Region,     TMP
	mov TMP,		0
    mov TMP2,       0
    mov X,          639
    mov Y,          339
    mov R4,         320
    mov R5,         170
    call _define_region
	ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Gamepad
;;
_select_gamepad:
	out INP_SelectedGamepad,	R0
	ret


_movement:
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	mov X,		[PX]
	mov Y,		[PY]
	mov R4,		[PID]
	mov R5,		[Direction]
	mov R6,		[Ground]
	mov R7,		[Jump]
	mov R8,		[Side]
_left:
	in Cntlr,	INP_GamepadLeft									;Gamepad Value is loaded into Cntlr (positive if pressed, negative it not)
	mov TMP,	0
	ilt TMP,	Cntlr											;If < 0 then jump to right
	jf TMP,		_right
	mov R4,		1
	mov R5,		1
	mov R7,		1
	mov TMP,	[Pspeed]										;Going left so subtract Player Speed
	isub X,		TMP
	mov R8,		0
	jmp _up
_right:
	mov R7,		0
	in Cntlr,	INP_GamepadRight								;Gamepad Value is loaded into Cntlr (positive if pressed, negative it not)
	mov TMP,	0
	ilt TMP,	Cntlr											;If < 0 then jump to up
	jf TMP,		_up
	mov R4,		2
	mov R5,		2
	mov R7,		2
	mov TMP,	[Pspeed]										;Going right so add Player Speed
	iadd X,		TMP
	mov R8,		1
_up:
	in Cntlr,	INP_GamepadButtonA
	mov TMP,	0
	ilt TMP,	Cntlr
	jt TMP,		_check_ground_pos
_not_up:
	mov R7,		0
	mov R6,		2
	jmp _gravity
_check_ground_pos:
	mov TMP,	Y
	ieq TMP,	280
	jf TMP,		_where_sprite
_ground_sprite:

	; Play Jump sound
	mov TMP,	1
	out SPU_SelectedSound, TMP
	mov TMP,	1
	out SPU_SelectedChannel, TMP
	mov TMP,	1
	out SPU_ChannelAssignedSound, TMP
	out SPU_Command, SPUCommand_PlaySelectedChannel

	mov R6,		0
	jmp _check_jmp
_where_sprite:
	mov TMP,	Y
	ile TMP,	20
	jt TMP,		_highest_point
	mov TMP,	Y
	ilt TMP,	280
	jt TMP,		_not_highest_point
_highest_point:
	mov R6,		2
	mov Cntlr,	0
	;jmp _draw_in_air_grav
	jmp _gravity
_not_highest_point:
	mov TMP,	R6
	ieq TMP,	2
	;jt TMP, _draw_in_air_grav
	jt TMP,		_gravity
	mov R6,		1
_up_or_down:
	mov TMP,	Cntlr
	ieq R0,		0
	jt TMP,		_highest_point
_check_jmp:
	mov TMP,	R6
	ieq TMP,	0
	jt TMP,		_check_jmp_2
	mov TMP,	R6
	ieq TMP,	1
	jt TMP,		_check_jmp_2
	jmp _gravity
_check_jmp_2:
	mov TMP,	R7
	ieq TMP,	0
	jt TMP,		_jmp_up
	mov TMP,	R7
	ieq TMP,	1
	jt TMP,		_jmp_left
	mov TMP,	R7
	ieq TMP,	2
	jt TMP,		_jmp_right
	jmp _gravity
_jmp_up:
	isub Y,		15
	;jmp _draw_in_air_grav
	jmp _gravity
_jmp_left:
	mov TMP,	[Pspeed]
	;isub X,		TMP
	isub Y,		15
	;jmp _draw_in_air_grav
	jmp _gravity
_jmp_right:
	mov TMP,	[Pspeed]
	;iadd X,		TMP
	;jmp _draw_in_air_grav
	isub Y,		15
_gravity:
	;mov TMP,	R6
	;ieq TMP,	0
	;jt TMP,		_draw_in_air_grav
	;jf TMP,		_draw_on_ground
	;call _animation
;_gravity_end:
	iadd Y,		5
	mov TMP,	Y
	ige TMP,	280
	jf TMP,		_movement_end
	mov Y,		280
	mov R6, 	0
_movement_end:
	mov [PX],	X
	mov [PY],	Y
	mov [PID],	R4
	mov [Direction],	R5
	mov [Ground],		R6
	mov [Jump],	R7
	mov [Side],	R8
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	ret

_edge_equal:
	mov Index,	0
_ee_loop:
	iadd Index,	1
	mov TMP,	X
	iadd TMP,	Index
	ieq TMP,	256
	jt TMP,		_ee_loop_end
	mov TMP2,	Index
	ieq TMP2,	10
	jt TMP2,	_ee_loop_end
	jmp _ee_loop
_ee_loop_end:
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Text and Print
;;
_Itoa_D:														;Stuff prints right to left
	mov Index,	0
	mov Jndex,	0
	mov TMP3,	Value
_Itoa_D_start:
	mov TMP,	Index
	ieq TMP,	0
	jt TMP,		_Itoa_D_mod										;If Value is 0 then print
	mov TMP,	TMP3
	ieq TMP,	0
	jt TMP,		_Itoa_D_print
	idiv TMP3,	10
	iadd Jndex,	1
	isub Index,	1
	jmp _Itoa_D_start
_Itoa_D_mod:
	mov TMP,	TMP3											;Make Value into Ascii
	imod TMP,	10
	iadd TMP,	48
	mov TMP2,	Print
	iadd Index,	1
	jmp _Itoa_D_start
_Itoa_D_print:
	mov Index,	0
_Itoa_D_ploop:
    mov TMP,    Print
    iadd TMP,   Index
    mov TMP2,   [TMP]
    mov TMP,    Index
    ilt TMP,    Jndex
    jf TMP,     _Itoa_D_end
    out Region, TMP2
    call _draw_region_at
    isub X,     10
    iadd Index, 1
    jmp _Itoa_D_ploop
_Itoa_D_end:
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Print the Message
;;
_msgmkr:
    mov TMP2,   [TMP]                   	                    ;Derefernce TMP and move into TMP2
    mov TMP3,   TMP2                        	                ;Check if end of string
    ieq TMP3,   0
    jt TMP3,    _msgmkrend
    out Region, TMP2                            	            ;Select Region and Draw
    out DrawX,  X
    out DrawY,  Y
    out Command, DrawRegion
    iadd X,     10                  	                        ;Move X for next letter in string
    iadd TMP,   1               	                            ;Increment memory address of string msg
    jmp _msgmkr
_msgmkrend:
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Time
;;
_frame_counter:
	in TMP,	TIM_FrameCounter
	ret

_get_time:
	in TMP, TIM_CurrentTime
	ret

_rand:
	in TMP,	RNG_CurrentValue
	ret

_srand:
	out RNG_CurrentValue,	TMP
	ret

_clear:
	mov TMP,	0xFF4A31BD											;Breloom
	out GPU_ClearColor,	TMP
	out Command, GPUCommand_ClearScreen
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Main
;;
_main:

	;Play music
	mov TMP,		0
	out SPU_SelectedSound, TMP
	mov TMP,		0
	out SPU_SelectedChannel, TMP
	mov TMP,		0
	out SPU_ChannelAssignedSound, TMP
	out SPU_Command, SPUCommand_PlaySelectedChannel

	;Time Time
	call _get_time
	call _srand
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;
	;; Texture Definitions
	;;

	;Background 1
   	mov TMP,        1
	call _define_background

	;Background 2
   	mov TMP,        2
	call _define_background

	;Background 3
   	mov TMP,        3
	call _define_background

	;Background 4
    	mov TMP,        4
	call _define_background

	;Background 5
    	mov TMP,        5
	call _define_background

	;Background 6
    	mov TMP,        6
	call _define_background

	;Background 7
    	mov TMP,        7
	call _define_background

	;Mattio standing facing right
	mov TMP,		0
	out Texture,	TMP
	out Region,		TMP
	mov TMP,		0
	mov TMP2,		16
	mov X,			15
	mov Y,			31
	mov R4,			8
	mov R5,			24
	call _define_region

	;Mattio running leftmost right
	mov TMP, 0
	out Texture, TMP
	out Region, 1
	mov TMP, 32
	mov TMP2, 16
	mov X, 47
	mov Y, 32
	mov R4, 40
	mov R5, 24
	call _define_region

	;Mattio running middle right
	mov TMP, 0
	out Texture, TMP
	out Region, 2
	mov TMP, 49
	mov TMP2, 16
	mov X, 61
	mov Y, 32
	mov R4, 56
	mov R5, 24
	call _define_region

	;Mattio running rightmost right
	mov TMP, 0
	out Texture, TMP
	out Region, 3
	mov TMP, 64
	mov TMP2, 16
	mov X, 79
	mov Y, 31
	mov R4, 72
	mov R5, 24
	call _define_region

	;Mattio Jumping right
	mov TMP, 0
	out Texture, TMP
	out Region, 4
	mov TMP, 96
	mov TMP2, 16
	mov X, 112
	mov Y, 31
	mov R4, 105
	mov R5, 26
	call _define_region

	;Mattio Dies
	mov TMP,		0
	out Texture,	TMP
	out Region,		5
	mov TMP,		129
	mov TMP2,		12
	mov X,			143
	mov Y,			30
	call _define_region

	;Goomba step 1
	;mov TMP, 0
	;out Texture, TMP
	;out Region, 30
	;mov TMP, 0
	;mov TMP2, 204
	;mov X, 15
	;mov Y, 224
	;mov R4, 8
	;mov R5, 216
	;call _define_region

	;Goomba step 2
	;mov TMP, 0
	;out Texture, TMP
	;out Region, 31
	;mov TMP, 16
	;mov TMP2, 204
	;mov X, 31
	;mov Y, 224
	;mov R4, 24
	;mov R5, 216
	;call _define_region


	;Goomba squished
	;mov TMP, 0
	;out Texture, TMP
	;out Region, 32
	;mov TMP, 32
	;mov TMP2, 204
	;mov X, 48
	;mov Y, 224
	;mov R4, 40
	;mov R5, 216
	;call _define_region
	
	;call _Goomba_Regions

	call _Bowser_Regions


	;Brick
	out Texture,	0
	out Region,		10
	mov TMP,		160
	mov TMP2,		240
	mov X,			175
	mov Y,			255
	call _define_topleft

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;
	;; Initialize!
	;;
	;Mattio init  Values
	mov TMP,		1
	mov [Playstate],	TMP
	mov TMP,		0
	mov [BFF],		TMP
	mov TMP,		0
	mov [RID],		TMP
	mov TMP,		20
	mov [PX],		TMP
	mov TMP,		280
	mov [PY],		TMP
	mov TMP,		4
	mov [Pspeed],	TMP
	mov TMP,		640

	;Background X and Flag values
	mov [BGX],		TMP
	mov TMP,		1920
	mov [BGX2],		TMP
	mov TMP,		1920
	mov [BGX3],		TMP
	mov TMP,		1920
	mov [BGX4],		TMP
	mov TMP,		1920
	mov [BGX5],		TMP
	mov TMP,		1920
	mov [BGX6],		TMP
	mov TMP,		1920
	mov [BGX7],		TMP
	mov TMP,		0
	mov [BGF],		TMP
	mov [BGF2],		TMP
	mov TMP,		1
	mov [BGF3],		TMP
	mov [BGF4],		TMP
	mov [BGF5],		TMP
	mov [BGF6],		TMP
	mov [BGF7],		TMP

	;When to end background printing
	mov TMP,		0
	isub TMP,		640
	mov [BGS],		TMP

	; Goomba inits
	;mov TMP, 270
	;mov [GX], TMP
	;mov TMP, 280
	;mov [GY], TMP
	
	; Goomba hitbox
	;mov TMP, 270
	;mov [GHX], TMP
	;mov TMP, 280
	;mov [GHY], TMP

	; Goomba status
	;mov TMP, 1
	;mov [GS], TMP

	; Goomba ID
	;mov TMP, 31
	;mov [GID], TMP

	;call _Goomba_initialize

	call _Bowser_initialize

_game_loop:
	call _frame_counter
	mov TMP2,	TMP
	mov TMP3,	TMP
	imod TMP2, 	2
	imod TMP3,	120
	ieq TMP2, 	0
	ieq TMP3,	0
	jf TMP2, 	_game_loop
	jt TMP3,	_Bowser_walk_flag


	_Bowser_walk_flag_ret:

	;call _Bowser_attack_check


	;Pipe 1 Boundary values
;	mov TMP,		[BGX]
;	isub TMP,		192
;	mov [PipeL1],		TMP
;	mov TMP,		[BGX]
;	isub TMP,		161
;	mov [PipeR1],		TMP
;	mov TMP,		272
;	mov [PipeT1],		TMP

	;Clear
	call _clear

	;Scale
	call _scale

	;Background Draw 1
	mov TMP,		[BGF]
	mov TMP2,		[BGX]
	mov TMP3,		1
	call _print_background

	;Background Draw 2
    mov TMP,	        [BGF2]
	mov TMP2,		[BGX2]
	mov TMP3,		2
	call _print_background

	;Background Draw 3
	mov TMP,		[BGF3]
	mov TMP2,		[BGX3]
	mov TMP3,		3
	call _print_background

	;Background Draw 4
	mov TMP,		[BGF4]
	mov TMP2,		[BGX4]
	mov TMP3,		4
	call _print_background

	;Background Draw 5
   	mov TMP,	    [BGF5]
	mov TMP2,		[BGX5]
	mov TMP3,		5
	call _print_background

	;Background Draw 6
	mov TMP,		[BGF6]
	mov TMP2,		[BGX6]
	mov TMP3,		6
	call _print_background

	;Background Draw 7
	mov TMP,		[BGF7]
	mov TMP2,		[BGX7]
	mov TMP3,		7
	call _print_background

	;Brick Draw
	out Texture,	0
	out Region,		10
	mov X,			256
	mov Y,			168
	call _draw_region_zoomed_at




	;Goomba Draw
	;call _Goomba_animation
	;call _Goomba_draw

	; Original Goomba process (movd to include file)
	;out Texture, 0
	;mov TMP, [GID]
	;out Region, TMP
	;mov X, [GX]
	;mov Y, [GY]
	;call _draw_region_zoomed_at

	; Bowser Draw
	call _Bowser_mirror
	call _Bowser_animation
	call _Bowser_draw
	call _Fireball_animation


	;Pipe Boundary 1
	mov X,			[PX]
	mov Y,			[PY]

_pipe_check:
	mov TMP,		X
	iadd TMP,		8
	ieq TMP,		256			;240 if no iadd
	jt TMP,			_pipe_left
	mov TMP,		X
	isub TMP,		8
	ieq TMP,		320
	jt TMP,			_pipe_right
	jmp _pipe_top
_pipe_left:
	mov TMP,		Y
	iadd TMP,		8
	igt TMP,		168
	jf TMP,			_pipe_top
	mov X,			236
	mov [PX],		X
	jmp _move_screen
_pipe_right:
	mov TMP,		Y
	isub TMP,		8
	igt TMP,		168
	jf TMP,			_pipe_top
	mov X,			332
	mov [PX],		X
	jmp _move_screen
_pipe_top:
	mov TMP,		X
	iadd TMP,		7
	ige TMP,		256
	mov TMP2,		X
	isub TMP2,		8
	ile TMP2,		320
	and TMP,		TMP2
	jf TMP,			_move_screen
	mov TMP,		Y
	iadd TMP,		8
	ige TMP,		152
	jf TMP,			_move_screen
	mov Y,			146
	mov [PY],		Y
	mov [Ground],	TMP
	
	jmp _move_screen

_move_screen:											;If background 7 then when BGX7 = 0 stop letting screen move
	mov TMP,		[BGF6]
	mov TMP2,		[BGF7]
	ieq TMP,		1
	ieq TMP2,		0
	and TMP,		TMP2
	jf TMP,			_move_500
	mov TMP,		[BGX7]
	ile TMP,		0
	jf TMP,			_move_500
	mov TMP,		[PX]
	ige TMP,		498									;And change player boundary
	jf TMP,			_move_500
	mov X,			495
	mov[PX],		TMP
	jmp _move

_move_500:
	mov TMP,		[PX]
	igt TMP,		500
	jf TMP,			_mirror
_move:
	mov TMP2,		[Pspeed]
	mov TMP,		[BGX]															;Move Backgrounds 1 and 2
	isub TMP,		TMP2
	mov [BGX],		TMP
	mov TMP,		[BGX2]
	isub TMP,		TMP2
	mov [BGX2],		TMP
_background_1_check:
	mov TMP2,		[BGS]
	mov TMP,		[BGX]
	ile TMP,		TMP2
	jf TMP,			_background_2_check
	mov TMP,		1
	mov [BGF],		TMP
	mov TMP,		0
	mov [BGF3],		TMP
_background_2_check:
	mov TMP2,		[BGS]
	mov TMP,		[BGX2]
	ile TMP,		TMP2
	jf TMP,			_background_3_check
	mov TMP,		1
	mov [BGF2],		TMP
	mov TMP,		0
	mov [BGF4],		TMP
_background_3_check:
	mov TMP2,		[BGS]
	mov TMP,		[BGX3]
	ile TMP,		TMP2
	jf TMP,			_background_4_check
	mov TMP,		1
	mov [BGF3],		TMP
	mov TMP,		0
	mov [BGF5],		TMP
_background_4_check:
	mov TMP2,		[BGS]
	mov TMP,		[BGX4]
	ile TMP,		TMP2
	jf TMP,			_background_5_check
	mov TMP,		1
	mov [BGF4],		TMP
	mov TMP,		0
	mov [BGF6],		TMP
_background_5_check:
	mov TMP2,		[BGS]
	mov TMP,		[BGX5]
	ile TMP,		TMP2
	jf TMP,			_background_6_check
	mov TMP,		1
	mov [BGF5],		TMP
	mov TMP,		0
	mov [BGF7],		TMP
_background_6_check:
	mov TMP2,		[BGS]
	mov TMP,		[BGX6]
	ile TMP,		TMP2
	jf TMP,			_screen_move
	mov TMP,		1
	mov [BGF6],		TMP
	mov TMP,		0
	mov [BGF7],		TMP
	
_screen_move:
	mov TMP,		[PX]
	igt TMP,		500
	jf TMP,			_bgc_end
	
_bg3c:
	mov TMP,		[BGF3]
	ieq TMP,		0
	jf TMP,			_bg4c
	mov TMP2,		[Pspeed]
	mov TMP,		[BGX3]
	isub TMP,		TMP2
	mov [BGX3],		TMP
_bg4c:
	mov TMP,		[BGF4]
	ieq TMP,		0
	jf TMP,			_bg5c
	mov TMP2,		[Pspeed]
	mov TMP,		[BGX4]
	isub TMP,		TMP2
	mov [BGX4],		TMP
_bg5c:
	mov TMP,		[BGF5]
	ieq TMP,		0
	jf TMP,			_bg6c
	mov TMP2,		[Pspeed]
	mov TMP,		[BGX5]
	isub TMP,		TMP2
	mov [BGX5],		TMP
_bg6c:
	mov TMP,		[BGF6]
	ieq TMP,		0
	jf TMP,			_bg7c
	mov TMP2,		[Pspeed]
	mov TMP,		[BGX6]
	isub TMP,		TMP2
	mov [BGX6],		TMP
_bg7c:
	mov TMP,		[BGF7]
	ieq TMP,		0
	jf TMP,			_bgc_end
	mov TMP2,		[Pspeed]
	mov TMP,		[BGX7]
	isub TMP,		TMP2
	mov [BGX7],		TMP
_bgc_end:

_mirror:
	mov TMP,		[Side]
	ieq TMP,		0
	jf TMP,			_player
	call _neg_scale_X
_player:
	;Player Draw
	;call _animation
	call _movement
	call _animation

	;mov TMP, [Ground]
	;igt TMP, 0
	;jt TMP, _draw_in_air
	;_draw_in_air_ret:

	mov TMP,		0
	out Texture,	TMP
	mov TMP,		[RID]
	out Region,		TMP
	mov X,			[PX]
	mov Y,			[PY]
	call _draw_region_zoomed_at

	mov TMP,	[Playstate]
	ieq TMP,	0
	jt TMP,		_game_over_one

	mov TMP,		PY;BFF;BOWSATKF
	push TMP
	iadd TMP,		1
	push TMP
	call _debugmemory
	pop TMP
	pop TMP
	


;call _Goomba_status_and_hitboxes
call _Bowser_attack_check
call _Bowser_status_and_hitboxes

;_enemy_alive_status:
	;Is the enemy alive? if yes, let him move left
;	mov TMP, [GS]
;	ieq TMP, 1
;	;jf TMP, _game_loop_end
;	jf TMP, _move_killed_enemy
;
;	mov TMP, [GX]
;	isub TMP, 2
;	mov [GX], TMP
;
;	mov TMP, [GHX]
;	isub TMP, 2
;	mov [GHX], TMP
;
;_hit_enemy_x:
;
;	mov TMP, [GHX]
;	isub TMP, 8
;	mov TMP2, [PX]
;	iadd TMP2, 8
;	ieq TMP, TMP2
;	jt TMP, _check_y_from_x
;	jf TMP, _hit_enemy_y_one
;
;
;	;jt TMP, _game_over
;	;jt TMP, _enemy_kill
;
;	;mov TMP, [GHX]
;	;mov TMP2, [PX]
;	;ieq TMP, TMP2
;	;jt TMP _game_over
;	;jt TMP, _hit_enemy_y_one
;	;jf TMP, _game_loop_end
;
;_check_y_from_x:			; May need an expansion of parameters from left hand side reaching upwards as the y's should not be exact
;
;	mov TMP, [GY]
;	mov TMP2, [PY]
;	ieq TMP, TMP2
;	jt TMP, _game_over
;
;_hit_enemy_y_one:
;
;	mov TMP, [GY]
;	isub TMP, 5
;	mov TMP2, [PY]
;	iadd TMP2, 5
;	ige TMP2, TMP
;	jt TMP2, _check_x_from_y_one
;	jf TMP2, _game_loop_end
;
;
;	;jt TMP, _enemy_kill
;	;jt TMP, _hit_enemy_y_two
;	;jf TMP, _game_loop_end
;
;_check_x_from_y_one:
;
;	mov TMP, [GHX]
;	isub TMP, 4
;	mov TMP2, [PX]
;	ige TMP2, TMP
;	jt TMP2, _check_x_from_y_two
;	jf TMP2, _game_loop_end
;
;	;jt TMP2, _enemy_kill
;
;
;_check_x_from_y_two:
;
;	mov TMP, [GHX]
;	iadd TMP, 20	; This has been made to be bigger in case player overshoots goomba
;	mov TMP2, [PX]
;	ile TMP2, TMP
;	jt TMP2, _enemy_kill
;	jf TMP2, _game_loop_end
;
;_hit_enemy_y_two:
;
;	mov TMP, [GHX]
;	isub TMP, 8
;	mov TMP2, [PX]
;	ilt TMP, TMP2
;	jt TMP, _game_loop_end
;	mov TMP, [GHX]
;	iadd TMP, 8
;	igt TMP, TMP2
;	jt TMP, _game_loop_end
;
;_enemy_kill:
;
;	mov TMP, [PX]
;	iadd TMP, 20
;	mov [PX], TMP
;	mov TMP, [PY]
;	isub TMP, 20
;	mov [PY], TMP
;	
;	mov TMP, 0
;	mov [GS], TMP
;
;	mov TMP, 32
;	mov [GID], TMP
;
;	jmp _game_loop_end
;
;_move_killed_enemy:
;
;	mov TMP, [GY]
;	iadd TMP, 5
;	;mov TMP, [GX]
;	;isub TMP, 1
;	mov [GY], TMP

_game_loop_end:
	wait
	jmp _game_loop
_end:
	ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; End of game process, make screen grey, print "GAME OVER"
_game_over_one:

mov TMP,			[Playstate]
isub TMP,			1
mov [Playstate],	TMP
mov TMP,			[Playstate]
ieq TMP,			0
jf TMP,				_game_loop
jt TMP,				_game_over_two
;ret

_game_over_two:
; Stop background theme from playing so that the death theme can play
	mov TMP,	0
	out SPU_SelectedSound, TMP
	mov TMP,	0
	out SPU_SelectedChannel, TMP
	mov TMP,	0
	out SPU_ChannelAssignedSound, TMP
	out SPU_Command, SPUCommand_StopAllChannels

; Play the death and game over theme
	mov TMP,	4
	out SPU_SelectedSound, TMP
	mov TMP,	4
	out SPU_SelectedChannel, TMP
	mov TMP,	4
	out SPU_ChannelAssignedSound, TMP
	out SPU_Command, SPUCommand_PlaySelectedChannel

mov TMP,			5
mov [RID],			TMP
call _clear

_move_player_off_screen:
wait
call _clear

;call _frame_counter
;imod TMP,			155
;ieq TMP,			0
;jf TMP,				_move_player_off_screen
;call _clear

mov TMP,			[PY]
iadd TMP,			5
mov [PY],			TMP

mov TMP,		0
out Texture,	TMP
mov TMP,		[RID]
out Region,		TMP
mov X,			[PX]
mov Y,			[PY]
call _draw_region_zoomed_at


mov TMP,			[PY]
ige TMP,			500
jf TMP,				_move_player_off_screen


_game_over_three:
;mov R7, -808020 ;
;out GPU_ClearColor, R7 ;
;out GPU_Command, GPUCommand_ClearScreen

	mov TMP,		PY;BFF;BOWSATKF
	push TMP
	iadd TMP,		1
	push TMP
	call _debugmemory
	pop TMP
	pop TMP
	

;jmp _game_over



mov R6, -1
out GPU_SelectedTexture, R6

mov R7, __message_game_over

; first symbol
mov R9, [R7]
out GPU_SelectedRegion, R9

mov R2, 320
out GPU_DrawingPointX, R2
mov R3, 180
out GPU_DrawingPointY, R3
out GPU_Command, GPUCommand_DrawRegion

_while_msg:
iadd R2, 12
iadd R7, 1

mov R9, [R7]

mov R4, R9
ieq R4, 0
jt R4, _end_while_msg

out GPU_DrawingPointX, R2
out GPU_DrawingPointY, R3
out GPU_SelectedRegion, R9
out GPU_Command, GPUCommand_DrawRegion

jmp _while_msg

_end_while_msg:
hlt

__message_game_over:
string "Game Over!"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;_animation:




;_chk_jmp_flag:
;mov TMP, [Ground]
;ieq TMP,	2
;jf TMP, _draw_in_air
;jt TMP, _draw_on_ground

;_draw_in_air:
;mov TMP, 4
;mov [RID], TMP
;jmp _draw_in_air_ret
;jmp _animation_end
;jmp _gravity_end

;_draw_in_air_grav:
;mov TMP, 4;
;mov [RID], TMP
;jmp _animation_end
;jmp _gravity_end

;_draw_on_ground:
;mov TMP, 0
;mov [RID], TMP
;jmp _animation_end
;jmp _gravity_end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;_Goomba_animation:
;mov TMP, [GS]
;ieq TMP, 0
;jt TMP, _end_Goomba_animation
;mov TMP, [GID]
;ieq TMP, 30
;jt TMP, _thirty_to_thirtyone
;mov TMP, [GID]
;ieq TMP, 31
;jt TMP, _thirtyone_to_thirty

;_thirty_to_thirtyone:
;mov TMP, 31
;mov [GID], TMP
;jmp _end_Goomba_animation

;_thirtyone_to_thirty:
;mov TMP, 30
;mov [GID], TMP
;jmp _end_Goomba_animation

;_end_Goomba_animation:
;ret

%include "debug.s"
%include "GoombaFile.asm"
%include "include_file_testing_animation.asm"
%include "include_file_bowser.asm"