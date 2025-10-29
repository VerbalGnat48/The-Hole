; this is where i put all the stuff related to Goomba for easier reference / use
; This should be the entire process for a Goomba,
; all one needs to do is put the calls in the right places

;; Draw Goomba
_Goomba_Regions:
	;Goomba step 1
	mov T1,     0
	out Texture, T1
	out Region, 30
	mov T1,    0
	mov T2,   204
	mov X,      15
	mov Y,      224
	call _define_topleft

	;Goomba step 2
	mov T1, 0
	out Texture, T1
	out Region, 31
	mov T1,    16
	mov T2,   204
	mov X,      31
	mov Y,      224
	call _define_topleft


	;Goomba squished
	mov T1, 0
	out Texture, T1
	out Region, 32
	mov T1,    32
	mov T2,   204
	mov X,      48
	mov Y,      224
	call _define_topleft
	ret

;; Animate the Goomba walking
_goomba_animation:
	mov T1,			[GoomRIDwt]
	ieq T1,			10
	jf T1,			_end_Goomba_animation_wt
    	mov T1,    		[GoomRID]
    	ieq T1,    		30
    	jt T1,			_thirty_to_thirtyone
    	mov T1,			[GoomRID]
    	ieq T1,			31
    	jt T1,			_thirtyone_to_thirty
_thirty_to_thirtyone:
    	mov T1,    		31
    	mov [GoomRID],	  	T1
    	jmp _end_Goomba_animation
_thirtyone_to_thirty:
    	mov T1,    		30
    	mov [GoomRID],	  T1
    	jmp _end_Goomba_animation
_end_Goomba_animation:
	mov T1,				0
	mov [GoomRIDwt],	T1
    	ret
_end_Goomba_animation_wt:
	mov T1,				[GoomRIDwt]
	iadd T1,			1
	mov [GoomRIDwt],	T1
	ret
_end_Goomba_animation_dead:
	mov T1,			32
	mov [R9],		T1
	ret
