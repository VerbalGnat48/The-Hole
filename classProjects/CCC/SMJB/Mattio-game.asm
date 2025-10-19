;Something
_Mattio_msg:

; Stop title screen music 
mov T1,    0
out SPU_ChannelAssignedSound, T1
out SPU_Command, SPUCommand_StopSelectedChannel

; Play Matt voice line
mov T1,    1
out SPU_ChannelAssignedSound, T1
out SPU_Command, SPUCommand_PlaySelectedChannel

; Slow down time before game so that voice line has time to play
_Matt_voice_line_loop:
mov R7,         0xFF20BDF6  ;-808080 ;
out GPU_ClearColor, R7 ;
out GPU_Command, GPUCommand_ClearScreen
call _frame_counter
imod T1,   309
ieq T1,    0
jf T1,     _Matt_voice_line_loop


mov R7, 0xFF20BDF6;-808080 ;
out GPU_ClearColor, R7 ;
out GPU_Command, GPUCommand_ClearScreen

mov R6, -1
out GPU_SelectedTexture, R6

mov R7, __message_over

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
call _frame_counter
imod T1,    300
ieq T1,     0
jf T1,      _end_while_msg

mov T1,     0
mov [character], T1

jmp _end_title_screen


;hlt

__message_over:
string "Matt Game!"