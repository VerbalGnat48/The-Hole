; this is where i put all the stuff related to Koopa for easier reference / use
; This should be the entire process for a Koopa,
; all one needs to do is put the calls in the right places

;; Draw Koopa
_Koopa_Regions:
	;Koopa step 1
	mov T1,     	0
	out Texture, 	T1
	out Region, 	40
	mov T1,    	64
	mov T2,   	192;6
	mov X,      	79;80
	mov Y,      	223;4
	call _define_topleft

	;Koopa step 2
	mov T1, 	0
	out Texture, 	T1
	out Region, 	41
	mov T1,    	80
	mov T2,   	192;6
	mov X,      	95;6
	mov Y,      	223;4
	call _define_topleft

	;Koopa squished
	mov T1,    	0
	out Texture, 	T1
	out Region, 	42
	mov T1,    	96
	mov T2,   	192;210
	mov X,      	111;2
	mov Y,      	223;4
	call _define_topleft
	ret

;; Animate the Koopa walking
_koopa_animation:
    	mov T1,    		[KoopRIDwt]
    	ieq T1,    		60;30
    	jf T1,     		_end_Koopa_animation_wt
    	mov T1,    		[KoopRID]
    	ieq T1,    		40
    	jt T1, 	    		_fourty_to_fourtyone
    	mov T1,	    		[KoopRID]
    	ieq T1,	    		41
    	jt T1, 			_fourtyone_to_fourty
_fourty_to_fourtyone:
    	mov T1,    		41
    	mov [KoopRID],  	T1
    	jmp _end_Koopa_animation
_fourtyone_to_fourty:
    	mov T1,  		40
    	mov [KoopRID],  	T1
    	jmp _end_Koopa_animation
_end_Koopa_animation:
	mov T1,			0
	mov [KoopRIDwt],	T1
	ret
_end_Koopa_animation_wt:	
	mov T1,			[KoopRIDwt]
	iadd T1,		1
	mov [KoopRIDwt],	T1
	ret
_end_Koopa_animation_dead:
	mov T1,			42
	mov [R9],		T1
    	ret
