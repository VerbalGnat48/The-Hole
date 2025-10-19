_coin_animation:

    
    mov T1,         [CoinIDwt]
    ieq T1,         15
    jf T1,          _coin_animation_end_wt

    mov T1,         [CoinID]
    ieq T1,         109
    jt T1,          _109_to_110
    mov T1,         [CoinID]
    ieq T1,         110
    jt T1,          _110_to_111
    mov T1,         [CoinID]
    ieq T1,         111
    jt T1,         _111_to_112
    mov T1,         [CoinID]
    ieq T1,         112
    jt T1,          _112_to_109
    jmp _coin_animation_end

_coin_animation_end_wt:
    mov T1,         [CoinIDwt]
    iadd T1,        1
    mov [CoinIDwt], T1
    ret

_coin_animation_end:
    mov T1,         0
    mov [CoinIDwt], T1
    ret 

_109_to_110:

    mov T1,         110
    mov [CoinID],   T1
    jmp _coin_animation_end


_110_to_111:

    mov T1,         111
    mov [CoinID],   T1
    jmp _coin_animation_end

_111_to_112:

    mov T1,         112
    mov [CoinID],   T1
    jmp _coin_animation_end

_112_to_109:

    mov T1,         109
    mov [CoinID],   T1
    jmp _coin_animation_end