;something
_Joeigi_msg:

;Stop title screen music
mov T1,    0
out SPU_ChannelAssignedSound, T1
out SPU_Command, SPUCommand_StopSelectedChannel

; Play Joe voice line
mov T1,    2
out SPU_ChannelAssignedSound, T1
out SPU_Command, SPUCommand_PlaySelectedChannel

; Slow down time before game so that voice line has time to play
_Joe_voice_line_loop:
mov R7, 0xFF949439      ;-808080 ;
out GPU_ClearColor, R7 ;
out GPU_Command, GPUCommand_ClearScreen
call _frame_counter
imod T1,   369
ieq T1,    0
jf T1,     _Joe_voice_line_loop



mov R7, 0xFF949439;-808080 ;
out GPU_ClearColor, R7 ;
out GPU_Command, GPUCommand_ClearScreen

mov R6, -1
out GPU_SelectedTexture, R6

mov R7, __message_game_is_over

; first symbol
mov R9, [R7]
out GPU_SelectedRegion, R9

mov R2, 320
out GPU_DrawingPointX, R2
mov R3, 180
out GPU_DrawingPointY, R3
out GPU_Command, GPUCommand_DrawRegion

_whilst_msg:
iadd R2, 12
iadd R7, 1

mov R9, [R7]

mov R4, R9
ieq R4, 0
jt R4, _end_whilst_msg

out GPU_DrawingPointX, R2
out GPU_DrawingPointY, R3
out GPU_SelectedRegion, R9
out GPU_Command, GPUCommand_DrawRegion

jmp _whilst_msg

_end_whilst_msg:
call _frame_counter
imod T1,    300
ieq T1,     0
jf T1,      _end_whilst_msg

mov T1,     1
mov [character], T1

jmp _end_title_screen


;hlt

__message_game_is_over:
string "Joe Game!"