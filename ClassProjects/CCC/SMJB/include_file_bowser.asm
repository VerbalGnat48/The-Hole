; This is where the bowser stuff will go
; This should be the entire process for Bowser
; all one needs to do is put the calls in the right places

;; Drawing Bowser's Regions
_Bowser_Regions:
    ;Bowser step 1
    mov TMP,        0
    out Texture,    TMP
    out Region,     50
    mov TMP,        129
    mov TMP2,       192
    mov X,          158
    mov Y,          224
    mov R4,         146
    mov R5,         209
    call _define_region

    ;Bowser step 2
    mov TMP,        0
    out Texture,    TMP
    out Region,     51
    mov TMP,        161
    mov TMP2,       192
    mov X,          190
    mov Y,          224
    mov R4,         178
    mov R5,         209
    call _define_region

    ;Bowser Fireball 1
    mov TMP,        0
    out Texture,    TMP
    out Region,     52
    mov TMP,        214
    mov TMP2,       198
    mov X,          238
    mov Y,          206
    mov R4,         224
    mov R5,         202
    call _define_region

    ;Bowser Fireball 2
    mov TMP,        0
    out Texture,    TMP
    out Region,     53
    mov TMP,        214
    mov TMP2,       210
    mov X,          238
    mov Y,          218
    mov R4,         224
    mov R5,         213
    call _define_region

    ret



;; Initialize Bowser
_Bowser_initialize:

    ; Bowser inits
    mov TMP,        200
    mov [BOWSX],    TMP
    mov TMP,        265
    mov [BOWSY],    TMP

    ; Bowser Hitbox
    ; GOES HERE

    ; Bowser status
    mov TMP,        1
    mov [BOWSS],    TMP

    ; Initial Bowser ID
    mov TMP,        50
    mov [BOWSID],   TMP

    ; Initial walk flag
    mov TMP,        0
    mov [BOWSWLK],  TMP

    ; Initial attack flag, starts at zero and counts to two (~6 seconds)
    mov TMP,        0
    mov [BOWSATKF], TMP

    ; The bowser attack itself, 0 is jump, 1 is fireball. These two rotate
    mov TMP,        0
    mov [BOWSATK],  TMP

    ; Let the fireball ID start at initial 52
    mov TMP,        52
    mov [BOWSFBID], TMP

    ; Bowser starts facing left = 0
    mov TMP,        0
    mov [BOWSSIDE], TMP

    ret



; The walk flag determines if he shuffles left or right
_Bowser_walk_flag:

    ; First count one flag for attack since timer was reached
    mov TMP,        [BOWSATKF]
    iadd TMP,       1
    mov [BOWSATKF], TMP
    ; Now do the checks to get him moving in a direction
    mov TMP,        [BOWSWLK]
    ieq TMP,        0
    jt TMP,         _wlk_zero_to_one
    jf TMP,         _wlk_one_to_zero
    mov TMP,        [BOWSWLK]
    ieq TMP,        1
    jt TMP,         _wlk_one_to_zero

    _wlk_zero_to_one:
    mov TMP,        1
    mov [BOWSWLK],  TMP
    jmp _Bowser_walk_flag_end

    _wlk_one_to_zero:
    mov TMP,        0
    mov [BOWSWLK],  TMP
    jmp _Bowser_walk_flag_end

_Bowser_walk_flag_end:
    jmp _Bowser_walk_flag_ret
    ret



;; Bowser's attacks
_Bowser_attack_check:

    mov TMP,       [BOWSS]
    ieq TMP,        0
    jt TMP,         _Bowser_attack_check_end

    mov TMP,        [BOWSJMPF]
    ieq TMP,        1
    jt TMP,         _Bowser_do_jump_two

    mov TMP,        [BOWSJMPF]
    ieq TMP,        2
    jt TMP,         _Bowser_do_jump_gravity_two


    mov TMP,        [BOWSATKF]
    ige TMP,        3
    jt TMP,         _Bowser_do_attack
    jf TMP,         _Bowser_attack_check_end

    _Bowser_do_attack:
    
    ; Check for which attack to do (0 = jump / 1 = fireball)
    mov TMP,        [BOWSATK]
    ieq TMP,        0
    jt TMP,         _Bowser_do_jump_one
    jf TMP,         _Bowser_do_fireball

    _Bowser_do_jump_one:
    ; Play Bowser Jump sound
	mov TMP,	2
	out SPU_SelectedSound, TMP
	mov TMP,	2
	out SPU_SelectedChannel, TMP
	mov TMP,	2
	out SPU_ChannelAssignedSound, TMP
	out SPU_Command, SPUCommand_PlaySelectedChannel
    
    ; Set his flag so to jumping just like player
    mov TMP,          1
    mov [BOWSJMPF],   TMP

    _Bowser_do_jump_two:
    mov TMP,          [BOWSY]
    isub TMP,         8
    mov [BOWSY],      TMP
    jmp _Bowser_do_jump_gravity_one


    _Bowser_do_jump_gravity_one:
    mov TMP2,        [BOWSY]
    ile TMP2,        125
    jf TMP2,         _Bowser_attack_check_end
    jt TMP2,         _Bowser_do_jump_gravity_two
    ;jf TMP2,         _Bowser_do_jump_gravity_two


    _Bowser_do_jump_gravity_two:
    mov TMP,         2
    mov [BOWSJMPF],  TMP
    mov TMP3,        [BOWSY]
    iadd TMP3,       4
    mov [BOWSY],     TMP3
    mov TMP2,        TMP3
    ige TMP2,        265
    jf TMP2,         _Bowser_attack_check_end
    mov TMP,         265
    mov [BOWSY],     TMP

    ; Don't forget to reset the timer
    mov TMP,        0
    mov [BOWSATKF], TMP

    ; Reset jump flag for later
    mov TMP,        0
    mov [BOWSJMPF], TMP

    ; Change attack track
    mov TMP,        1
    mov [BOWSATK], TMP
    jmp _Bowser_attack_check_end

    _Bowser_do_fireball:
    ; Play Fireball sound
    ; Play Jump sound
	mov TMP,	3
	out SPU_SelectedSound, TMP
	mov TMP,	3
	out SPU_SelectedChannel, TMP
	mov TMP,	3
	out SPU_ChannelAssignedSound, TMP
	out SPU_Command, SPUCommand_PlaySelectedChannel

    ; First check the status to see if the fireball is going?
    mov TMP,        1
    mov [BOWSFBS],  TMP
    mov TMP,        [BOWSX]
    mov [BOWSFBX],  TMP
    mov TMP,        [BOWSY]
    isub TMP,       5
    mov [BOWSFBY],  TMP


;    out Texture,    0
;    mov TMP,        [BOWSFBID]
;    out Region,     TMP
;    mov X,          [BOWSFBX]
;    mov Y,          [BOWSFBY]
;    call _draw_region_zoomed_at

    ; Check to see which way Bowser is facing to have fireball only go in that direction
    mov TMP,        [BOWSSIDE]
    ieq TMP,        0
    jf TMP,         _Fireball_go_right
    jt TMP,         _Fireball_go_left

    _Fireball_go_left:
    mov TMP,        0
    mov [BOWSFBD],  TMP
    jmp _Bowser_do_fireball_end

    _Fireball_go_right:
    mov TMP,        1
    mov [BOWSFBD],  TMP
    jmp _Bowser_do_fireball_end

    _Bowser_do_fireball_end:
    ; Don't forget to reset the timer
    ;jmp _game_over
    mov TMP,        0
    mov [BOWSATKF], TMP

    ; Change attack track 
    mov TMP,        0
    mov [BOWSATK],  TMP
    jmp _Bowser_attack_check_end

_Bowser_attack_check_end:
    ret




;; Animate Bowser's feet moving
_Bowser_animation:

    mov TMP,        [BOWSS]
    ieq TMP,        0
    jt TMP,         _end_Bowser_animation
    mov TMP,        [BOWSID]
    ieq TMP,        50
    jt TMP,         _fifty_to_fiftyone
    mov TMP,        [BOWSID]
    ieq TMP,        51
    jt TMP,         _fiftyone_to_fifty

_fifty_to_fiftyone:

    mov TMP,        51
    mov [BOWSID],   TMP
    jmp _end_Bowser_animation

_fiftyone_to_fifty:

    mov TMP,        50
    mov [BOWSID],   TMP
    jmp _end_Bowser_animation

_end_Bowser_animation:
    ret



; Check to see which way Bowser should Face
_Bowser_mirror:

    mov TMP,        [BOWSS]
    ieq TMP,        0
    jt TMP,         _Bowser_mirror_end


    mov TMP,        [PX]
    mov TMP2,       [BOWSX]
    ilt TMP,        TMP2
    jt TMP,         _Bowser_mirror_end
    



_Bowser_neg_scale_X:

    push X
    push Y
    mov X,          [BOWSX]
    mov Y,          [BOWSY]
    mov X,		    2
	cif X
	isgn X													;Make X negative for mirror across Y axis
	mov Y,		    2
	cif Y
	call _set_drawing_scale
    mov TMP,        1
    mov [BOWSSIDE], TMP
    pop Y
    pop X
	ret

_Bowser_mirror_end:
    mov TMP,        0
    mov [BOWSSIDE], TMP
    ret


; Actually Draw Bowser on screen
_Bowser_draw:

    out Texture,    0
    mov TMP,        [BOWSID]
    out Region,     TMP
    mov X,          [BOWSX]
    mov Y,          [BOWSY]
    call _draw_region_zoomed_at

    ret

; Fireball animation
_Fireball_animation:

    mov TMP,        [BOWSFBS]
    ieq TMP,        1
    jf TMP,         _Fireball_animation_end

    mov TMP,        [BOWSFBID]
    ieq TMP,        52
    jt TMP,         _fiftytwo_to_fiftythree
    mov TMP,        [BOWSFBID]
    ieq TMP,        53
    jt TMP,         _fiftythree_to_fiftytwo

    _fiftytwo_to_fiftythree:

    mov TMP,        53
    mov [BOWSFBID], TMP
    jmp _Fireball_animation_end

    _fiftythree_to_fiftytwo:

    mov TMP,        52
    mov [BOWSFBID],   TMP
    jmp _Fireball_animation_end

_Fireball_animation_end:
    ret



; Check his status to do things like check hitboxes
_Bowser_status_and_hitboxes:

    mov TMP,        0
    mov [BFF],      TMP
    mov [FBF],      TMP

    _Bowser_alive_status:
    ; Is bowser alive? if so let him fight
    mov TMP,        [BOWSS]
    ieq TMP,        1
    jf TMP,         _Bowser_death_animation

    ;Move bowser left and right
    mov TMP,        [BOWSWLK]
    ieq TMP,        1
    jt TMP,         _Bowser_go_left
    jf TMP,         _Bowser_go_right

    _Bowser_go_left:
    mov TMP,        [BOWSX]
    isub TMP,       2
    mov [BOWSX],    TMP
    jmp _check_players_BFF_one

    _Bowser_go_right:
    mov TMP,        [BOWSX]
    iadd TMP,       2
    mov [BOWSX],    TMP
    jmp _check_players_BFF_one

    _check_players_BFF_one:            ; lefthand side check
    ;mov TMP,        0
    ;mov [BFF],      TMP
    ; Check to see if player made it past bowser to kill him
    mov TMP,        [PX]
    iadd TMP,       8
    mov TMP2,       [BOWSX]
    isub TMP2,      8                          ;30
    ige TMP,        TMP2
    jf TMP,         _check_players_BFF_two ;_player_kills_bowser    ;_flip_bowser
    jt TMP,         _BFF_add_lefthand     ;_Bowser_status_and_hitboxes_end

    _BFF_add_lefthand:
    mov TMP,        [BFF]
    iadd TMP,       1
    mov [BFF],      TMP
    jmp _check_players_BFF_two

    _check_players_BFF_two:         ; Righthand side check
    mov TMP,        [PX]
    isub TMP,       8
    mov TMP2,       [BOWSX]
    iadd TMP2,      8
    ile TMP,        TMP2
    jf TMP,         _check_players_BFF_three
    jt TMP,         _BFF_add_righthand

    _BFF_add_righthand:
    mov TMP,        [BFF]
    iadd TMP,       1
    mov [BFF],      TMP
    jmp _check_players_BFF_three

    _check_players_BFF_three:       ; Check if bowser is on top of player
    mov TMP,        [PY]
    isub TMP,       8
    mov TMP2,       [BOWSY]
    iadd TMP2,      8
    ile TMP,        TMP2
    jf TMP,         _check_players_BFF_four
    jt TMP,         _BFF_add_bowser_on_playhead

    _BFF_add_bowser_on_playhead:
    mov TMP,        [BFF]
    iadd TMP,       1
    mov [BFF],      TMP
    jmp _check_players_BFF_four

    _check_players_BFF_four:        ; Check if player is on top of bowser
    mov TMP,        [PY]
    iadd TMP,       8
    mov TMP2,       [BOWSY]
    isub TMP2,      8
    ige TMP,        TMP2
    jf TMP,         _check_players_BFF_results
    jt TMP,         _BFF_add_player_on_bowshead

    _BFF_add_player_on_bowshead:
    mov TMP,        [BFF]
    iadd TMP,       1
    mov [BFF],      TMP

    _check_players_BFF_results:
    mov TMP,        [BFF]
    ieq TMP,        4
    jf TMP,         _Bowser_fireball_checks
    jt TMP,         _game_over_one



    _player_kills_bowser:
    mov TMP,        0
    mov [BOWSS],    TMP
    mov TMP,        0
    mov [BOWSFBS],  TMP
    jmp _Bowser_status_and_hitboxes_end



    _Bowser_death_animation:
    mov TMP,        [BOWSY]
    iadd TMP,       5
    mov [BOWSY],    TMP



_Bowser_status_and_hitboxes_end:
    ret

_Bowser_fireball_checks:

    mov TMP,        0
    mov [BFF],      TMP
    mov [FBF],      TMP
    ; First check the statis if the fireball is active
    mov TMP,        [BOWSFBS]
    ieq TMP,        1
    jf TMP,         _Bowser_status_and_hitboxes_end

    ; Second check which side fireball flag is set to
    mov TMP,        [BOWSFBD]
    ieq TMP,        0
    jf TMP,         _Fireball_print_right
    jt TMP,         _Fireball_print_left

    _Fireball_print_left:
    mov TMP,        [BOWSFBX]
    isub TMP,       6
    mov [BOWSFBX],  TMP
    jmp _Fireball_on_screen

    _Fireball_print_right:
    mov TMP,        [BOWSFBX]
    iadd TMP,       6
    mov [BOWSFBX],  TMP
    jmp _Fireball_on_screen


_Fireball_on_screen:            ;Actually draw the fireball on screen
    out Texture,    0
    mov TMP,        [BOWSFBID]
    out Region,     TMP
    mov X,          [BOWSFBX]
    mov Y,          [BOWSFBY]
    call _draw_region_zoomed_at
    


    _Fireball_double_check:
    ; Checks for if fireball surpasses screen limit, kill fireball
    mov TMP,        [BOWSFBX]
    ilt TMP,        0
    jt TMP,         _Bowser_status_and_hitboxes_end

    mov TMP,        [BOWSFBX]
    igt TMP,        640
    jt TMP,         _Bowser_status_and_hitboxes_end
    
    ;mov TMP,        0
    ;mov [BOWSFBS],  TMP
    ;jmp _Bowser_status_and_hitboxes_end






    ; Checks for if fireball hits player
    _Fireball_no_need_to_check:
    mov TMP,        [BOWSFBS]
    ieq TMP,        0
    jt TMP,         _Bowser_status_and_hitboxes_end
    
    ; First, see which side the bolt is traveling
    mov TMP,        [BOWSFBD]
    ieq TMP,        0
    jf TMP,         _check_players_FBF_two_one

    _check_players_FBF_one_one:             ;Compare x's of player and fireball leftside
    mov TMP,        [PX]
    iadd TMP,       8
    mov TMP2,       [BOWSFBX]
    isub TMP2,      8
    ige TMP,        TMP2
    jf TMP,         _check_players_FBF_three; _Fireball_last_checks
    jt TMP,         _check_players_FBF_one_two;_FBF_add_left_x     ;_check_players_FBF_three


    _check_players_FBF_one_two:
    mov TMP,        [PX]
    isub TMP,       8
    mov TMP2,       [BOWSFBX]
    isub TMP2,      8
    ile TMP,        TMP2
    jf TMP,         _check_players_FBF_three
    jt TMP,         _FBF_add_left_x


    _check_players_FBF_two_one:             ;Compare x's of player and fireball rightside
    mov TMP,        [PX]
    isub TMP,       8
    mov TMP2,       [BOWSFBX]
    iadd TMP2,      8
    ile TMP,        TMP2
    jf TMP,         _check_players_FBF_three        ;_Fireball_last_checks
    jt TMP,         _check_players_FBF_two_two      ;_FBF_add_right_x

    _check_players_FBF_two_two:
    mov TMP,        [PX]
    iadd TMP,       8
    mov TMP2,       [BOWSFBX]
    iadd TMP2,      8
    ige TMP,        TMP2
    jf TMP,         _check_players_BFF_three
    jt TMP,         _FBF_add_right_x

    _FBF_add_left_x:
    mov TMP,        [FBF]
    iadd TMP,       1
    mov [FBF],      TMP
    jmp _check_players_FBF_three

    _FBF_add_right_x:
    mov TMP,        [FBF]
    iadd TMP,       1
    mov [FBF],      TMP
    jmp _check_players_FBF_three

    _check_players_FBF_three:       ;Compare y's of player and fireball
    mov TMP,        [PY]
    iadd TMP,       4
    mov TMP2,       [BOWSFBY]
    ige TMP,        TMP2
    jf TMP,         _Bowser_status_and_hitboxes_end;_Fireball_last_checks
    jt TMP,         _FBF_add_y

    _FBF_add_y:
    mov TMP,        [FBF]
    iadd TMP,       1
    mov [FBF],      TMP
    jmp _check_players_FBF_results

    _check_players_FBF_results:
    mov TMP,        [FBF]
    ieq TMP,        2
    jt TMP,         _game_over_one                  ;_double_check_FBF_results;_game_over
    jf TMP,         _Bowser_status_and_hitboxes_end

    ;_double_check_FBF_results:
    ;mov TMP,        [BOWSFBS]
    ;ieq TMP,        0
    ;jf TMP,         _game_over







