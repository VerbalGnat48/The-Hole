;This is a demo for how the character animation will work

_animation:

mov T1,     [Size]
ieq T1,     1
jt T1,      _small_size_animations
jf T1,      _big_size_animations


_small_size_animations:
_chk_in_air:
mov T1, [Ground]
igt T1, 0
jt T1, _draw_in_air


_chk_inp_lft:
in Cntlr, INP_GamePadLeft
mov T1, 0
ilt T1, Cntlr
jf T1, _not_input_left

; Flag check for running animation
mov T1, [RID]
ieq T1, 0
jt T1, _zero_to_one
mov T1, [RID]
ieq T1, 1
jt T1, _one_to_two
mov T1, [RID]
ieq T1, 2
jt T1, _two_to_three
mov T1, [RID]
ieq T1, 3
jt T1, _three_to_one
jf T1, _zero_to_one

; Right hand side stuff
_zero_to_one:
mov T1, 1
mov [RID], T1
jmp _do_thing

_one_to_two:
mov T1, 2
mov [RID], T1
jmp _do_thing

_two_to_three:
mov T1, 3
mov [RID], T1
jmp _do_thing

_three_to_one:
mov T1, 1
mov [RID], T1
jmp _do_thing

_do_thing:
jmp _animation_end

_animation_end:
ret

_not_input_left:


_chk_inp_rgt:
in Cntlr, 	INP_GamePadRight
mov T1, 	0
ilt T1, 	Cntlr
jf T1, 	_not_input_right


; Flag check for running animation
mov T1, [RID]
ieq T1, 0
jt T1, _zero_to_one
mov T1, [RID]
ieq T1, 1
jt T1, _one_to_two
mov T1, [RID]
ieq T1, 2
jt T1, _two_to_three
mov T1, [RID]
ieq T1, 3
jt T1, _three_to_one
jf T1, _zero_to_one

_not_input_right:

;;SAFETY FOR PRESERVING INTEGRITY OF GAME
mov T1, 0
mov [RID], T1
jmp _animation_end


_draw_in_air:
mov T1, 4
mov [RID], T1
jmp _animation_end



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



_big_size_animations:
_chk_in_air_big:
mov T1, [Ground]
igt T1, 0
jt T1, _draw_in_air_big


_chk_inp_lft_big:
in Cntlr, INP_GamePadLeft
mov T1, 0
ilt T1, Cntlr
jf T1, _not_input_left_big

; Flag check for running animation
mov T1, [RID]
ieq T1, 10
jt T1, _zero_to_one_big
mov T1, [RID]
ieq T1, 11
jt T1, _one_to_two_big
mov T1, [RID]
ieq T1, 12
jt T1, _two_to_three_big
mov T1, [RID]
ieq T1, 13
jt T1, _three_to_one_big
jf T1, _zero_to_one_big

; Right hand side stuff
_zero_to_one_big:
mov T1, 11
mov [RID], T1
jmp _do_thing_big

_one_to_two_big:
mov T1, 12
mov [RID], T1
jmp _do_thing_big

_two_to_three_big:
mov T1, 13
mov [RID], T1
jmp _do_thing_big

_three_to_one_big:
mov T1, 11
mov [RID], T1
jmp _do_thing_big

_do_thing_big:
jmp _animation_end


_not_input_left_big:


_chk_inp_rgt_big:
in Cntlr, 	INP_GamePadRight
mov T1, 	0
ilt T1, 	Cntlr
jf T1, 	_not_input_right_big


; Flag check for running animation
mov T1, [RID]
ieq T1, 10
jt T1, _zero_to_one_big
mov T1, [RID]
ieq T1, 11
jt T1, _one_to_two_big
mov T1, [RID]
ieq T1, 12
jt T1, _two_to_three_big
mov T1, [RID]
ieq T1, 13
jt T1, _three_to_one_big
jf T1, _zero_to_one_big

_not_input_right_big:

;;SAFETY FOR PRESERVING INTEGRITY OF GAME
mov T1, 10
mov [RID], T1
jmp _animation_end


_draw_in_air_big:
mov T1, 14
mov [RID], T1
jmp _animation_end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; This is a function for the transition from small to big upon getting mushroom
_get_big:

    ;  Play sound?



_get_big_part_one:
    call _frame_counter
    imod T1,    5
    ieq T1,     0
    jf T1,      _get_big

    mov T1,     0
    mov [RID],  T1

	mov T1,			0
	out Texture,	T1
	mov T1,			[RID]
	out Region,		T1
	mov X,			[PX]
	mov Y,			[PY]
    isub Y,         10
	call _draw_region_zoomed_at

    wait
    call _clear

	mov R6,			7						;End value
	mov R10,		[BGY]
	call _print_backgrounds


_get_big_part_two:
    call _frame_counter
    imod T1,    5
    ieq T1,     0
    jf T1,      _get_big_part_two

    mov T1,     7
    mov [RID],  T1

	mov T1,			0
	out Texture,	T1
	mov T1,			[RID]
	out Region,		T1
	mov X,			[PX]
	mov Y,			[PY]
	call _draw_region_zoomed_at

    wait
    call _clear

	mov R6,			7						;End value
	mov R10,		[BGY]
	call _print_backgrounds

_get_big_part_three:
    call _frame_counter
    imod T1,    5
    ieq T1,     0
    jf T1,      _get_big_part_three

    mov T1,     10
    mov [RID],  T1

	mov T1,			0
	out Texture,	T1
	mov T1,			[RID]
	out Region,		T1
	mov X,			[PX]
	mov Y,			[PY]
	call _draw_region_zoomed_at

    wait
    call _clear

    mov R6,			7						;End value
    mov R10,		[BGY]
    call _print_backgrounds

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; This is a function for the transition from small to big upon getting mushroom
_get_small:

    ;  Play sound?



_get_small_part_one:
    call _frame_counter
    imod T1,    5
    ieq T1,     0
    jf T1,      _get_small

    mov T1,     0
    mov [RID],  T1

	mov T1,			0
	out Texture,	T1
	mov T1,			[RID]
	out Region,		T1
	mov X,			[PX]
	mov Y,			[PY]
    ;iadd Y,         4
	call _draw_region_zoomed_at

    wait
    call _clear

	mov R6,			7						;End value
	mov R10,		[BGY]
	call _print_backgrounds


_get_small_part_two:
    call _frame_counter
    imod T1,    5
    ieq T1,     0
    jf T1,      _get_small_part_two

    mov T1,     7
    mov [RID],  T1

	mov T1,			0
	out Texture,	T1
	mov T1,			[RID]
	out Region,		T1
	mov X,			[PX]
	mov Y,			[PY]
	call _draw_region_zoomed_at

    wait
    call _clear

	mov R6,			7						;End value
	mov R10,		[BGY]
	call _print_backgrounds

_get_small_part_three:
    call _frame_counter
    imod T1,    5
    ieq T1,     0
    jf T1,      _get_small_part_three

    mov T1,     10
    mov [RID],  T1

	mov T1,			0
	out Texture,	T1
	mov T1,			[RID]
	out Region,		T1
	mov X,			[PX]
	mov Y,			[PY]
	call _draw_region_zoomed_at

    wait
    call _clear

    mov R6,			7						;End value
    mov R10,		[BGY]
    call _print_backgrounds

ret