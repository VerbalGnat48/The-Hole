; program start section
  call __global_scope_initialization
  call __function_main
  hlt

; location of global variables
  %define global_malloc_start_address 0
  %define global_malloc_end_address 1
  %define global_malloc_first_block 2

__global_scope_initialization:
  push BP
  mov BP, SP
  mov R0, 1048576
  mov [global_malloc_start_address], R0
  mov R0, 3145727
  mov [global_malloc_end_address], R0
  mov R0, -1
  mov [global_malloc_first_block], R0
  mov SP, BP
  pop BP
  ret

__function_make_gray:
  push BP
  mov BP, SP
  push R1
  mov R0, [BP+2]
  shl R0, 16
  or R0, -16777216
  mov R1, [BP+2]
  shl R1, 8
  or R0, R1
  mov R1, [BP+2]
  or R0, R1
__function_make_gray_return:
  pop R1
  mov SP, BP
  pop BP
  ret

__function_make_color_rgb:
  push BP
  mov BP, SP
  push R1
  mov R0, [BP+4]
  shl R0, 16
  or R0, -16777216
  mov R1, [BP+3]
  shl R1, 8
  or R0, R1
  mov R1, [BP+2]
  or R0, R1
__function_make_color_rgb_return:
  pop R1
  mov SP, BP
  pop BP
  ret

__function_make_color_rgba:
  push BP
  mov BP, SP
  push R1
  mov R0, [BP+5]
  shl R0, 24
  mov R1, [BP+4]
  shl R1, 16
  or R0, R1
  mov R1, [BP+3]
  shl R1, 8
  or R0, R1
  mov R1, [BP+2]
  or R0, R1
__function_make_color_rgba_return:
  pop R1
  mov SP, BP
  pop BP
  ret

__function_get_color_red:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  and R0, 255
__function_get_color_red_return:
  mov SP, BP
  pop BP
  ret

__function_get_color_green:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  shl R0, -8
  and R0, 255
__function_get_color_green_return:
  mov SP, BP
  pop BP
  ret

__function_get_color_blue:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  shl R0, -16
  and R0, 255
__function_get_color_blue_return:
  mov SP, BP
  pop BP
  ret

__function_get_color_alpha:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  shl R0, -24
  and R0, 255
__function_get_color_alpha_return:
  mov SP, BP
  pop BP
  ret

__function_select_texture:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out GPU_SelectedTexture, R0
__function_select_texture_return:
  mov SP, BP
  pop BP
  ret

__function_get_selected_texture:
  push BP
  mov BP, SP
  in R0, GPU_SelectedTexture
__function_get_selected_texture_return:
  mov SP, BP
  pop BP
  ret

__function_select_region:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out GPU_SelectedRegion, R0
__function_select_region_return:
  mov SP, BP
  pop BP
  ret

__function_get_selected_region:
  push BP
  mov BP, SP
  in R0, GPU_SelectedRegion
__function_get_selected_region_return:
  mov SP, BP
  pop BP
  ret

__function_define_region:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out GPU_RegionMinX, R0
  mov R0, [BP+3]
  out GPU_RegionMinY, R0
  mov R0, [BP+4]
  out GPU_RegionMaxX, R0
  mov R0, [BP+5]
  out GPU_RegionMaxY, R0
  mov R0, [BP+6]
  out GPU_RegionHotSpotX, R0
  mov R0, [BP+7]
  out GPU_RegionHotSpotY, R0
__function_define_region_return:
  mov SP, BP
  pop BP
  ret

__function_define_region_topleft:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out GPU_RegionMinX, R0
  out GPU_RegionHotSpotX, R0
  mov R0, [BP+3]
  out GPU_RegionMinY, R0
  out GPU_RegionHotSpotY, R0
  mov R0, [BP+4]
  out GPU_RegionMaxX, R0
  mov R0, [BP+5]
  out GPU_RegionMaxY, R0
__function_define_region_topleft_return:
  mov SP, BP
  pop BP
  ret

__function_define_region_center:
  push BP
  mov BP, SP
  isub SP, 2
  mov R0, [BP+2]
  mov R1, [BP+4]
  iadd R0, R1
  idiv R0, 2
  mov [BP-1], R0
  mov R0, [BP+3]
  mov R1, [BP+5]
  iadd R0, R1
  idiv R0, 2
  mov [BP-2], R0
  mov R0, [BP+2]
  out GPU_RegionMinX, R0
  mov R0, [BP+3]
  out GPU_RegionMinY, R0
  mov R0, [BP+4]
  out GPU_RegionMaxX, R0
  mov R0, [BP+5]
  out GPU_RegionMaxY, R0
  mov R0, [BP-1]
  out GPU_RegionHotSpotX, R0
  mov R0, [BP-2]
  out GPU_RegionHotSpotY, R0
__function_define_region_center_return:
  mov SP, BP
  pop BP
  ret

__function_define_region_matrix:
  push BP
  mov BP, SP
  isub SP, 17
  mov R0, [BP+2]
  mov [BP-1], R0
  mov R0, [BP+3]
  mov [BP-2], R0
  mov R0, [BP+4]
  mov [BP-3], R0
  mov R0, [BP+5]
  mov [BP-4], R0
  mov R0, [BP+6]
  mov [BP-5], R0
  mov R0, [BP+7]
  mov [BP-6], R0
  mov R0, [BP+8]
  mov [BP-7], R0
  mov R0, [BP-4]
  mov R1, [BP-2]
  isub R0, R1
  iadd R0, 1
  mov R1, [BP+11]
  iadd R0, R1
  mov [BP-8], R0
  mov R0, [BP-5]
  mov R1, [BP-3]
  isub R0, R1
  iadd R0, 1
  mov R1, [BP+11]
  iadd R0, R1
  mov [BP-9], R0
  mov R0, 0
  mov [BP-10], R0
__for_206_start:
  mov R0, [BP-10]
  mov R1, [BP+10]
  ilt R0, R1
  jf R0, __for_206_end
  mov R0, 0
  mov [BP-11], R0
__for_216_start:
  mov R0, [BP-11]
  mov R1, [BP+9]
  ilt R0, R1
  jf R0, __for_216_end
  mov R1, [BP-1]
  mov [SP], R1
  call __function_select_region
  mov R1, [BP-2]
  mov [SP], R1
  mov R1, [BP-3]
  mov [SP+1], R1
  mov R1, [BP-4]
  mov [SP+2], R1
  mov R1, [BP-5]
  mov [SP+3], R1
  mov R1, [BP-6]
  mov [SP+4], R1
  mov R1, [BP-7]
  mov [SP+5], R1
  call __function_define_region
  mov R0, [BP-1]
  mov R1, R0
  iadd R1, 1
  mov [BP-1], R1
  mov R0, [BP-2]
  mov R1, [BP-8]
  iadd R0, R1
  mov [BP-2], R0
  mov R0, [BP-4]
  mov R1, [BP-8]
  iadd R0, R1
  mov [BP-4], R0
  mov R0, [BP-6]
  mov R1, [BP-8]
  iadd R0, R1
  mov [BP-6], R0
__for_216_continue:
  mov R0, [BP-11]
  iadd R0, 1
  mov [BP-11], R0
  jmp __for_216_start
__for_216_end:
  mov R0, [BP-3]
  mov R1, [BP-9]
  iadd R0, R1
  mov [BP-3], R0
  mov R0, [BP-5]
  mov R1, [BP-9]
  iadd R0, R1
  mov [BP-5], R0
  mov R0, [BP-7]
  mov R1, [BP-9]
  iadd R0, R1
  mov [BP-7], R0
  mov R0, [BP+3]
  mov [BP-2], R0
  mov R0, [BP+5]
  mov [BP-4], R0
  mov R0, [BP+7]
  mov [BP-6], R0
__for_206_continue:
  mov R0, [BP-10]
  iadd R0, 1
  mov [BP-10], R0
  jmp __for_206_start
__for_206_end:
__function_define_region_matrix_return:
  mov SP, BP
  pop BP
  ret

__function_set_region_hotspot:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out GPU_RegionHotSpotX, R0
  mov R0, [BP+3]
  out GPU_RegionHotSpotY, R0
__function_set_region_hotspot_return:
  mov SP, BP
  pop BP
  ret

__function_set_multiply_color:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out GPU_MultiplyColor, R0
__function_set_multiply_color_return:
  mov SP, BP
  pop BP
  ret

__function_set_drawing_point:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out GPU_DrawingPointX, R0
  mov R0, [BP+3]
  out GPU_DrawingPointY, R0
__function_set_drawing_point_return:
  mov SP, BP
  pop BP
  ret

__function_set_drawing_scale:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out GPU_DrawingScaleX, R0
  mov R0, [BP+3]
  out GPU_DrawingScaleY, R0
__function_set_drawing_scale_return:
  mov SP, BP
  pop BP
  ret

__function_set_drawing_angle:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out GPU_DrawingAngle, R0
__function_set_drawing_angle_return:
  mov SP, BP
  pop BP
  ret

__function_set_blending_mode:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out GPU_ActiveBlending, R0
__function_set_blending_mode_return:
  mov SP, BP
  pop BP
  ret

__function_get_multiply_color:
  push BP
  mov BP, SP
  in R0, GPU_MultiplyColor
__function_get_multiply_color_return:
  mov SP, BP
  pop BP
  ret

__function_get_drawing_point:
  push BP
  mov BP, SP
  push R1
  in R0, GPU_DrawingPointX
  mov R1, [BP+2]
  mov [R1], R0
  in R0, GPU_DrawingPointY
  mov R1, [BP+3]
  mov [R1], R0
__function_get_drawing_point_return:
  mov SP, BP
  pop BP
  ret

__function_get_drawing_scale:
  push BP
  mov BP, SP
  push R1
  in R0, GPU_DrawingScaleX
  mov R1, [BP+2]
  mov [R1], R0
  in R0, GPU_DrawingScaleY
  mov R1, [BP+3]
  mov [R1], R0
__function_get_drawing_scale_return:
  mov SP, BP
  pop BP
  ret

__function_get_drawing_angle:
  push BP
  mov BP, SP
  in R0, GPU_DrawingAngle
__function_get_drawing_angle_return:
  mov SP, BP
  pop BP
  ret

__function_get_blending_mode:
  push BP
  mov BP, SP
  in R0, GPU_ActiveBlending
__function_get_blending_mode_return:
  mov SP, BP
  pop BP
  ret

__function_clear_screen:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out GPU_ClearColor, R0
  out GPU_Command, GPUCommand_ClearScreen
__function_clear_screen_return:
  mov SP, BP
  pop BP
  ret

__function_draw_region:
  push BP
  mov BP, SP
  out GPU_Command, GPUCommand_DrawRegion
__function_draw_region_return:
  mov SP, BP
  pop BP
  ret

__function_draw_region_at:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out GPU_DrawingPointX, R0
  mov R0, [BP+3]
  out GPU_DrawingPointY, R0
  out GPU_Command, GPUCommand_DrawRegion
__function_draw_region_at_return:
  mov SP, BP
  pop BP
  ret

__function_draw_region_zoomed:
  push BP
  mov BP, SP
  out GPU_Command, GPUCommand_DrawRegionZoomed
__function_draw_region_zoomed_return:
  mov SP, BP
  pop BP
  ret

__function_draw_region_zoomed_at:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out GPU_DrawingPointX, R0
  mov R0, [BP+3]
  out GPU_DrawingPointY, R0
  out GPU_Command, GPUCommand_DrawRegionZoomed
__function_draw_region_zoomed_at_return:
  mov SP, BP
  pop BP
  ret

__function_draw_region_rotated:
  push BP
  mov BP, SP
  out GPU_Command, GPUCommand_DrawRegionRotated
__function_draw_region_rotated_return:
  mov SP, BP
  pop BP
  ret

__function_draw_region_rotated_at:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out GPU_DrawingPointX, R0
  mov R0, [BP+3]
  out GPU_DrawingPointY, R0
  out GPU_Command, GPUCommand_DrawRegionRotated
__function_draw_region_rotated_at_return:
  mov SP, BP
  pop BP
  ret

__function_draw_region_rotozoomed:
  push BP
  mov BP, SP
  out GPU_Command, GPUCommand_DrawRegionRotozoomed
__function_draw_region_rotozoomed_return:
  mov SP, BP
  pop BP
  ret

__function_draw_region_rotozoomed_at:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out GPU_DrawingPointX, R0
  mov R0, [BP+3]
  out GPU_DrawingPointY, R0
  out GPU_Command, GPUCommand_DrawRegionRotozoomed
__function_draw_region_rotozoomed_at_return:
  mov SP, BP
  pop BP
  ret

__function_print_at:
  push BP
  mov BP, SP
  isub SP, 4
  call __function_get_selected_texture
  mov [BP-1], R0
  mov R1, -1
  mov [SP], R1
  call __function_select_texture
  mov R0, [BP+2]
  mov [BP-2], R0
__while_361_start:
__while_361_continue:
  mov R0, [BP+4]
  mov R0, [R0]
  cib R0
  jf R0, __while_361_end
  mov R1, [BP+4]
  mov R1, [R1]
  mov [SP], R1
  call __function_select_region
  mov R1, [BP+2]
  mov [SP], R1
  mov R1, [BP+3]
  mov [SP+1], R1
  call __function_draw_region_at
  mov R0, [BP+2]
  iadd R0, 10
  mov [BP+2], R0
__if_374_start:
  mov R0, [BP+4]
  mov R0, [R0]
  ieq R0, 10
  jf R0, __if_374_end
  mov R0, [BP-2]
  mov [BP+2], R0
  mov R0, [BP+3]
  iadd R0, 20
  mov [BP+3], R0
__if_374_end:
  mov R0, [BP+4]
  iadd R0, 1
  mov [BP+4], R0
  jmp __while_361_start
__while_361_end:
  mov R1, [BP-1]
  mov [SP], R1
  call __function_select_texture
__function_print_at_return:
  mov SP, BP
  pop BP
  ret

__function_print:
  push BP
  mov BP, SP
  isub SP, 5
  lea R1, [BP-1]
  mov [SP], R1
  lea R1, [BP-2]
  mov [SP+1], R1
  call __function_get_drawing_point
  mov R1, [BP-1]
  mov [SP], R1
  mov R1, [BP-2]
  mov [SP+1], R1
  mov R1, [BP+2]
  mov [SP+2], R1
  call __function_print_at
__function_print_return:
  mov SP, BP
  pop BP
  ret

__function_select_sound:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_SelectedSound, R0
__function_select_sound_return:
  mov SP, BP
  pop BP
  ret

__function_get_selected_sound:
  push BP
  mov BP, SP
  in R0, SPU_SelectedSound
__function_get_selected_sound_return:
  mov SP, BP
  pop BP
  ret

__function_select_channel:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_SelectedChannel, R0
__function_select_channel_return:
  mov SP, BP
  pop BP
  ret

__function_get_selected_channel:
  push BP
  mov BP, SP
  in R0, SPU_SelectedChannel
__function_get_selected_channel_return:
  mov SP, BP
  pop BP
  ret

__function_set_sound_loop:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_SoundPlayWithLoop, R0
__function_set_sound_loop_return:
  mov SP, BP
  pop BP
  ret

__function_set_sound_loop_start:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_SoundLoopStart, R0
__function_set_sound_loop_start_return:
  mov SP, BP
  pop BP
  ret

__function_set_sound_loop_end:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_SoundLoopEnd, R0
__function_set_sound_loop_end_return:
  mov SP, BP
  pop BP
  ret

__function_set_channel_volume:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_ChannelVolume, R0
__function_set_channel_volume_return:
  mov SP, BP
  pop BP
  ret

__function_set_channel_speed:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_ChannelSpeed, R0
__function_set_channel_speed_return:
  mov SP, BP
  pop BP
  ret

__function_set_channel_position:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_ChannelPosition, R0
__function_set_channel_position_return:
  mov SP, BP
  pop BP
  ret

__function_set_channel_loop:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_ChannelLoopEnabled, R0
__function_set_channel_loop_return:
  mov SP, BP
  pop BP
  ret

__function_assign_channel_sound:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_SelectedChannel, R0
  mov R0, [BP+3]
  out SPU_ChannelAssignedSound, R0
__function_assign_channel_sound_return:
  mov SP, BP
  pop BP
  ret

__function_get_channel_speed:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_SelectedChannel, R0
  in R0, SPU_ChannelSpeed
__function_get_channel_speed_return:
  mov SP, BP
  pop BP
  ret

__function_get_channel_position:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_SelectedChannel, R0
  in R0, SPU_ChannelPosition
__function_get_channel_position_return:
  mov SP, BP
  pop BP
  ret

__function_get_channel_state:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_SelectedChannel, R0
  in R0, SPU_ChannelState
__function_get_channel_state_return:
  mov SP, BP
  pop BP
  ret

__function_set_global_volume:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_GlobalVolume, R0
__function_set_global_volume_return:
  mov SP, BP
  pop BP
  ret

__function_get_global_volume:
  push BP
  mov BP, SP
  in R0, SPU_GlobalVolume
__function_get_global_volume_return:
  mov SP, BP
  pop BP
  ret

__function_play_channel:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_SelectedChannel, R0
  out SPU_Command, SPUCommand_PlaySelectedChannel
__function_play_channel_return:
  mov SP, BP
  pop BP
  ret

__function_pause_channel:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_SelectedChannel, R0
  out SPU_Command, SPUCommand_PauseSelectedChannel
__function_pause_channel_return:
  mov SP, BP
  pop BP
  ret

__function_stop_channel:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out SPU_SelectedChannel, R0
  out SPU_Command, SPUCommand_StopSelectedChannel
__function_stop_channel_return:
  mov SP, BP
  pop BP
  ret

__function_pause_all_channels:
  push BP
  mov BP, SP
  out SPU_Command, SPUCommand_PauseAllChannels
__function_pause_all_channels_return:
  mov SP, BP
  pop BP
  ret

__function_stop_all_channels:
  push BP
  mov BP, SP
  out SPU_Command, SPUCommand_StopAllChannels
__function_stop_all_channels_return:
  mov SP, BP
  pop BP
  ret

__function_resume_all_channels:
  push BP
  mov BP, SP
  out SPU_Command, SPUCommand_ResumeAllChannels
__function_resume_all_channels_return:
  mov SP, BP
  pop BP
  ret

__function_play_sound_in_channel:
  push BP
  mov BP, SP
  mov R0, [BP+3]
  out SPU_SelectedChannel, R0
  mov R0, [BP+2]
  out SPU_ChannelAssignedSound, R0
  out SPU_Command, SPUCommand_PlaySelectedChannel
__function_play_sound_in_channel_return:
  mov SP, BP
  pop BP
  ret

__function_play_sound:
  push BP
  mov BP, SP
  push R1
  mov R0, 0
__play_sound_begin_loop:
  out SPU_SelectedChannel, R0
  in R1, SPU_ChannelState
  ieq R1, 0x40
  jt R1, __play_sound_channel_found
  iadd R0, 1
  mov R1, R0
  ige R1, 16
  jf R1, __play_sound_begin_loop
  mov R0, -1
  jmp __play_sound_exit
__play_sound_channel_found:
  mov R1, [BP+2]
  out SPU_ChannelAssignedSound, R1
  out SPU_Command, SPUCommand_PlaySelectedChannel
__play_sound_exit:
  pop R1
__function_play_sound_return:
  mov SP, BP
  pop BP
  ret

__function_select_gamepad:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out INP_SelectedGamepad, R0
__function_select_gamepad_return:
  mov SP, BP
  pop BP
  ret

__function_get_selected_gamepad:
  push BP
  mov BP, SP
  in R0, INP_SelectedGamepad
__function_get_selected_gamepad_return:
  mov SP, BP
  pop BP
  ret

__function_gamepad_is_connected:
  push BP
  mov BP, SP
  in R0, INP_GamepadConnected
__function_gamepad_is_connected_return:
  mov SP, BP
  pop BP
  ret

__function_gamepad_left:
  push BP
  mov BP, SP
  in R0, INP_GamepadLeft
__function_gamepad_left_return:
  mov SP, BP
  pop BP
  ret

__function_gamepad_right:
  push BP
  mov BP, SP
  in R0, INP_GamepadRight
__function_gamepad_right_return:
  mov SP, BP
  pop BP
  ret

__function_gamepad_up:
  push BP
  mov BP, SP
  in R0, INP_GamepadUp
__function_gamepad_up_return:
  mov SP, BP
  pop BP
  ret

__function_gamepad_down:
  push BP
  mov BP, SP
  in R0, INP_GamepadDown
__function_gamepad_down_return:
  mov SP, BP
  pop BP
  ret

__function_gamepad_direction:
  push BP
  mov BP, SP
__if_515_start:
  call __function_gamepad_left
  mov R1, R0
  igt R1, 0
  mov R0, R1
  jf R0, __if_515_else
  mov R0, -1
  lea R1, [BP+2]
  mov R1, [R1]
  mov [R1], R0
  jmp __if_515_end
__if_515_else:
__if_524_start:
  call __function_gamepad_right
  mov R1, R0
  igt R1, 0
  mov R0, R1
  jf R0, __if_524_else
  mov R0, 1
  lea R1, [BP+2]
  mov R1, [R1]
  mov [R1], R0
  jmp __if_524_end
__if_524_else:
  mov R0, 0
  lea R1, [BP+2]
  mov R1, [R1]
  mov [R1], R0
__if_524_end:
__if_515_end:
__if_536_start:
  call __function_gamepad_up
  mov R1, R0
  igt R1, 0
  mov R0, R1
  jf R0, __if_536_else
  mov R0, -1
  lea R1, [BP+3]
  mov R1, [R1]
  mov [R1], R0
  jmp __if_536_end
__if_536_else:
__if_545_start:
  call __function_gamepad_down
  mov R1, R0
  igt R1, 0
  mov R0, R1
  jf R0, __if_545_else
  mov R0, 1
  lea R1, [BP+3]
  mov R1, [R1]
  mov [R1], R0
  jmp __if_545_end
__if_545_else:
  mov R0, 0
  lea R1, [BP+3]
  mov R1, [R1]
  mov [R1], R0
__if_545_end:
__if_536_end:
__function_gamepad_direction_return:
  mov SP, BP
  pop BP
  ret

__function_gamepad_direction_normalized:
  push BP
  mov BP, SP
__if_560_start:
  call __function_gamepad_left
  mov R1, R0
  igt R1, 0
  mov R0, R1
  jf R0, __if_560_else
  mov R0, -1.000000
  lea R1, [BP+2]
  mov R1, [R1]
  mov [R1], R0
  jmp __if_560_end
__if_560_else:
__if_569_start:
  call __function_gamepad_right
  mov R1, R0
  igt R1, 0
  mov R0, R1
  jf R0, __if_569_else
  mov R0, 1.000000
  lea R1, [BP+2]
  mov R1, [R1]
  mov [R1], R0
  jmp __if_569_end
__if_569_else:
  mov R0, 0.000000
  lea R1, [BP+2]
  mov R1, [R1]
  mov [R1], R0
__if_569_end:
__if_560_end:
__if_581_start:
  call __function_gamepad_up
  mov R1, R0
  igt R1, 0
  mov R0, R1
  jf R0, __if_581_else
  mov R0, -1.000000
  lea R1, [BP+3]
  mov R1, [R1]
  mov [R1], R0
  jmp __if_581_end
__if_581_else:
__if_590_start:
  call __function_gamepad_down
  mov R1, R0
  igt R1, 0
  mov R0, R1
  jf R0, __if_590_else
  mov R0, 1.000000
  lea R1, [BP+3]
  mov R1, [R1]
  mov [R1], R0
  jmp __if_590_end
__if_590_else:
  mov R0, 0.000000
  lea R1, [BP+3]
  mov R1, [R1]
  mov [R1], R0
__if_590_end:
__if_581_end:
__if_602_start:
  mov R0, [BP+2]
  mov R0, [R0]
  cfb R0
  jf R0, __LogicalAnd_ShortCircuit_605
  mov R1, [BP+3]
  mov R1, [R1]
  cfb R1
  and R0, R1
__LogicalAnd_ShortCircuit_605:
  jf R0, __if_602_end
  mov R0, [BP+2]
  mov R0, [R0]
  fmul R0, 0.707107
  lea R1, [BP+2]
  mov R1, [R1]
  mov [R1], R0
  mov R0, [BP+3]
  mov R0, [R0]
  fmul R0, 0.707107
  lea R1, [BP+3]
  mov R1, [R1]
  mov [R1], R0
__if_602_end:
__function_gamepad_direction_normalized_return:
  mov SP, BP
  pop BP
  ret

__function_gamepad_button_a:
  push BP
  mov BP, SP
  in R0, INP_GamepadButtonA
__function_gamepad_button_a_return:
  mov SP, BP
  pop BP
  ret

__function_gamepad_button_b:
  push BP
  mov BP, SP
  in R0, INP_GamepadButtonB
__function_gamepad_button_b_return:
  mov SP, BP
  pop BP
  ret

__function_gamepad_button_x:
  push BP
  mov BP, SP
  in R0, INP_GamepadButtonX
__function_gamepad_button_x_return:
  mov SP, BP
  pop BP
  ret

__function_gamepad_button_y:
  push BP
  mov BP, SP
  in R0, INP_GamepadButtonY
__function_gamepad_button_y_return:
  mov SP, BP
  pop BP
  ret

__function_gamepad_button_l:
  push BP
  mov BP, SP
  in R0, INP_GamepadButtonL
__function_gamepad_button_l_return:
  mov SP, BP
  pop BP
  ret

__function_gamepad_button_r:
  push BP
  mov BP, SP
  in R0, INP_GamepadButtonR
__function_gamepad_button_r_return:
  mov SP, BP
  pop BP
  ret

__function_gamepad_button_start:
  push BP
  mov BP, SP
  in R0, INP_GamepadButtonStart
__function_gamepad_button_start_return:
  mov SP, BP
  pop BP
  ret

__function_get_cycle_counter:
  push BP
  mov BP, SP
  in R0, TIM_CycleCounter
__function_get_cycle_counter_return:
  mov SP, BP
  pop BP
  ret

__function_get_frame_counter:
  push BP
  mov BP, SP
  in R0, TIM_FrameCounter
__function_get_frame_counter_return:
  mov SP, BP
  pop BP
  ret

__function_get_date:
  push BP
  mov BP, SP
  in R0, TIM_CurrentDate
__function_get_date_return:
  mov SP, BP
  pop BP
  ret

__function_get_time:
  push BP
  mov BP, SP
  in R0, TIM_CurrentTime
__function_get_time_return:
  mov SP, BP
  pop BP
  ret

__function_translate_date:
  push BP
  mov BP, SP
  isub SP, 15
  mov R0, [BP+2]
  shl R0, -16
  mov R1, [BP+3]
  mov [R1], R0
  mov R0, [BP+2]
  and R0, 65535
  mov [BP-1], R0
  mov R0, 31
  mov [BP-13], R0
  mov R0, 28
  mov [BP-12], R0
  mov R0, 31
  mov [BP-11], R0
  mov R0, 30
  mov [BP-10], R0
  mov R0, 31
  mov [BP-9], R0
  mov R0, 30
  mov [BP-8], R0
  mov R0, 31
  mov [BP-7], R0
  mov R0, 31
  mov [BP-6], R0
  mov R0, 30
  mov [BP-5], R0
  mov R0, 31
  mov [BP-4], R0
  mov R0, 30
  mov [BP-3], R0
  mov R0, 31
  mov [BP-2], R0
  mov R1, [BP+3]
  mov R0, [R1]
  imod R0, 4
  ieq R0, 0
  jf R0, __LogicalAnd_ShortCircuit_686
  mov R2, [BP+3]
  mov R1, [R2]
  imod R1, 100
  ine R1, 0
  and R0, R1
__LogicalAnd_ShortCircuit_686:
  mov [BP-14], R0
__if_695_start:
  mov R0, [BP-14]
  jf R0, __if_695_end
  mov R0, 29
  mov [BP-12], R0
__if_695_end:
  mov R0, 1
  mov R1, [BP+3]
  iadd R1, 1
  mov [R1], R0
  mov R0, 0
  mov [BP-15], R0
__for_706_start:
  mov R0, [BP-15]
  ilt R0, 11
  jf R0, __for_706_end
__if_716_start:
  mov R0, [BP-1]
  lea R1, [BP-13]
  mov R2, [BP-15]
  iadd R1, R2
  mov R1, [R1]
  ilt R0, R1
  jf R0, __if_716_end
  mov R0, [BP-1]
  iadd R0, 1
  mov R1, [BP+3]
  iadd R1, 2
  mov [R1], R0
  jmp __function_translate_date_return
__if_716_end:
  mov R0, [BP-1]
  lea R1, [BP-13]
  mov R2, [BP-15]
  iadd R1, R2
  mov R1, [R1]
  isub R0, R1
  mov [BP-1], R0
  mov R2, [BP+3]
  iadd R2, 1
  mov R0, [R2]
  mov R1, R0
  iadd R1, 1
  mov [R2], R1
__for_706_continue:
  mov R0, [BP-15]
  iadd R0, 1
  mov [BP-15], R0
  jmp __for_706_start
__for_706_end:
  mov R0, 12
  mov R1, [BP+3]
  iadd R1, 1
  mov [R1], R0
  mov R0, [BP-1]
  iadd R0, 1
  mov R1, [BP+3]
  iadd R1, 2
  mov [R1], R0
__function_translate_date_return:
  mov SP, BP
  pop BP
  ret

__function_translate_time:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  idiv R0, 3600
  mov R1, [BP+3]
  mov [R1], R0
  mov R0, [BP+2]
  imod R0, 3600
  idiv R0, 60
  mov R1, [BP+3]
  iadd R1, 1
  mov [R1], R0
  mov R0, [BP+2]
  imod R0, 60
  mov R1, [BP+3]
  iadd R1, 2
  mov [R1], R0
__function_translate_time_return:
  mov SP, BP
  pop BP
  ret

__function_end_frame:
  push BP
  mov BP, SP
  wait
__function_end_frame_return:
  mov SP, BP
  pop BP
  ret

__function_sleep:
  push BP
  mov BP, SP
  isub SP, 2
  call __function_get_frame_counter
  mov [BP-1], R0
  mov R0, [BP-1]
  mov R1, [BP+2]
  iadd R0, R1
  mov [BP-2], R0
__while_791_start:
__while_791_continue:
  call __function_get_frame_counter
  mov R1, R0
  mov R2, [BP-2]
  ilt R1, R2
  mov R0, R1
  jf R0, __while_791_end
  call __function_end_frame
  jmp __while_791_start
__while_791_end:
__function_sleep_return:
  mov SP, BP
  pop BP
  ret

__function_fmod:
  push BP
  mov BP, SP
  push R1
  mov R0, [BP+2]
  mov R1, [BP+3]
  fmod R0, R1
  pop R1
__function_fmod_return:
  mov SP, BP
  pop BP
  ret

__function_min:
  push BP
  mov BP, SP
  push R1
  mov R0, [BP+2]
  mov R1, [BP+3]
  imin R0, R1
  pop R1
__function_min_return:
  mov SP, BP
  pop BP
  ret

__function_max:
  push BP
  mov BP, SP
  push R1
  mov R0, [BP+2]
  mov R1, [BP+3]
  imax R0, R1
  pop R1
__function_max_return:
  mov SP, BP
  pop BP
  ret

__function_abs:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  iabs R0
__function_abs_return:
  mov SP, BP
  pop BP
  ret

__function_fmin:
  push BP
  mov BP, SP
  push R1
  mov R0, [BP+2]
  mov R1, [BP+3]
  fmin R0, R1
  pop R1
__function_fmin_return:
  mov SP, BP
  pop BP
  ret

__function_fmax:
  push BP
  mov BP, SP
  push R1
  mov R0, [BP+2]
  mov R1, [BP+3]
  fmax R0, R1
  pop R1
__function_fmax_return:
  mov SP, BP
  pop BP
  ret

__function_fabs:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  fabs R0
__function_fabs_return:
  mov SP, BP
  pop BP
  ret

__function_floor:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  flr R0
__function_floor_return:
  mov SP, BP
  pop BP
  ret

__function_ceil:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  ceil R0
__function_ceil_return:
  mov SP, BP
  pop BP
  ret

__function_round:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  round R0
__function_round_return:
  mov SP, BP
  pop BP
  ret

__function_sin:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  sin R0
__function_sin_return:
  mov SP, BP
  pop BP
  ret

__function_cos:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  fadd R0, 1.570796
  sin R0
__function_cos_return:
  mov SP, BP
  pop BP
  ret

__function_tan:
  push BP
  mov BP, SP
  push R1
  mov R1, [BP+2]
  mov R0, R1
  sin R0
  fadd R1, 1.570796
  sin R1
  fdiv R0, R1
  pop R1
__function_tan_return:
  mov SP, BP
  pop BP
  ret

__function_asin:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  acos R0
  fsgn R0
  fadd R0, 1.570796
__function_asin_return:
  mov SP, BP
  pop BP
  ret

__function_acos:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  acos R0
__function_acos_return:
  mov SP, BP
  pop BP
  ret

__function_atan2:
  push BP
  mov BP, SP
  push R1
  mov R0, [BP+2]
  mov R1, [BP+3]
  atan2 R0, R1
  pop R1
__function_atan2_return:
  mov SP, BP
  pop BP
  ret

__function_sqrt:
  push BP
  mov BP, SP
  push R1
  mov R0, [BP+2]
  mov R1, 0.5
  pow R0, R1
  pop R1
__function_sqrt_return:
  mov SP, BP
  pop BP
  ret

__function_pow:
  push BP
  mov BP, SP
  push R1
  mov R0, [BP+2]
  mov R1, [BP+3]
  pow R0, R1
  pop R1
__function_pow_return:
  mov SP, BP
  pop BP
  ret

__function_exp:
  push BP
  mov BP, SP
  push R1
  mov R0, 2.718282
  mov R1, [BP+2]
  pow R0, R1
  pop R1
__function_exp_return:
  mov SP, BP
  pop BP
  ret

__function_log:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  log R0
__function_log_return:
  mov SP, BP
  pop BP
  ret

__function_memset:
  push BP
  mov BP, SP
  mov CR, [BP+4]
  mov DR, [BP+2]
  mov SR, [BP+3]
  sets
__function_memset_return:
  mov SP, BP
  pop BP
  ret

__function_memcpy:
  push BP
  mov BP, SP
  mov CR, [BP+4]
  mov DR, [BP+2]
  mov SR, [BP+3]
  movs
__function_memcpy_return:
  mov SP, BP
  pop BP
  ret

__function_memcmp:
  push BP
  mov BP, SP
  mov CR, [BP+4]
  mov DR, [BP+2]
  mov SR, [BP+3]
  cmps R0
__function_memcmp_return:
  mov SP, BP
  pop BP
  ret

__function_merge_free_malloc_blocks:
  push BP
  mov BP, SP
  isub SP, 2
  mov R1, [BP+2]
  mov R0, [R1]
  mov [BP-1], R0
  mov R1, [BP+2]
  iadd R1, 1
  mov R0, [R1]
  mov [BP-2], R0
__if_956_start:
  mov R0, [BP-2]
  ine R0, -1
  jf R0, __LogicalAnd_ShortCircuit_958
  mov R2, [BP-2]
  iadd R2, 3
  mov R1, [R2]
  and R0, R1
__LogicalAnd_ShortCircuit_958:
  jf R0, __if_956_end
  mov R1, [BP-2]
  iadd R1, 1
  mov R0, [R1]
  mov R1, [BP+2]
  iadd R1, 1
  mov [R1], R0
__if_967_start:
  mov R1, [BP-2]
  iadd R1, 1
  mov R0, [R1]
  ine R0, -1
  jf R0, __if_967_end
  mov R0, [BP+2]
  mov R2, [BP-2]
  iadd R2, 1
  mov R1, [R2]
  mov [R1], R0
__if_967_end:
  mov R1, [BP+2]
  iadd R1, 2
  mov R0, [R1]
  mov R2, [BP-2]
  iadd R2, 2
  mov R1, [R2]
  iadd R1, 4
  iadd R0, R1
  mov R1, [BP+2]
  iadd R1, 2
  mov [R1], R0
  mov R1, [BP+2]
  iadd R1, 1
  mov R0, [R1]
  mov [BP-2], R0
__if_956_end:
__if_986_start:
  mov R0, [BP-1]
  ine R0, -1
  jf R0, __LogicalAnd_ShortCircuit_988
  mov R2, [BP-1]
  iadd R2, 3
  mov R1, [R2]
  and R0, R1
__LogicalAnd_ShortCircuit_988:
  jf R0, __if_986_end
  mov R0, [BP-2]
  mov R1, [BP-1]
  iadd R1, 1
  mov [R1], R0
__if_996_start:
  mov R0, [BP-2]
  ine R0, -1
  jf R0, __if_996_end
  mov R0, [BP-1]
  mov R1, [BP-2]
  mov [R1], R0
__if_996_end:
  mov R1, [BP-1]
  iadd R1, 2
  mov R0, [R1]
  mov R2, [BP+2]
  iadd R2, 2
  mov R1, [R2]
  iadd R1, 4
  iadd R0, R1
  mov R1, [BP-1]
  iadd R1, 2
  mov [R1], R0
__if_986_end:
__function_merge_free_malloc_blocks_return:
  mov SP, BP
  pop BP
  ret

__function_reduce_malloc_block:
  push BP
  mov BP, SP
  isub SP, 3
  mov R1, [BP+2]
  iadd R1, 2
  mov R0, [R1]
  mov R1, [BP+3]
  isub R0, R1
  mov [BP-1], R0
__if_1018_start:
  mov R0, [BP-1]
  ile R0, 4
  jf R0, __if_1018_end
  jmp __function_reduce_malloc_block_return
__if_1018_end:
  mov R0, [BP+2]
  iadd R0, 4
  mov R1, [BP+3]
  iadd R0, R1
  mov [BP-2], R0
  mov R0, [BP+2]
  mov R1, [BP-2]
  mov [R1], R0
  mov R1, [BP+2]
  iadd R1, 1
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 1
  mov [R1], R0
  mov R0, 1
  mov R1, [BP-2]
  iadd R1, 3
  mov [R1], R0
  mov R0, [BP-1]
  isub R0, 4
  mov R1, [BP-2]
  iadd R1, 2
  mov [R1], R0
  mov R0, [BP+3]
  mov R1, [BP+2]
  iadd R1, 2
  mov [R1], R0
  mov R0, [BP-2]
  mov R1, [BP+2]
  iadd R1, 1
  mov [R1], R0
__if_1061_start:
  mov R1, [BP-2]
  iadd R1, 1
  mov R0, [R1]
  ine R0, -1
  jf R0, __if_1061_end
  mov R0, [BP-2]
  mov R2, [BP-2]
  iadd R2, 1
  mov R1, [R2]
  mov [R1], R0
__if_1061_end:
  mov R1, [BP-2]
  mov [SP], R1
  call __function_merge_free_malloc_blocks
__function_reduce_malloc_block_return:
  mov SP, BP
  pop BP
  ret

__function_expand_malloc_block:
  push BP
  mov BP, SP
  isub SP, 3
  push R1
  push R2
  isub SP, 2
  mov R0, [BP+3]
  mov R2, [BP+2]
  iadd R2, 2
  mov R1, [R2]
  isub R0, R1
  mov [BP-1], R0
__if_1080_start:
  mov R0, [BP-1]
  ile R0, 0
  jf R0, __if_1080_end
  mov R0, 1
  jmp __function_expand_malloc_block_return
__if_1080_end:
  mov R1, [BP+2]
  iadd R1, 1
  mov R0, [R1]
  mov [BP-2], R0
__if_1090_start:
  mov R0, [BP-2]
  ine R0, -1
  bnot R0
  jt R0, __LogicalOr_ShortCircuit_1093
  mov R2, [BP-2]
  iadd R2, 3
  mov R1, [R2]
  bnot R1
  or R0, R1
__LogicalOr_ShortCircuit_1093:
  jf R0, __if_1090_end
  mov R0, 0
  jmp __function_expand_malloc_block_return
__if_1090_end:
  mov R1, [BP-2]
  iadd R1, 2
  mov R0, [R1]
  iadd R0, 4
  mov [BP-3], R0
__if_1105_start:
  mov R0, [BP-3]
  mov R1, [BP-1]
  ilt R0, R1
  jf R0, __if_1105_end
  mov R0, 0
  jmp __function_expand_malloc_block_return
__if_1105_end:
  mov R1, [BP+2]
  iadd R1, 2
  mov R0, [R1]
  mov R1, [BP-3]
  iadd R0, R1
  mov R1, [BP+2]
  iadd R1, 2
  mov [R1], R0
  mov R1, [BP-2]
  iadd R1, 1
  mov R0, [R1]
  mov R1, [BP+2]
  iadd R1, 1
  mov [R1], R0
__if_1120_start:
  mov R1, [BP-2]
  iadd R1, 1
  mov R0, [R1]
  ine R0, -1
  jf R0, __if_1120_end
  mov R0, [BP+2]
  mov R2, [BP-2]
  iadd R2, 1
  mov R1, [R2]
  mov [R1], R0
__if_1120_end:
  mov R1, [BP+2]
  mov [SP], R1
  mov R1, [BP+3]
  mov [SP+1], R1
  call __function_reduce_malloc_block
  mov R0, 1
__function_expand_malloc_block_return:
  iadd SP, 2
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_malloc:
  push BP
  mov BP, SP
  isub SP, 3
  push R1
  push R2
__if_1135_start:
  mov R0, [global_malloc_first_block]
  ine R0, -1
  bnot R0
  jf R0, __if_1135_end
  mov R0, [global_malloc_start_address]
  mov [global_malloc_first_block], R0
  mov R0, [global_malloc_end_address]
  mov R1, [global_malloc_start_address]
  isub R0, R1
  iadd R0, 1
  mov R1, [global_malloc_first_block]
  iadd R1, 2
  mov [R1], R0
  mov R1, [global_malloc_first_block]
  iadd R1, 2
  mov R0, [R1]
  isub R0, 4
  mov R1, [global_malloc_first_block]
  iadd R1, 2
  mov [R1], R0
  mov R0, -1
  mov R1, [global_malloc_first_block]
  mov [R1], R0
  mov R0, -1
  mov R1, [global_malloc_first_block]
  iadd R1, 1
  mov [R1], R0
  mov R0, 1
  mov R1, [global_malloc_first_block]
  iadd R1, 3
  mov [R1], R0
__if_1135_end:
__if_1170_start:
  mov R0, [BP+2]
  ile R0, 0
  jf R0, __if_1170_end
  mov R0, -1
  jmp __function_malloc_return
__if_1170_end:
  mov R0, [global_malloc_first_block]
  mov [BP-1], R0
__while_1179_start:
__while_1179_continue:
  mov R0, [BP-1]
  ine R0, -1
  jf R0, __while_1179_end
__if_1182_start:
  mov R1, [BP-1]
  iadd R1, 3
  mov R0, [R1]
  jf R0, __LogicalAnd_ShortCircuit_1185
  mov R2, [BP-1]
  iadd R2, 2
  mov R1, [R2]
  mov R2, [BP+2]
  ige R1, R2
  and R0, R1
__LogicalAnd_ShortCircuit_1185:
  jf R0, __if_1182_end
  jmp __while_1179_end
__if_1182_end:
  mov R1, [BP-1]
  iadd R1, 1
  mov R0, [R1]
  mov [BP-1], R0
  jmp __while_1179_start
__while_1179_end:
__if_1195_start:
  mov R0, [BP-1]
  ine R0, -1
  bnot R0
  jf R0, __if_1195_end
  mov R0, -1
  jmp __function_malloc_return
__if_1195_end:
  mov R0, [BP+2]
  iadd R0, 4
  mov [BP-2], R0
__if_1205_start:
  mov R1, [BP-1]
  iadd R1, 2
  mov R0, [R1]
  mov R1, [BP-2]
  igt R0, R1
  jf R0, __if_1205_else
  mov R0, [BP-1]
  iadd R0, 4
  mov R2, [BP-1]
  iadd R2, 2
  mov R1, [R2]
  iadd R0, R1
  mov R1, [BP-2]
  isub R0, R1
  mov [BP-3], R0
  mov R0, [BP+2]
  mov R1, [BP-3]
  iadd R1, 2
  mov [R1], R0
  mov R0, 0
  mov R1, [BP-3]
  iadd R1, 3
  mov [R1], R0
  mov R0, [BP-1]
  mov R1, [BP-3]
  mov [R1], R0
  mov R1, [BP-1]
  iadd R1, 1
  mov R0, [R1]
  mov R1, [BP-3]
  iadd R1, 1
  mov [R1], R0
  mov R1, [BP-1]
  iadd R1, 2
  mov R0, [R1]
  mov R1, [BP-2]
  isub R0, R1
  mov R1, [BP-1]
  iadd R1, 2
  mov [R1], R0
  mov R0, [BP-3]
  mov R1, [BP-1]
  iadd R1, 1
  mov [R1], R0
__if_1250_start:
  mov R1, [BP-3]
  iadd R1, 1
  mov R0, [R1]
  ine R0, -1
  jf R0, __if_1250_end
  mov R0, [BP-3]
  mov R2, [BP-3]
  iadd R2, 1
  mov R1, [R2]
  mov [R1], R0
__if_1250_end:
  mov R0, [BP-3]
  iadd R0, 4
  jmp __function_malloc_return
  jmp __if_1205_end
__if_1205_else:
  mov R0, 0
  mov R1, [BP-1]
  iadd R1, 3
  mov [R1], R0
  mov R0, [BP-1]
  iadd R0, 4
  jmp __function_malloc_return
__if_1205_end:
__function_malloc_return:
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_free:
  push BP
  mov BP, SP
  isub SP, 2
__if_1275_start:
  mov R0, [BP+2]
  ine R0, -1
  bnot R0
  jf R0, __if_1275_end
  jmp __function_free_return
__if_1275_end:
  mov R0, [BP+2]
  isub R0, 4
  mov [BP-1], R0
  mov R0, 1
  mov R1, [BP-1]
  iadd R1, 3
  mov [R1], R0
  mov R1, [BP-1]
  mov [SP], R1
  call __function_merge_free_malloc_blocks
__function_free_return:
  mov SP, BP
  pop BP
  ret

__function_calloc:
  push BP
  mov BP, SP
  isub SP, 2
  push R1
  isub SP, 3
  mov R0, [BP+2]
  mov R1, [BP+3]
  imul R0, R1
  mov [BP-1], R0
  mov R1, [BP-1]
  mov [SP], R1
  call __function_malloc
  mov [BP-2], R0
__if_1303_start:
  mov R0, [BP-2]
  ine R0, -1
  bnot R0
  jf R0, __if_1303_end
  mov R0, -1
  jmp __function_calloc_return
__if_1303_end:
  mov R1, [BP-2]
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, [BP-1]
  mov [SP+2], R1
  call __function_memset
  mov R0, [BP-2]
__function_calloc_return:
  iadd SP, 3
  pop R1
  mov SP, BP
  pop BP
  ret

__function_realloc:
  push BP
  mov BP, SP
  isub SP, 3
  push R1
  isub SP, 3
__if_1317_start:
  mov R0, [BP+2]
  ine R0, -1
  bnot R0
  jf R0, __if_1317_end
  mov R1, [BP+3]
  mov [SP], R1
  call __function_malloc
  jmp __function_realloc_return
__if_1317_end:
__if_1323_start:
  mov R0, [BP+3]
  ile R0, 0
  jf R0, __if_1323_end
  mov R1, [BP+2]
  mov [SP], R1
  call __function_free
  mov R0, -1
  jmp __function_realloc_return
__if_1323_end:
  mov R0, [BP+2]
  isub R0, 4
  mov [BP-1], R0
  mov R1, [BP-1]
  iadd R1, 2
  mov R0, [R1]
  mov [BP-2], R0
__if_1342_start:
  mov R0, [BP+3]
  mov R1, [BP-2]
  ieq R0, R1
  jf R0, __if_1342_end
  mov R0, [BP+2]
  jmp __function_realloc_return
__if_1342_end:
__if_1348_start:
  mov R0, [BP+3]
  mov R1, [BP-2]
  ilt R0, R1
  jf R0, __if_1348_else
  mov R1, [BP-1]
  mov [SP], R1
  mov R1, [BP+3]
  mov [SP+1], R1
  call __function_reduce_malloc_block
  mov R0, [BP+2]
  jmp __function_realloc_return
  jmp __if_1348_end
__if_1348_else:
__if_1359_start:
  mov R1, [BP-1]
  mov [SP], R1
  mov R1, [BP+3]
  mov [SP+1], R1
  call __function_expand_malloc_block
  jf R0, __if_1359_else
  mov R0, [BP+2]
  jmp __function_realloc_return
  jmp __if_1359_end
__if_1359_else:
  mov R1, [BP+3]
  mov [SP], R1
  call __function_malloc
  mov [BP-3], R0
__if_1370_start:
  mov R0, [BP-3]
  ine R0, -1
  bnot R0
  jf R0, __if_1370_end
  mov R0, -1
  jmp __function_realloc_return
__if_1370_end:
  mov R1, [BP-3]
  mov [SP], R1
  mov R1, [BP+2]
  mov [SP+1], R1
  mov R1, [BP-2]
  mov [SP+2], R1
  call __function_memcpy
  mov R1, [BP+2]
  mov [SP], R1
  call __function_free
  mov R0, [BP-3]
  jmp __function_realloc_return
__if_1359_end:
__if_1348_end:
__function_realloc_return:
  iadd SP, 3
  pop R1
  mov SP, BP
  pop BP
  ret

__function_rand:
  push BP
  mov BP, SP
  in R0, RNG_CurrentValue
__function_rand_return:
  mov SP, BP
  pop BP
  ret

__function_srand:
  push BP
  mov BP, SP
  mov R0, [BP+2]
  out RNG_CurrentValue, R0
__function_srand_return:
  mov SP, BP
  pop BP
  ret

__function_exit:
  push BP
  mov BP, SP
  hlt
__function_exit_return:
  mov SP, BP
  pop BP
  ret

__function_isdigit:
  push BP
  mov BP, SP
  push R1
  mov R0, [BP+2]
  ige R0, 48
  jf R0, __LogicalAnd_ShortCircuit_1399
  mov R1, [BP+2]
  ile R1, 57
  and R0, R1
__LogicalAnd_ShortCircuit_1399:
__function_isdigit_return:
  pop R1
  mov SP, BP
  pop BP
  ret

__function_isxdigit:
  push BP
  mov BP, SP
  push R1
__if_1404_start:
  mov R0, [BP+2]
  ige R0, 48
  jf R0, __LogicalAnd_ShortCircuit_1409
  mov R1, [BP+2]
  ile R1, 57
  and R0, R1
__LogicalAnd_ShortCircuit_1409:
  jf R0, __if_1404_end
  mov R0, 1
  jmp __function_isxdigit_return
__if_1404_end:
__if_1414_start:
  mov R0, [BP+2]
  ige R0, 97
  jf R0, __LogicalAnd_ShortCircuit_1419
  mov R1, [BP+2]
  ile R1, 102
  and R0, R1
__LogicalAnd_ShortCircuit_1419:
  jf R0, __if_1414_end
  mov R0, 1
  jmp __function_isxdigit_return
__if_1414_end:
  mov R0, [BP+2]
  ige R0, 65
  jf R0, __LogicalAnd_ShortCircuit_1430
  mov R1, [BP+2]
  ile R1, 70
  and R0, R1
__LogicalAnd_ShortCircuit_1430:
__function_isxdigit_return:
  pop R1
  mov SP, BP
  pop BP
  ret

__function_isalpha:
  push BP
  mov BP, SP
  push R1
__if_1435_start:
  mov R0, [BP+2]
  ige R0, 97
  jf R0, __LogicalAnd_ShortCircuit_1440
  mov R1, [BP+2]
  ile R1, 122
  and R0, R1
__LogicalAnd_ShortCircuit_1440:
  jf R0, __if_1435_end
  mov R0, 1
  jmp __function_isalpha_return
__if_1435_end:
  mov R0, [BP+2]
  ige R0, 65
  jf R0, __LogicalAnd_ShortCircuit_1451
  mov R1, [BP+2]
  ile R1, 90
  and R0, R1
__LogicalAnd_ShortCircuit_1451:
__function_isalpha_return:
  pop R1
  mov SP, BP
  pop BP
  ret

__function_isascii:
  push BP
  mov BP, SP
  push R1
  mov R0, [BP+2]
  ige R0, 0
  jf R0, __LogicalAnd_ShortCircuit_1462
  mov R1, [BP+2]
  ile R1, 127
  and R0, R1
__LogicalAnd_ShortCircuit_1462:
__function_isascii_return:
  pop R1
  mov SP, BP
  pop BP
  ret

__function_isalphanum:
  push BP
  mov BP, SP
  push R1
__if_1467_start:
  mov R0, [BP+2]
  ige R0, 48
  jf R0, __LogicalAnd_ShortCircuit_1472
  mov R1, [BP+2]
  ile R1, 57
  and R0, R1
__LogicalAnd_ShortCircuit_1472:
  jf R0, __if_1467_end
  mov R0, 1
  jmp __function_isalphanum_return
__if_1467_end:
__if_1477_start:
  mov R0, [BP+2]
  ige R0, 97
  jf R0, __LogicalAnd_ShortCircuit_1482
  mov R1, [BP+2]
  ile R1, 122
  and R0, R1
__LogicalAnd_ShortCircuit_1482:
  jf R0, __if_1477_end
  mov R0, 1
  jmp __function_isalphanum_return
__if_1477_end:
  mov R0, [BP+2]
  ige R0, 65
  jf R0, __LogicalAnd_ShortCircuit_1493
  mov R1, [BP+2]
  ile R1, 90
  and R0, R1
__LogicalAnd_ShortCircuit_1493:
__function_isalphanum_return:
  pop R1
  mov SP, BP
  pop BP
  ret

__function_islower:
  push BP
  mov BP, SP
  push R1
__if_1498_start:
  mov R0, [BP+2]
  ige R0, 97
  jf R0, __LogicalAnd_ShortCircuit_1503
  mov R1, [BP+2]
  ile R1, 122
  and R0, R1
__LogicalAnd_ShortCircuit_1503:
  jf R0, __if_1498_end
  mov R0, 1
  jmp __function_islower_return
__if_1498_end:
  mov R0, [BP+2]
  ige R0, 224
  jf R0, __LogicalAnd_ShortCircuit_1514
  mov R1, [BP+2]
  ile R1, 254
  and R0, R1
__LogicalAnd_ShortCircuit_1514:
  jf R0, __LogicalAnd_ShortCircuit_1518
  mov R1, [BP+2]
  ine R1, 247
  and R0, R1
__LogicalAnd_ShortCircuit_1518:
__function_islower_return:
  pop R1
  mov SP, BP
  pop BP
  ret

__function_isupper:
  push BP
  mov BP, SP
  push R1
__if_1523_start:
  mov R0, [BP+2]
  ige R0, 65
  jf R0, __LogicalAnd_ShortCircuit_1528
  mov R1, [BP+2]
  ile R1, 90
  and R0, R1
__LogicalAnd_ShortCircuit_1528:
  jf R0, __if_1523_end
  mov R0, 1
  jmp __function_isupper_return
__if_1523_end:
  mov R0, [BP+2]
  ige R0, 192
  jf R0, __LogicalAnd_ShortCircuit_1539
  mov R1, [BP+2]
  ile R1, 222
  and R0, R1
__LogicalAnd_ShortCircuit_1539:
  jf R0, __LogicalAnd_ShortCircuit_1543
  mov R1, [BP+2]
  ine R1, 215
  and R0, R1
__LogicalAnd_ShortCircuit_1543:
__function_isupper_return:
  pop R1
  mov SP, BP
  pop BP
  ret

__function_isspace:
  push BP
  mov BP, SP
  push R1
  mov R0, [BP+2]
  ieq R0, 32
  jt R0, __LogicalOr_ShortCircuit_1554
  mov R1, [BP+2]
  ieq R1, 10
  or R0, R1
__LogicalOr_ShortCircuit_1554:
  jt R0, __LogicalOr_ShortCircuit_1558
  mov R1, [BP+2]
  ieq R1, 13
  or R0, R1
__LogicalOr_ShortCircuit_1558:
  jt R0, __LogicalOr_ShortCircuit_1562
  mov R1, [BP+2]
  ieq R1, 9
  or R0, R1
__LogicalOr_ShortCircuit_1562:
__function_isspace_return:
  pop R1
  mov SP, BP
  pop BP
  ret

__function_tolower:
  push BP
  mov BP, SP
  push R1
  push R2
  isub SP, 1
__if_1567_start:
  mov R2, [BP+2]
  mov [SP], R2
  call __function_isupper
  mov R1, R0
  bnot R1
  mov R0, R1
  jf R0, __if_1567_end
  mov R0, [BP+2]
  jmp __function_tolower_return
__if_1567_end:
  mov R0, [BP+2]
  iadd R0, 32
__function_tolower_return:
  iadd SP, 1
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_toupper:
  push BP
  mov BP, SP
  push R1
  push R2
  isub SP, 1
__if_1579_start:
  mov R2, [BP+2]
  mov [SP], R2
  call __function_islower
  mov R1, R0
  bnot R1
  mov R0, R1
  jf R0, __if_1579_end
  mov R0, [BP+2]
  jmp __function_toupper_return
__if_1579_end:
  mov R0, [BP+2]
  isub R0, 32
__function_toupper_return:
  iadd SP, 1
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_strlen:
  push BP
  mov BP, SP
  isub SP, 1
  push R1
  mov R0, [BP+2]
  mov [BP-1], R0
__while_1594_start:
__while_1594_continue:
  mov R0, [BP+2]
  mov R0, [R0]
  cib R0
  jf R0, __while_1594_end
  mov R0, [BP+2]
  iadd R0, 1
  mov [BP+2], R0
  jmp __while_1594_start
__while_1594_end:
  mov R0, [BP+2]
  mov R1, [BP-1]
  isub R0, R1
__function_strlen_return:
  pop R1
  mov SP, BP
  pop BP
  ret

__function_strcmp:
  push BP
  mov BP, SP
  push R1
__while_1606_start:
__while_1606_continue:
  mov R0, [BP+2]
  mov R0, [R0]
  cib R0
  jf R0, __LogicalAnd_ShortCircuit_1609
  mov R1, [BP+3]
  mov R1, [R1]
  cib R1
  and R0, R1
__LogicalAnd_ShortCircuit_1609:
  jf R0, __while_1606_end
__if_1613_start:
  mov R0, [BP+2]
  mov R0, [R0]
  mov R1, [BP+3]
  mov R1, [R1]
  ine R0, R1
  jf R0, __if_1613_end
  jmp __while_1606_end
__if_1613_end:
  mov R0, [BP+2]
  iadd R0, 1
  mov [BP+2], R0
  mov R0, [BP+3]
  iadd R0, 1
  mov [BP+3], R0
  jmp __while_1606_start
__while_1606_end:
  mov R0, [BP+2]
  mov R0, [R0]
  mov R1, [BP+3]
  mov R1, [R1]
  isub R0, R1
__function_strcmp_return:
  pop R1
  mov SP, BP
  pop BP
  ret

__function_strncmp:
  push BP
  mov BP, SP
  push R1
__if_1634_start:
  mov R0, [BP+4]
  ilt R0, 1
  jf R0, __if_1634_end
  mov R0, 0
  jmp __function_strncmp_return
__if_1634_end:
__while_1640_start:
__while_1640_continue:
  mov R0, [BP+2]
  mov R0, [R0]
  cib R0
  jf R0, __LogicalAnd_ShortCircuit_1643
  mov R1, [BP+3]
  mov R1, [R1]
  cib R1
  and R0, R1
__LogicalAnd_ShortCircuit_1643:
  jf R0, __while_1640_end
  mov R0, [BP+4]
  isub R0, 1
  mov [BP+4], R0
__if_1649_start:
  mov R0, [BP+4]
  ile R0, 0
  jf R0, __if_1649_end
  jmp __while_1640_end
__if_1649_end:
__if_1654_start:
  mov R0, [BP+2]
  mov R0, [R0]
  mov R1, [BP+3]
  mov R1, [R1]
  ine R0, R1
  jf R0, __if_1654_end
  jmp __while_1640_end
__if_1654_end:
  mov R0, [BP+2]
  iadd R0, 1
  mov [BP+2], R0
  mov R0, [BP+3]
  iadd R0, 1
  mov [BP+3], R0
  jmp __while_1640_start
__while_1640_end:
  mov R0, [BP+2]
  mov R0, [R0]
  mov R1, [BP+3]
  mov R1, [R1]
  isub R0, R1
__function_strncmp_return:
  pop R1
  mov SP, BP
  pop BP
  ret

__function_strcpy:
  push BP
  mov BP, SP
__while_1674_start:
__while_1674_continue:
  mov R0, [BP+3]
  mov R0, [R0]
  cib R0
  jf R0, __while_1674_end
  mov R0, [BP+3]
  mov R0, [R0]
  lea R1, [BP+2]
  mov R1, [R1]
  mov [R1], R0
  mov R0, [BP+2]
  iadd R0, 1
  mov [BP+2], R0
  mov R0, [BP+3]
  iadd R0, 1
  mov [BP+3], R0
  jmp __while_1674_start
__while_1674_end:
  mov R0, 0
  lea R1, [BP+2]
  mov R1, [R1]
  mov [R1], R0
__function_strcpy_return:
  mov SP, BP
  pop BP
  ret

__function_strncpy:
  push BP
  mov BP, SP
__if_1695_start:
  mov R0, [BP+4]
  ilt R0, 1
  jf R0, __if_1695_end
  jmp __function_strncpy_return
__if_1695_end:
__while_1700_start:
__while_1700_continue:
  mov R0, [BP+3]
  mov R0, [R0]
  cib R0
  jf R0, __while_1700_end
  mov R0, [BP+3]
  mov R0, [R0]
  lea R1, [BP+2]
  mov R1, [R1]
  mov [R1], R0
  mov R0, [BP+2]
  iadd R0, 1
  mov [BP+2], R0
  mov R0, [BP+3]
  iadd R0, 1
  mov [BP+3], R0
  mov R0, [BP+4]
  isub R0, 1
  mov [BP+4], R0
__if_1715_start:
  mov R0, [BP+4]
  ile R0, 0
  jf R0, __if_1715_end
  jmp __while_1700_end
__if_1715_end:
  jmp __while_1700_start
__while_1700_end:
  mov R0, 0
  lea R1, [BP+2]
  mov R1, [R1]
  mov [R1], R0
__function_strncpy_return:
  mov SP, BP
  pop BP
  ret

__function_strcat:
  push BP
  mov BP, SP
__while_1727_start:
__while_1727_continue:
  mov R0, [BP+2]
  mov R0, [R0]
  cib R0
  jf R0, __while_1727_end
  mov R0, [BP+2]
  iadd R0, 1
  mov [BP+2], R0
  jmp __while_1727_start
__while_1727_end:
__while_1732_start:
__while_1732_continue:
  mov R0, [BP+3]
  mov R0, [R0]
  cib R0
  jf R0, __while_1732_end
  mov R0, [BP+3]
  mov R0, [R0]
  lea R1, [BP+2]
  mov R1, [R1]
  mov [R1], R0
  mov R0, [BP+2]
  iadd R0, 1
  mov [BP+2], R0
  mov R0, [BP+3]
  iadd R0, 1
  mov [BP+3], R0
  jmp __while_1732_start
__while_1732_end:
  mov R0, 0
  lea R1, [BP+2]
  mov R1, [R1]
  mov [R1], R0
__function_strcat_return:
  mov SP, BP
  pop BP
  ret

__function_strncat:
  push BP
  mov BP, SP
__if_1753_start:
  mov R0, [BP+4]
  ilt R0, 1
  jf R0, __if_1753_end
  jmp __function_strncat_return
__if_1753_end:
__while_1758_start:
__while_1758_continue:
  mov R0, [BP+2]
  mov R0, [R0]
  cib R0
  jf R0, __while_1758_end
  mov R0, [BP+2]
  iadd R0, 1
  mov [BP+2], R0
  jmp __while_1758_start
__while_1758_end:
__while_1763_start:
__while_1763_continue:
  mov R0, [BP+3]
  mov R0, [R0]
  cib R0
  jf R0, __while_1763_end
  mov R0, [BP+3]
  mov R0, [R0]
  lea R1, [BP+2]
  mov R1, [R1]
  mov [R1], R0
  mov R0, [BP+2]
  iadd R0, 1
  mov [BP+2], R0
  mov R0, [BP+3]
  iadd R0, 1
  mov [BP+3], R0
  mov R0, [BP+4]
  isub R0, 1
  mov [BP+4], R0
__if_1778_start:
  mov R0, [BP+4]
  ile R0, 0
  jf R0, __if_1778_end
  jmp __while_1763_end
__if_1778_end:
  jmp __while_1763_start
__while_1763_end:
  mov R0, 0
  lea R1, [BP+2]
  mov R1, [R1]
  mov [R1], R0
__function_strncat_return:
  mov SP, BP
  pop BP
  ret

__function_itoa:
  push BP
  mov BP, SP
  isub SP, 51
  lea DR, [BP-17]
  mov SR, __literal_string_1796
  mov CR, 17
  movs
__if_1800_start:
  mov R0, [BP+4]
  ilt R0, 2
  jt R0, __LogicalOr_ShortCircuit_1805
  mov R1, [BP+4]
  igt R1, 16
  or R0, R1
__LogicalOr_ShortCircuit_1805:
  jf R0, __if_1800_end
  jmp __function_itoa_return
__if_1800_end:
__if_1809_start:
  mov R0, [BP+4]
  ieq R0, 10
  jf R0, __LogicalAnd_ShortCircuit_1814
  mov R1, [BP+2]
  ilt R1, 0
  and R0, R1
__LogicalAnd_ShortCircuit_1814:
  jf R0, __if_1809_end
  mov R0, 45
  lea R1, [BP+3]
  mov R1, [R1]
  mov [R1], R0
  mov R0, [BP+3]
  iadd R0, 1
  mov [BP+3], R0
  mov R0, [BP+2]
  isgn R0
  mov [BP+2], R0
__if_1809_end:
  lea R0, [BP-50]
  mov [BP-51], R0
__do_1831_start:
  lea R0, [BP-17]
  mov R1, [BP+2]
  mov R2, [BP+4]
  imod R1, R2
  iadd R0, R1
  mov R0, [R0]
  lea R1, [BP-51]
  mov R1, [R1]
  mov [R1], R0
  mov R0, [BP-51]
  iadd R0, 1
  mov [BP-51], R0
  mov R0, [BP+2]
  mov R1, [BP+4]
  idiv R0, R1
  mov [BP+2], R0
__do_1831_continue:
  mov R0, [BP+2]
  cib R0
  jt R0, __do_1831_start
__do_1831_end:
__do_1847_start:
  mov R0, [BP-51]
  isub R0, 1
  mov [BP-51], R0
  mov R0, [BP-51]
  mov R0, [R0]
  lea R1, [BP+3]
  mov R1, [R1]
  mov [R1], R0
  mov R0, [BP+3]
  iadd R0, 1
  mov [BP+3], R0
__do_1847_continue:
  mov R0, [BP-51]
  lea R1, [BP-50]
  ine R0, R1
  jt R0, __do_1847_start
__do_1847_end:
  mov R0, 0
  lea R1, [BP+3]
  mov R1, [R1]
  mov [R1], R0
__function_itoa_return:
  mov SP, BP
  pop BP
  ret

__function_ftoa:
  push BP
  mov BP, SP
  isub SP, 14
__if_1871_start:
  mov R0, [BP+2]
  flt R0, 0.000000
  jf R0, __if_1871_end
  mov R0, 45
  lea R1, [BP+3]
  mov R1, [R1]
  mov [R1], R0
  mov R0, [BP+3]
  iadd R0, 1
  mov [BP+3], R0
  mov R0, [BP+2]
  fsgn R0
  mov [BP+2], R0
__if_1871_end:
  mov R0, [BP+2]
  flr R0
  cfi R0
  mov [BP-1], R0
  push R1
  mov R0, [BP+2]
  mov R1, [BP-1]
  cif R1
  fsub R0, R1
  fmul R0, 100000.0
  round R0
  cfi R0
  mov [BP-2], R0
  pop R1
  mov R1, [BP-1]
  mov [SP], R1
  mov R1, [BP+3]
  mov [SP+1], R1
  mov R1, 10
  mov [SP+2], R1
  call __function_itoa
__if_1900_start:
  mov R0, [BP-2]
  bnot R0
  jf R0, __if_1900_end
  jmp __function_ftoa_return
__if_1900_end:
  mov R1, [BP+3]
  mov [SP], R1
  mov R1, __literal_string_1906
  mov [SP+1], R1
  call __function_strcat
  mov R0, [BP-2]
  mov [BP-3], R0
__while_1910_start:
__while_1910_continue:
  mov R0, [BP-3]
  ilt R0, 10000
  jf R0, __while_1910_end
  mov R1, [BP+3]
  mov [SP], R1
  mov R1, __literal_string_1917
  mov [SP+1], R1
  call __function_strcat
  mov R0, [BP-3]
  imul R0, 10
  mov [BP-3], R0
  jmp __while_1910_start
__while_1910_end:
__while_1921_start:
__while_1921_continue:
  mov R0, [BP-2]
  imod R0, 10
  bnot R0
  jf R0, __while_1921_end
  mov R0, [BP-2]
  idiv R0, 10
  mov [BP-2], R0
  jmp __while_1921_start
__while_1921_end:
  mov R1, [BP-2]
  mov [SP], R1
  lea R1, [BP-11]
  mov [SP+1], R1
  mov R1, 10
  mov [SP+2], R1
  call __function_itoa
  mov R1, [BP+3]
  mov [SP], R1
  lea R1, [BP-11]
  mov [SP+1], R1
  call __function_strcat
__function_ftoa_return:
  mov SP, BP
  pop BP
  ret

__function_ObjectsOverlap:
  push BP
  mov BP, SP
  push R1
  push R2
  push R3
__if_1991_start:
  mov R1, [BP+2]
  iadd R1, 1
  mov R0, [R1]
  mov R2, [BP+2]
  iadd R2, 3
  mov R1, [R2]
  idiv R1, 2
  isub R0, R1
  mov R2, [BP+3]
  iadd R2, 1
  mov R1, [R2]
  mov R3, [BP+3]
  iadd R3, 3
  mov R2, [R3]
  idiv R2, 2
  iadd R1, R2
  ige R0, R1
  jf R0, __if_1991_end
  mov R0, 0
  jmp __function_ObjectsOverlap_return
__if_1991_end:
__if_2011_start:
  mov R1, [BP+2]
  iadd R1, 1
  mov R0, [R1]
  mov R2, [BP+2]
  iadd R2, 3
  mov R1, [R2]
  idiv R1, 2
  iadd R0, R1
  mov R2, [BP+3]
  iadd R2, 1
  mov R1, [R2]
  mov R3, [BP+3]
  iadd R3, 3
  mov R2, [R3]
  idiv R2, 2
  isub R1, R2
  ile R0, R1
  jf R0, __if_2011_end
  mov R0, 0
  jmp __function_ObjectsOverlap_return
__if_2011_end:
__if_2031_start:
  mov R1, [BP+2]
  iadd R1, 2
  mov R0, [R1]
  mov R2, [BP+2]
  iadd R2, 4
  mov R1, [R2]
  idiv R1, 2
  isub R0, R1
  mov R2, [BP+3]
  iadd R2, 2
  mov R1, [R2]
  mov R3, [BP+3]
  iadd R3, 4
  mov R2, [R3]
  idiv R2, 2
  iadd R1, R2
  ige R0, R1
  jf R0, __if_2031_end
  mov R0, 0
  jmp __function_ObjectsOverlap_return
__if_2031_end:
__if_2051_start:
  mov R1, [BP+2]
  iadd R1, 2
  mov R0, [R1]
  mov R2, [BP+2]
  iadd R2, 4
  mov R1, [R2]
  idiv R1, 2
  iadd R0, R1
  mov R2, [BP+3]
  iadd R2, 2
  mov R1, [R2]
  mov R3, [BP+3]
  iadd R3, 4
  mov R2, [R3]
  idiv R2, 2
  isub R1, R2
  ile R0, R1
  jf R0, __if_2051_end
  mov R0, 0
  jmp __function_ObjectsOverlap_return
__if_2051_end:
  mov R0, 1
__function_ObjectsOverlap_return:
  pop R3
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_mknode:
  push BP
  mov BP, SP
  isub SP, 1
  push R1
  push R2
  isub SP, 1
  mov R0, -1
  mov [BP-1], R0
  mov R2, 22
  mov [SP], R2
  call __function_malloc
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
__if_2084_start:
  mov R0, [BP-1]
  ine R0, -1
  jf R0, __if_2084_end
  mov R0, [BP+3]
  mov R1, [BP-1]
  iadd R1, 1
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP-1]
  iadd R1, 2
  mov [R1], R0
__if_2097_start:
  mov R0, [BP+2]
  ieq R0, 0
  jf R0, __if_2097_else
  mov R0, 32
  mov R1, [BP-1]
  iadd R1, 3
  mov [R1], R0
  mov R0, 64
  mov R1, [BP-1]
  iadd R1, 4
  mov [R1], R0
  mov R0, 4
  mov R1, [BP-1]
  iadd R1, 7
  mov [R1], R0
  mov R0, 2
  mov R1, [BP-1]
  mov [R1], R0
  mov R0, 2
  mov R1, [BP-1]
  iadd R1, 5
  mov [R1], R0
  mov R0, 0
  mov R1, [BP-1]
  iadd R1, 12
  mov [R1], R0
  jmp __if_2097_end
__if_2097_else:
__if_2126_start:
  mov R0, [BP+2]
  ieq R0, 1
  jf R0, __if_2126_else
  mov R0, 80
  mov R1, [BP-1]
  iadd R1, 3
  mov [R1], R0
  mov R0, 32
  mov R1, [BP-1]
  iadd R1, 4
  mov [R1], R0
  mov R0, 24
  mov R1, [BP-1]
  iadd R1, 7
  mov [R1], R0
  mov R0, 17
  mov R1, [BP-1]
  mov [R1], R0
  mov R0, 2
  mov R1, [BP-1]
  iadd R1, 5
  mov [R1], R0
  mov R0, 1
  mov R1, [BP-1]
  iadd R1, 12
  mov [R1], R0
  jmp __if_2126_end
__if_2126_else:
__if_2155_start:
  mov R0, [BP+2]
  ieq R0, 2
  jf R0, __if_2155_else
  mov R0, 10
  mov R1, [BP-1]
  iadd R1, 3
  mov [R1], R0
  mov R0, 32
  mov R1, [BP-1]
  iadd R1, 4
  mov [R1], R0
  mov R0, 7
  mov R1, [BP-1]
  mov [R1], R0
  mov R0, 2
  mov R1, [BP-1]
  iadd R1, 5
  mov [R1], R0
  mov R0, 2
  mov R1, [BP-1]
  iadd R1, 12
  mov [R1], R0
  jmp __if_2155_end
__if_2155_else:
__if_2180_start:
  mov R0, [BP+2]
  ieq R0, 3
  jf R0, __if_2180_else
  mov R0, 14
  mov R1, [BP-1]
  iadd R1, 3
  mov [R1], R0
  mov R0, 24
  mov R1, [BP-1]
  iadd R1, 4
  mov [R1], R0
  mov R0, 16
  mov R1, [BP-1]
  mov [R1], R0
  mov R0, 2
  mov R1, [BP-1]
  iadd R1, 5
  mov [R1], R0
  mov R0, 3
  mov R1, [BP-1]
  iadd R1, 12
  mov [R1], R0
  jmp __if_2180_end
__if_2180_else:
__if_2205_start:
  mov R0, [BP+2]
  ieq R0, 4
  jf R0, __if_2205_else
  mov R0, 9
  mov R1, [BP-1]
  mov [R1], R0
  mov R0, 2
  mov R1, [BP-1]
  iadd R1, 5
  mov [R1], R0
  mov R0, 4
  mov R1, [BP-1]
  iadd R1, 12
  mov [R1], R0
  jmp __if_2205_end
__if_2205_else:
  mov R0, 32
  mov R1, [BP-1]
  iadd R1, 3
  mov [R1], R0
  mov R0, 32
  mov R1, [BP-1]
  iadd R1, 4
  mov [R1], R0
  mov R0, 4
  mov R1, [BP-1]
  iadd R1, 7
  mov [R1], R0
  mov R0, 2
  mov R1, [BP-1]
  iadd R1, 5
  mov [R1], R0
  mov R0, 5
  mov R1, [BP-1]
  iadd R1, 12
  mov [R1], R0
  mov R0, 0
  mov R1, [BP-1]
  iadd R1, 14
  mov [R1], R0
__if_2247_start:
  mov R0, [BP+2]
  ieq R0, 6
  jf R0, __if_2247_else
  mov R0, 12
  mov R1, [BP-1]
  mov [R1], R0
  mov R0, 4
  mov R1, [BP-1]
  iadd R1, 9
  mov [R1], R0
  mov R0, 100
  mov R1, [BP-1]
  iadd R1, 8
  mov [R1], R0
  mov R0, 1
  mov R1, [BP-1]
  iadd R1, 13
  mov [R1], R0
  jmp __if_2247_end
__if_2247_else:
__if_2268_start:
  mov R0, [BP+2]
  ieq R0, 7
  jf R0, __if_2268_else
  mov R0, 13
  mov R1, [BP-1]
  mov [R1], R0
  mov R0, 4
  mov R1, [BP-1]
  iadd R1, 9
  mov [R1], R0
  mov R0, 2
  mov R1, [BP-1]
  iadd R1, 10
  mov [R1], R0
  mov R0, 150
  mov R1, [BP-1]
  iadd R1, 8
  mov [R1], R0
  mov R0, 2
  mov R1, [BP-1]
  iadd R1, 13
  mov [R1], R0
  jmp __if_2268_end
__if_2268_else:
__if_2293_start:
  mov R0, [BP+2]
  ieq R0, 8
  jf R0, __if_2293_else
  mov R0, 14
  mov R1, [BP-1]
  mov [R1], R0
  mov R0, 4
  mov R1, [BP-1]
  iadd R1, 9
  mov [R1], R0
  mov R0, 200
  mov R1, [BP-1]
  iadd R1, 8
  mov [R1], R0
  mov R0, 3
  mov R1, [BP-1]
  iadd R1, 13
  mov [R1], R0
  jmp __if_2293_end
__if_2293_else:
__if_2314_start:
  mov R0, [BP+2]
  ieq R0, 9
  jf R0, __if_2314_end
  mov R0, 15
  mov R1, [BP-1]
  mov [R1], R0
  mov R0, 4
  mov R1, [BP-1]
  iadd R1, 9
  mov [R1], R0
  mov R0, 250
  mov R1, [BP-1]
  iadd R1, 8
  mov [R1], R0
  mov R0, 4
  mov R1, [BP-1]
  iadd R1, 13
  mov [R1], R0
__if_2314_end:
__if_2293_end:
__if_2268_end:
__if_2247_end:
__if_2205_end:
__if_2180_end:
__if_2155_end:
__if_2126_end:
__if_2097_end:
  mov R0, -1
  mov R1, [BP-1]
  iadd R1, 20
  mov [R1], R0
__if_2084_end:
  mov R0, [BP-1]
__function_mknode_return:
  iadd SP, 1
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_mklist:
  push BP
  mov BP, SP
  isub SP, 1
  push R1
  push R2
  isub SP, 1
  mov R2, 2
  mov [SP], R2
  call __function_malloc
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R0, -1
  mov R1, [BP-1]
  mov [R1], R0
  mov R0, -1
  mov R1, [BP-1]
  iadd R1, 1
  mov [R1], R0
  mov R0, [BP-1]
__function_mklist_return:
  iadd SP, 1
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_append:
  push BP
  mov BP, SP
  push R1
  push R2
__if_2362_start:
  mov R1, [BP+2]
  mov R0, [R1]
  ieq R0, -1
  jf R0, __if_2362_else
  mov R0, [BP+4]
  mov R1, [BP+2]
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+2]
  iadd R1, 1
  mov [R1], R0
  jmp __if_2362_end
__if_2362_else:
__if_2376_start:
  mov R0, [BP+3]
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  ieq R0, R1
  jf R0, __if_2376_else
  mov R0, [BP+4]
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  iadd R1, 20
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+2]
  iadd R1, 1
  mov [R1], R0
  mov R0, [BP+3]
  mov R1, [BP+4]
  iadd R1, 21
  mov [R1], R0
  jmp __if_2376_end
__if_2376_else:
  mov R1, [BP+3]
  iadd R1, 20
  mov R0, [R1]
  mov R1, [BP+4]
  iadd R1, 20
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+3]
  iadd R1, 20
  mov [R1], R0
  mov R0, [BP+3]
  mov R1, [BP+4]
  iadd R1, 21
  mov [R1], R0
__if_2376_end:
__if_2362_end:
  mov R0, [BP+2]
__function_append_return:
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_insert:
  push BP
  mov BP, SP
  isub SP, 1
  push R1
  push R2
__if_2415_start:
  mov R1, [BP+2]
  mov R0, [R1]
  ieq R0, -1
  jf R0, __if_2415_else
  mov R0, [BP+4]
  mov R1, [BP+2]
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+2]
  iadd R1, 1
  mov [R1], R0
  jmp __if_2415_end
__if_2415_else:
__if_2429_start:
  mov R0, [BP+3]
  mov R2, [BP+2]
  mov R1, [R2]
  ieq R0, R1
  jf R0, __if_2429_else
  mov R0, [BP+3]
  mov R2, [BP+2]
  mov R1, [R2]
  iadd R1, 20
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+2]
  mov [R1], R0
  jmp __if_2429_end
__if_2429_else:
  mov R0, -1
  mov [BP-1], R0
  mov R1, [BP+2]
  mov R0, [R1]
  mov [BP-1], R0
__while_2452_start:
__while_2452_continue:
  mov R0, [BP-1]
  mov R1, [BP+3]
  ine R0, R1
  jf R0, __while_2452_end
__if_2457_start:
  mov R1, [BP-1]
  iadd R1, 20
  mov R0, [R1]
  mov R1, [BP+3]
  ieq R0, R1
  jf R0, __if_2457_end
  mov R0, [BP+4]
  mov R1, [BP-1]
  iadd R1, 20
  mov [R1], R0
  mov R0, [BP+3]
  mov R1, [BP+4]
  iadd R1, 20
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+3]
  iadd R1, 21
  mov [R1], R0
__if_2457_end:
  mov R1, [BP-1]
  iadd R1, 20
  mov R0, [R1]
  mov [BP-1], R0
  jmp __while_2452_start
__while_2452_end:
__if_2429_end:
__if_2415_end:
  mov R0, [BP+2]
__function_insert_return:
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_obtain:
  push BP
  mov BP, SP
  isub SP, 1
  push R1
  push R2
  mov R0, -1
  mov [BP-1], R0
__if_2487_start:
  mov R0, [BP+2]
  ine R0, -1
  jf R0, __if_2487_end
__if_2492_start:
  mov R0, [BP+3]
  mov R0, [R0]
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  ieq R0, R1
  jf R0, __if_2492_else
  mov R0, -1
  mov [BP-1], R0
  mov R1, [BP+2]
  mov R0, [R1]
  mov [BP-1], R0
__while_2507_start:
__while_2507_continue:
  mov R0, [BP-1]
  ine R0, -1
  jf R0, __while_2507_end
__if_2512_start:
  mov R1, [BP-1]
  iadd R1, 20
  mov R0, [R1]
  mov R1, [BP+3]
  mov R1, [R1]
  ieq R0, R1
  jf R0, __if_2512_end
  mov R0, -1
  mov R1, [BP-1]
  iadd R1, 20
  mov [R1], R0
  mov R0, [BP-1]
  mov R1, [BP+2]
  iadd R1, 1
  mov [R1], R0
  jmp __while_2507_end
__if_2512_end:
  mov R1, [BP-1]
  iadd R1, 20
  mov R0, [R1]
  mov [BP-1], R0
  jmp __while_2507_start
__while_2507_end:
  jmp __if_2492_end
__if_2492_else:
__if_2533_start:
  mov R0, [BP+3]
  mov R0, [R0]
  mov R2, [BP+2]
  mov R1, [R2]
  ieq R0, R1
  jf R0, __if_2533_else
  mov R1, [BP+3]
  mov R1, [R1]
  iadd R1, 20
  mov R0, [R1]
  mov R1, [BP+2]
  mov [R1], R0
  jmp __if_2533_end
__if_2533_else:
  mov R0, -1
  mov [BP-1], R0
  mov R1, [BP+2]
  mov R0, [R1]
  mov [BP-1], R0
__while_2556_start:
__while_2556_continue:
  mov R0, [BP-1]
  ine R0, -1
  jf R0, __while_2556_end
__if_2561_start:
  mov R1, [BP-1]
  iadd R1, 20
  mov R0, [R1]
  mov R1, [BP+3]
  mov R1, [R1]
  ieq R0, R1
  jf R0, __if_2561_end
  mov R2, [BP-1]
  iadd R2, 20
  mov R1, [R2]
  iadd R1, 20
  mov R0, [R1]
  mov R1, [BP-1]
  iadd R1, 20
  mov [R1], R0
  mov R0, -1
  mov R1, [BP+3]
  mov R1, [R1]
  iadd R1, 20
  mov [R1], R0
  jmp __while_2556_end
__if_2561_end:
  mov R1, [BP-1]
  iadd R1, 20
  mov R0, [R1]
  mov [BP-1], R0
  jmp __while_2556_start
__while_2556_end:
__if_2533_end:
__if_2492_end:
__if_2487_end:
  mov R0, [BP+2]
__function_obtain_return:
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_rmnode:
  push BP
  mov BP, SP
  push R1
  isub SP, 1
__if_2590_start:
  mov R0, [BP+2]
  ine R0, -1
  jf R0, __if_2590_end
  mov R0, -1
  mov R1, [BP+2]
  iadd R1, 20
  mov [R1], R0
  mov R1, [BP+2]
  mov [SP], R1
  call __function_free
  mov R0, -1
  mov [BP+2], R0
__if_2590_end:
  mov R0, [BP+2]
__function_rmnode_return:
  iadd SP, 1
  pop R1
  mov SP, BP
  pop BP
  ret

__function_clearlist:
  push BP
  mov BP, SP
  isub SP, 2
  push R1
  push R2
  isub SP, 2
  mov R0, -1
  mov [BP-1], R0
  mov R1, [BP+2]
  mov R0, [R1]
  mov [BP-1], R0
__while_2615_start:
__while_2615_continue:
  mov R0, [BP-1]
  ine R0, -1
  jf R0, __while_2615_end
  mov R2, [BP+2]
  mov [SP], R2
  lea R2, [BP-1]
  mov [SP+1], R2
  call __function_obtain
  mov R1, R0
  mov [BP+2], R1
  mov R0, R1
  mov R1, [BP-1]
  mov [SP], R1
  call __function_rmnode
  mov R0, -1
  mov [BP-2], R0
  mov R1, [BP+2]
  mov R0, [R1]
  mov [BP-2], R0
  jmp __while_2615_start
__while_2615_end:
  mov R0, [BP+2]
__function_clearlist_return:
  iadd SP, 2
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_rmlist:
  push BP
  mov BP, SP
  push R1
  push R2
  isub SP, 1
  mov R2, [BP+2]
  mov [SP], R2
  call __function_clearlist
  mov R1, R0
  mov [BP+2], R1
  mov R0, R1
  mov R1, [BP+2]
  mov [SP], R1
  call __function_free
  mov R0, [BP+2]
__function_rmlist_return:
  iadd SP, 1
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_main:
  push BP
  mov BP, SP
  isub SP, 73
  mov R1, 1
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 0
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 639
  mov [SP+2], R1
  mov R1, 359
  mov [SP+3], R1
  call __function_define_region_topleft
  mov R1, 2
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 0
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 639
  mov [SP+2], R1
  mov R1, 359
  mov [SP+3], R1
  call __function_define_region_topleft
  mov R1, 3
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 0
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 639
  mov [SP+2], R1
  mov R1, 359
  mov [SP+3], R1
  call __function_define_region_topleft
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 2
  mov [SP], R1
  mov R1, 32
  mov [SP+1], R1
  mov R1, 32
  mov [SP+2], R1
  mov R1, 47
  mov [SP+3], R1
  mov R1, 63
  mov [SP+4], R1
  mov R1, 40
  mov [SP+5], R1
  mov R1, 48
  mov [SP+6], R1
  mov R1, 3
  mov [SP+7], R1
  mov R1, 1
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 5
  mov [SP], R1
  mov R1, 96
  mov [SP+1], R1
  mov R1, 32
  mov [SP+2], R1
  mov R1, 111
  mov [SP+3], R1
  mov R1, 63
  mov [SP+4], R1
  mov R1, 102
  mov [SP+5], R1
  mov R1, 48
  mov [SP+6], R1
  mov R1, 2
  mov [SP+7], R1
  mov R1, 1
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 7
  mov [SP], R1
  mov R1, 144
  mov [SP+1], R1
  mov R1, 48
  mov [SP+2], R1
  mov R1, 159
  mov [SP+3], R1
  mov R1, 63
  mov [SP+4], R1
  mov R1, 152
  mov [SP+5], R1
  mov R1, 56
  mov [SP+6], R1
  mov R1, 2
  mov [SP+7], R1
  mov R1, 1
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 9
  mov [SP], R1
  mov R1, 192
  mov [SP+1], R1
  mov R1, 48
  mov [SP+2], R1
  mov R1, 207
  mov [SP+3], R1
  mov R1, 63
  mov [SP+4], R1
  mov R1, 200
  mov [SP+5], R1
  mov R1, 56
  mov [SP+6], R1
  mov R1, 3
  mov [SP+7], R1
  mov R1, 1
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 12
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 80
  mov [SP+2], R1
  mov R1, 15
  mov [SP+3], R1
  mov R1, 95
  mov [SP+4], R1
  mov R1, 8
  mov [SP+5], R1
  mov R1, 88
  mov [SP+6], R1
  mov R1, 4
  mov [SP+7], R1
  mov R1, 1
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 16
  mov [SP], R1
  mov R1, 80
  mov [SP+1], R1
  mov R1, 80
  mov [SP+2], R1
  mov R1, 95
  mov [SP+3], R1
  mov R1, 95
  mov [SP+4], R1
  mov R1, 88
  mov [SP+5], R1
  mov R1, 88
  mov [SP+6], R1
  mov R1, 1
  mov [SP+7], R1
  mov R1, 1
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 17
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 112
  mov [SP+2], R1
  mov R1, 47
  mov [SP+3], R1
  mov R1, 127
  mov [SP+4], R1
  mov R1, 24
  mov [SP+5], R1
  mov R1, 122
  mov [SP+6], R1
  mov R1, 1
  mov [SP+7], R1
  mov R1, 4
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 25
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 190
  mov [SP+2], R1
  mov R1, 47
  mov [SP+3], R1
  mov R1, 207
  mov [SP+4], R1
  mov R1, 24
  mov [SP+5], R1
  mov R1, 200
  mov [SP+6], R1
  mov R1, 1
  mov [SP+7], R1
  mov R1, 1
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 26
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 208
  mov [SP+2], R1
  mov R1, 63
  mov [SP+3], R1
  mov R1, 223
  mov [SP+4], R1
  mov R1, 32
  mov [SP+5], R1
  mov R1, 216
  mov [SP+6], R1
  mov R1, 1
  mov [SP+7], R1
  mov R1, 1
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 27
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 224
  mov [SP+2], R1
  mov R1, 223
  mov [SP+3], R1
  mov R1, 239
  mov [SP+4], R1
  mov R1, 112
  mov [SP+5], R1
  mov R1, 232
  mov [SP+6], R1
  mov R1, 1
  mov [SP+7], R1
  mov R1, 1
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R1, 28
  mov [SP], R1
  call __function_select_region
  mov R1, 28
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 240
  mov [SP+2], R1
  mov R1, 95
  mov [SP+3], R1
  mov R1, 255
  mov [SP+4], R1
  mov R1, 48
  mov [SP+5], R1
  mov R1, 248
  mov [SP+6], R1
  mov R1, 1
  mov [SP+7], R1
  mov R1, 1
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R1, 29
  mov [SP], R1
  call __function_select_region
  mov R1, 29
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 256
  mov [SP+2], R1
  mov R1, 111
  mov [SP+3], R1
  mov R1, 271
  mov [SP+4], R1
  mov R1, 56
  mov [SP+5], R1
  mov R1, 264
  mov [SP+6], R1
  mov R1, 1
  mov [SP+7], R1
  mov R1, 1
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 0
  mov [SP], R1
  call __function_select_gamepad
  call __function_get_time
  mov R1, R0
  mov [BP-62], R1
  mov R1, [BP-62]
  mov [SP], R1
  call __function_srand
  mov R0, 0
  mov [BP-3], R0
  mov R0, 0
  mov [BP-4], R0
  mov R0, 0
  mov [BP-35], R0
  mov R0, 0
  mov [BP-36], R0
  mov R0, 0
  mov [BP-37], R0
  mov R0, 0
  mov [BP-41], R0
  mov R0, 40
  mov [BP-42], R0
  mov R0, 0
  mov [BP-43], R0
  mov R0, 0
  mov [BP-44], R0
  mov R0, 200
  mov [BP-45], R0
  mov R0, 0
  mov [BP-46], R0
  mov R0, 0
  mov [BP-47], R0
  mov R0, 0
  mov [BP-48], R0
  mov R0, 0
  mov [BP-49], R0
  mov R0, -1
  mov [BP-50], R0
  call __function_mklist
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R1, 1
  mov [SP], R1
  call __function_select_sound
  mov R1, 1
  mov [SP], R1
  call __function_set_sound_loop
  mov R1, 1
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  call __function_play_sound_in_channel
  call __function_get_time
  mov R1, R0
  mov [BP-62], R1
  mov R1, [BP-62]
  mov [SP], R1
  call __function_srand
  mov R0, -1
  mov [BP-51], R0
  mov R0, -1
  mov [BP-52], R0
  mov R0, -1
  mov [BP-53], R0
  mov R0, -1
  mov [BP-54], R0
  mov R0, -1
  mov [BP-55], R0
  mov R0, -1
  mov [BP-56], R0
  mov R0, -1
  mov [BP-57], R0
  mov R0, -1
  mov [BP-58], R0
  mov R0, -1
  mov [BP-59], R0
  mov R2, 0
  mov [SP], R2
  mov R2, 360
  mov [SP+1], R2
  mov R2, 320
  mov [SP+2], R2
  call __function_mknode
  mov R1, R0
  mov [BP-51], R1
  mov R0, R1
  mov R2, [BP-50]
  mov [SP], R2
  mov R3, [BP-50]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [BP-51]
  mov [SP+2], R2
  call __function_append
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R0, 120
  mov [BP-1], R0
  mov R0, 0
  mov [BP-35], R0
__for_2972_start:
  mov R0, [BP-35]
  ilt R0, 3
  jf R0, __for_2972_end
  mov R2, 1
  mov [SP], R2
  mov R2, [BP-1]
  mov [SP+1], R2
  mov R2, 260
  mov [SP+2], R2
  call __function_mknode
  mov R1, R0
  mov [BP-53], R1
  mov R0, R1
  mov R2, [BP-50]
  mov [SP], R2
  mov R3, [BP-50]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [BP-53]
  mov [SP+2], R2
  call __function_append
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R0, [BP-1]
  iadd R0, 200
  mov [BP-1], R0
__for_2972_continue:
  mov R0, [BP-35]
  mov R1, R0
  iadd R1, 1
  mov [BP-35], R1
  jmp __for_2972_start
__for_2972_end:
  mov R0, 120
  mov [BP-1], R0
  mov R0, 0
  mov [BP-35], R0
__for_3003_start:
  mov R0, [BP-35]
  ilt R0, 4
  jf R0, __for_3003_end
  mov R2, 4
  mov [SP], R2
  mov R2, [BP-1]
  mov [SP+1], R2
  mov R2, 340
  mov [SP+2], R2
  call __function_mknode
  mov R1, R0
  mov [BP-55], R1
  mov R0, R1
  mov R2, [BP-50]
  mov [SP], R2
  mov R3, [BP-50]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [BP-55]
  mov [SP+2], R2
  call __function_append
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R0, [BP-1]
  iadd R0, 25
  mov [BP-1], R0
__for_3003_continue:
  mov R0, [BP-35]
  mov R1, R0
  iadd R1, 1
  mov [BP-35], R1
  jmp __for_3003_start
__for_3003_end:
  mov R0, 0
  mov [BP-35], R0
__for_3031_start:
  mov R0, [BP-35]
  ilt R0, 10
  jf R0, __for_3031_end
  mov R0, [BP-35]
  iadd R0, 16
  imul R0, 18
  mov R1, [BP-54]
  iadd R1, 16
  mov [R1], R0
  mov R1, [BP-54]
  iadd R1, 16
  mov R0, [R1]
  cif R0
  fmul R0, 3.141593
  fdiv R0, 180.000000
  mov [BP-60], R0
  mov R2, [BP-60]
  mov [SP], R2
  call __function_cos
  mov R1, R0
  fmul R1, 100.000000
  fadd R1, 320.000000
  cfi R1
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-60]
  mov [SP], R2
  call __function_sin
  mov R1, R0
  fmul R1, 100.000000
  fadd R1, 160.000000
  cfi R1
  mov [BP-2], R1
  mov R0, R1
  mov R2, 9
  mov [SP], R2
  mov R2, [BP-1]
  mov [SP+1], R2
  mov R2, [BP-2]
  mov [SP+2], R2
  call __function_mknode
  mov R1, R0
  mov [BP-54], R1
  mov R0, R1
  mov R2, [BP-50]
  mov [SP], R2
  mov R3, [BP-50]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [BP-54]
  mov [SP+2], R2
  call __function_append
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
__for_3031_continue:
  mov R0, [BP-35]
  mov R1, R0
  iadd R1, 1
  mov [BP-35], R1
  jmp __for_3031_start
__for_3031_end:
  mov R0, 140
  mov [BP-1], R0
  mov R0, 80
  mov [BP-2], R0
  mov R0, 0
  mov [BP-49], R0
  mov R0, 0
  mov [BP-35], R0
__for_3104_start:
  mov R0, [BP-35]
  ilt R0, 10
  jf R0, __for_3104_end
  mov R2, 8
  mov [SP], R2
  mov R2, [BP-1]
  mov [SP+1], R2
  mov R2, [BP-2]
  mov [SP+2], R2
  call __function_mknode
  mov R1, R0
  mov [BP-54], R1
  mov R0, R1
  mov R2, [BP-50]
  mov [SP], R2
  mov R3, [BP-50]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [BP-54]
  mov [SP+2], R2
  call __function_append
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R0, [BP-1]
  iadd R0, 40
  mov [BP-1], R0
__if_3130_start:
  mov R0, [BP-49]
  ieq R0, 4
  jf R0, __if_3130_else
  mov R0, [BP-2]
  iadd R0, 0
  mov [BP-2], R0
  mov R1, [BP-54]
  iadd R1, 9
  mov R0, [R1]
  imul R0, -1
  mov R1, [BP-54]
  iadd R1, 9
  mov [R1], R0
  jmp __if_3130_end
__if_3130_else:
__if_3147_start:
  mov R0, [BP-49]
  igt R0, 4
  jf R0, __if_3147_else
  mov R0, [BP-2]
  isub R0, 20
  mov [BP-2], R0
  jmp __if_3147_end
__if_3147_else:
  mov R0, [BP-2]
  iadd R0, 20
  mov [BP-2], R0
  mov R1, [BP-54]
  iadd R1, 9
  mov R0, [R1]
  imul R0, -1
  mov R1, [BP-54]
  iadd R1, 9
  mov [R1], R0
__if_3147_end:
__if_3130_end:
  mov R0, [BP-49]
  iadd R0, 1
  mov [BP-49], R0
__for_3104_continue:
  mov R0, [BP-35]
  mov R1, R0
  iadd R1, 1
  mov [BP-35], R1
  jmp __for_3104_start
__for_3104_end:
  mov R0, 0
  mov [BP-35], R0
__for_3171_start:
  mov R0, [BP-35]
  ilt R0, 10
  jf R0, __for_3171_end
  call __function_rand
  mov R2, R0
  imod R2, 200
  iadd R2, 16
  mov [BP-62], R2
  call __function_rand
  mov R2, R0
  imod R2, 604
  iadd R2, 16
  mov [BP-63], R2
  mov R2, 7
  mov [SP], R2
  mov R2, [BP-63]
  mov [SP+1], R2
  mov R2, [BP-62]
  mov [SP+2], R2
  call __function_mknode
  mov R1, R0
  mov [BP-54], R1
  mov R0, R1
  mov R2, [BP-50]
  mov [SP], R2
  mov R3, [BP-50]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [BP-54]
  mov [SP+2], R2
  call __function_append
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
__if_3206_start:
  call __function_rand
  mov R1, R0
  imod R1, 2
  ieq R1, 0
  mov R0, R1
  jf R0, __if_3206_end
  mov R1, [BP-54]
  iadd R1, 9
  mov R0, [R1]
  imul R0, -1
  mov R1, [BP-54]
  iadd R1, 9
  mov [R1], R0
__if_3206_end:
__for_3171_continue:
  mov R0, [BP-35]
  mov R1, R0
  iadd R1, 1
  mov [BP-35], R1
  jmp __for_3171_start
__for_3171_end:
  mov R0, 0
  mov [BP-35], R0
__for_3223_start:
  mov R0, [BP-35]
  ilt R0, 10
  jf R0, __for_3223_end
  mov R0, [BP-35]
  iadd R0, 5
  imul R0, 18
  mov R1, [BP-54]
  iadd R1, 16
  mov [R1], R0
  mov R1, [BP-54]
  iadd R1, 16
  mov R0, [R1]
  cif R0
  fmul R0, 3.141593
  fdiv R0, 180.000000
  mov [BP-40], R0
  mov R2, [BP-40]
  mov [SP], R2
  call __function_cos
  mov R1, R0
  fmul R1, 100.000000
  fadd R1, -10.000000
  cfi R1
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-40]
  mov [SP], R2
  call __function_sin
  mov R1, R0
  fmul R1, 100.000000
  fadd R1, 160.000000
  cfi R1
  mov [BP-2], R1
  mov R0, R1
  mov R2, 6
  mov [SP], R2
  mov R2, [BP-1]
  mov [SP+1], R2
  mov R2, [BP-2]
  mov [SP+2], R2
  call __function_mknode
  mov R1, R0
  mov [BP-54], R1
  mov R0, R1
  mov R2, [BP-50]
  mov [SP], R2
  mov R3, [BP-50]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [BP-54]
  mov [SP+2], R2
  call __function_append
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R0, 0
  mov R1, [BP-54]
  iadd R1, 19
  mov [R1], R0
__for_3223_continue:
  mov R0, [BP-35]
  mov R1, R0
  iadd R1, 1
  mov [BP-35], R1
  jmp __for_3223_start
__for_3223_end:
__while_3292_start:
__while_3292_continue:
  mov R0, 1
  jf R0, __while_3292_end
  mov R1, -16777216
  mov [SP], R1
  call __function_clear_screen
  lea R1, [BP-60]
  mov [SP], R1
  lea R1, [BP-61]
  mov [SP+1], R1
  call __function_gamepad_direction
__if_3305_start:
  mov R0, [BP-37]
  ieq R0, 0
  jf R0, __if_3305_end
  mov R1, [BP-51]
  iadd R1, 1
  mov R0, [R1]
  mov R1, [BP-60]
  imul R1, 2
  iadd R0, R1
  mov R1, [BP-51]
  iadd R1, 1
  mov [R1], R0
__if_3320_start:
  mov R1, [BP-51]
  iadd R1, 1
  mov R0, [R1]
  mov R2, [BP-51]
  iadd R2, 3
  mov R1, [R2]
  idiv R1, 2
  iadd R0, R1
  igt R0, 640
  jf R0, __if_3320_end
  mov R1, [BP-51]
  iadd R1, 3
  mov R0, [R1]
  idiv R0, 2
  isgn R0
  iadd R0, 640
  mov R1, [BP-51]
  iadd R1, 1
  mov [R1], R0
__if_3320_end:
__if_3340_start:
  mov R1, [BP-51]
  iadd R1, 1
  mov R0, [R1]
  mov R2, [BP-51]
  iadd R2, 3
  mov R1, [R2]
  idiv R1, 2
  isub R0, R1
  ilt R0, 0
  jf R0, __if_3340_end
  mov R1, [BP-51]
  iadd R1, 3
  mov R0, [R1]
  idiv R0, 2
  iadd R0, 0
  mov R1, [BP-51]
  iadd R1, 1
  mov [R1], R0
__if_3340_end:
__if_3305_end:
__if_3360_start:
  mov R0, [BP-36]
  ieq R0, 0
  jf R0, __if_3360_else
  call __function_gamepad_button_start
  mov R1, R0
  mov [BP-38], R1
  mov R0, R1
  mov R1, 1
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 0
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  call __function_draw_region_at
__if_3375_start:
  mov R0, [BP-38]
  igt R0, 0
  jf R0, __if_3375_end
  mov R0, 1
  mov [BP-36], R0
  mov R1, 2
  mov [SP], R1
  call __function_select_sound
  mov R1, 2
  mov [SP], R1
  call __function_play_sound
  mov R1, 0
  mov [SP], R1
  call __function_stop_channel
  mov R1, -16777216
  mov [SP], R1
  call __function_clear_screen
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R1, 27
  mov [SP], R1
  call __function_select_region
  mov R1, 2
  cif R1
  mov [SP], R1
  mov R1, 2
  cif R1
  mov [SP+1], R1
  call __function_set_drawing_scale
  mov R1, 320
  mov [SP], R1
  mov R1, 180
  mov [SP+1], R1
  call __function_draw_region_zoomed_at
  mov R1, 1
  cif R1
  mov [SP], R1
  mov R1, 1
  cif R1
  mov [SP+1], R1
  call __function_set_drawing_scale
  mov R1, 120
  mov [SP], R1
  call __function_sleep
  mov R1, 0.500000
  mov [SP], R1
  call __function_set_channel_volume
__if_3375_end:
  jmp __if_3360_end
__if_3360_else:
__if_3408_start:
  mov R0, [BP-36]
  ieq R0, 1
  jf R0, __if_3408_end
  mov R1, 1
  cif R1
  mov [SP], R1
  mov R1, 1
  cif R1
  mov [SP+1], R1
  call __function_set_drawing_scale
  mov R1, 2
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 0
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  call __function_draw_region_at
  mov R1, 0
  mov [SP], R1
  call __function_select_sound
  mov R1, 1
  mov [SP], R1
  call __function_set_sound_loop
__if_3427_start:
  mov R0, [BP-47]
  ieq R0, 0
  jf R0, __if_3427_end
  mov R1, 0
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  call __function_play_sound_in_channel
  mov R0, 1
  mov [BP-47], R0
__if_3427_end:
__if_3438_start:
  mov R0, [BP-60]
  igt R0, 0
  jf R0, __if_3438_else
  mov R0, 2
  mov R1, [BP-51]
  iadd R1, 5
  mov [R1], R0
  mov R0, 16
  mov [BP-39], R0
  jmp __if_3438_end
__if_3438_else:
__if_3450_start:
  mov R0, [BP-60]
  ilt R0, 0
  jf R0, __if_3450_end
  mov R0, -2
  mov R1, [BP-51]
  iadd R1, 5
  mov [R1], R0
  mov R0, -16
  mov [BP-39], R0
__if_3450_end:
__if_3438_end:
__if_3464_start:
  call __function_gamepad_right
  mov R1, R0
  igt R1, 0
  jt R1, __LogicalOr_ShortCircuit_3469
  call __function_gamepad_left
  mov R2, R0
  igt R2, 0
  or R1, R2
__LogicalOr_ShortCircuit_3469:
  mov R0, R1
  jf R0, __if_3464_end
__if_3473_start:
  mov R1, [BP-51]
  mov R0, [R1]
  ieq R0, 2
  jt R0, __LogicalOr_ShortCircuit_3480
  mov R2, [BP-51]
  mov R1, [R2]
  ieq R1, 3
  or R0, R1
__LogicalOr_ShortCircuit_3480:
  jt R0, __LogicalOr_ShortCircuit_3485
  mov R2, [BP-51]
  mov R1, [R2]
  ieq R1, 4
  or R0, R1
__LogicalOr_ShortCircuit_3485:
  jf R0, __if_3473_end
  mov R1, [BP-51]
  iadd R1, 19
  mov R0, [R1]
  iadd R0, 1
  mov R1, [BP-51]
  iadd R1, 19
  mov [R1], R0
__if_3473_end:
__if_3493_start:
  mov R1, [BP-51]
  mov R0, [R1]
  ieq R0, 4
  jf R0, __LogicalAnd_ShortCircuit_3500
  mov R2, [BP-51]
  iadd R2, 19
  mov R1, [R2]
  ieq R1, 40
  and R0, R1
__LogicalAnd_ShortCircuit_3500:
  jf R0, __if_3493_end
  mov R0, 2
  mov R1, [BP-51]
  mov [R1], R0
__if_3493_end:
__if_3508_start:
  mov R1, [BP-51]
  mov R0, [R1]
  ieq R0, 3
  jf R0, __LogicalAnd_ShortCircuit_3515
  mov R2, [BP-51]
  iadd R2, 19
  mov R1, [R2]
  ieq R1, 20
  and R0, R1
__LogicalAnd_ShortCircuit_3515:
  jf R0, __if_3508_end
  mov R0, 4
  mov R1, [BP-51]
  mov [R1], R0
__if_3508_end:
__if_3523_start:
  mov R1, [BP-51]
  mov R0, [R1]
  ieq R0, 2
  jf R0, __LogicalAnd_ShortCircuit_3530
  mov R2, [BP-51]
  iadd R2, 19
  mov R1, [R2]
  ieq R1, 60
  and R0, R1
__LogicalAnd_ShortCircuit_3530:
  jf R0, __if_3523_end
  mov R0, 3
  mov R1, [BP-51]
  mov [R1], R0
  mov R0, 0
  mov R1, [BP-51]
  iadd R1, 19
  mov [R1], R0
  mov R1, [BP-51]
  iadd R1, 19
  mov R0, [R1]
  iadd R0, 1
  mov R1, [BP-51]
  iadd R1, 19
  mov [R1], R0
__if_3523_end:
__if_3464_end:
__if_3546_start:
  call __function_gamepad_button_a
  mov R1, R0
  igt R1, 0
  jf R1, __LogicalAnd_ShortCircuit_3551
  mov R2, [BP-46]
  ieq R2, 0
  and R1, R2
__LogicalAnd_ShortCircuit_3551:
  mov R0, R1
  jf R0, __if_3546_end
  mov R0, 5
  mov R1, [BP-51]
  mov [R1], R0
  mov R1, [BP-51]
  iadd R1, 2
  mov R0, [R1]
  isub R0, 28
  mov [BP-2], R0
  mov R1, [BP-51]
  iadd R1, 1
  mov R0, [R1]
  mov R1, [BP-39]
  iadd R0, R1
  mov [BP-1], R0
  mov R2, 2
  mov [SP], R2
  mov R2, [BP-1]
  mov [SP+1], R2
  mov R2, [BP-2]
  mov [SP+2], R2
  call __function_mknode
  mov R1, R0
  mov [BP-52], R1
  mov R0, R1
  mov R2, [BP-50]
  mov [SP], R2
  mov R3, [BP-50]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [BP-52]
  mov [SP+2], R2
  call __function_append
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R0, 1
  mov [BP-37], R0
  mov R0, [BP-41]
  iadd R0, 1
  mov [BP-41], R0
  mov R1, 2
  mov [SP], R1
  call __function_select_sound
  mov R1, 2
  mov [SP], R1
  call __function_play_sound
__if_3546_end:
__if_3594_start:
  mov R1, [BP-51]
  mov R0, [R1]
  ieq R0, 5
  jt R0, __LogicalOr_ShortCircuit_3601
  mov R2, [BP-51]
  mov R1, [R2]
  ieq R1, 6
  or R0, R1
__LogicalOr_ShortCircuit_3601:
  jf R0, __if_3594_end
  mov R0, [BP-46]
  iadd R0, 1
  mov [BP-46], R0
__if_3594_end:
__if_3610_start:
  mov R1, [BP-51]
  mov R0, [R1]
  ieq R0, 6
  jf R0, __LogicalAnd_ShortCircuit_3616
  mov R1, [BP-46]
  ieq R1, 40
  and R0, R1
__LogicalAnd_ShortCircuit_3616:
  jf R0, __if_3610_end
  mov R0, 2
  mov R1, [BP-51]
  mov [R1], R0
  mov R0, 0
  mov [BP-46], R0
  mov R0, 0
  mov [BP-37], R0
__if_3610_end:
__if_3630_start:
  mov R1, [BP-51]
  mov R0, [R1]
  ieq R0, 5
  jf R0, __LogicalAnd_ShortCircuit_3636
  mov R1, [BP-46]
  ieq R1, 20
  and R0, R1
__LogicalAnd_ShortCircuit_3636:
  jf R0, __if_3630_end
  mov R0, 6
  mov R1, [BP-51]
  mov [R1], R0
__if_3630_end:
  mov R0, -1
  mov [BP-57], R0
  mov R1, [BP-50]
  mov R0, [R1]
  mov [BP-57], R0
__while_3651_start:
__while_3651_continue:
  mov R0, [BP-57]
  ine R0, -1
  jf R0, __while_3651_end
__if_3656_start:
  mov R1, [BP-57]
  iadd R1, 12
  mov R0, [R1]
  ieq R0, 5
  jf R0, __if_3656_end
__if_3662_start:
  mov R1, [BP-57]
  iadd R1, 1
  mov R0, [R1]
  mov R2, [BP-51]
  iadd R2, 1
  mov R1, [R2]
  isub R1, 150
  igt R0, R1
  jf R0, __LogicalAnd_ShortCircuit_3672
  mov R2, [BP-57]
  iadd R2, 1
  mov R1, [R2]
  mov R3, [BP-51]
  iadd R3, 1
  mov R2, [R3]
  iadd R2, 150
  ilt R1, R2
  and R0, R1
__LogicalAnd_ShortCircuit_3672:
  jf R0, __if_3662_end
__if_3679_start:
  call __function_rand
  mov R1, R0
  mov R2, [BP-45]
  imod R1, R2
  ieq R1, 5
  mov R0, R1
  jf R0, __if_3679_end
  mov R2, 3
  mov [SP], R2
  mov R3, [BP-57]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R3, [BP-57]
  iadd R3, 2
  mov R2, [R3]
  mov [SP+2], R2
  call __function_mknode
  mov R1, R0
  mov [BP-56], R1
  mov R0, R1
  mov R2, [BP-50]
  mov [SP], R2
  mov R3, [BP-50]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [BP-56]
  mov [SP+2], R2
  call __function_append
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
__if_3679_end:
__if_3662_end:
__if_3656_end:
  mov R1, [BP-57]
  iadd R1, 20
  mov R0, [R1]
  mov [BP-57], R0
  jmp __while_3651_start
__while_3651_end:
  mov R0, -1
  mov [BP-57], R0
  mov R1, [BP-50]
  mov R0, [R1]
  mov [BP-57], R0
  mov R0, 0
  mov [BP-42], R0
  mov R0, 0
  mov [BP-43], R0
__while_3718_start:
__while_3718_continue:
  mov R0, [BP-57]
  ine R0, -1
  jf R0, __while_3718_end
__if_3723_start:
  mov R1, [BP-57]
  iadd R1, 12
  mov R0, [R1]
  ieq R0, 2
  jf R0, __if_3723_end
__if_3729_start:
  mov R1, [BP-57]
  iadd R1, 2
  mov R0, [R1]
  ilt R0, 0
  jf R0, __if_3729_end
  mov R2, [BP-50]
  mov [SP], R2
  lea R2, [BP-57]
  mov [SP+1], R2
  call __function_obtain
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R1, [BP-57]
  mov [SP], R1
  call __function_rmnode
  mov R0, [BP-41]
  isub R0, 1
  mov [BP-41], R0
__if_3729_end:
  mov R1, [BP-57]
  iadd R1, 2
  mov R0, [R1]
  isub R0, 2
  mov R1, [BP-57]
  iadd R1, 2
  mov [R1], R0
__if_3723_end:
__if_3753_start:
  mov R1, [BP-57]
  iadd R1, 12
  mov R0, [R1]
  ieq R0, 5
  jf R0, __if_3753_end
__if_3759_start:
  mov R2, [BP-57]
  iadd R2, 13
  mov R1, [R2]
  ieq R1, 1
  jf R1, __LogicalAnd_ShortCircuit_3765
  call __function_get_frame_counter
  mov R2, R0
  imod R2, 3
  ieq R2, 0
  and R1, R2
__LogicalAnd_ShortCircuit_3765:
  mov R0, R1
  jf R0, __if_3759_else
  mov R0, [BP-43]
  iadd R0, 1
  mov [BP-43], R0
__if_3774_start:
  mov R1, [BP-57]
  iadd R1, 14
  mov R0, [R1]
  ieq R0, 0
  jf R0, __if_3774_else
  mov R1, [BP-57]
  iadd R1, 16
  mov R0, [R1]
  mov R2, [BP-57]
  iadd R2, 9
  mov R1, [R2]
  isub R0, R1
  mov R1, [BP-57]
  iadd R1, 16
  mov [R1], R0
  mov R1, [BP-57]
  iadd R1, 16
  mov R0, [R1]
  cif R0
  fmul R0, 3.141593
  fdiv R0, 180.000000
  mov [BP-40], R0
  mov R2, [BP-40]
  mov [SP], R2
  call __function_cos
  mov R1, R0
  fmul R1, 100.000000
  fadd R1, -10.000000
  cfi R1
  mov R2, [BP-57]
  iadd R2, 1
  mov [R2], R1
  mov R0, R1
  mov R2, [BP-40]
  mov [SP], R2
  call __function_sin
  mov R1, R0
  fmul R1, 100.000000
  fadd R1, 160.000000
  cfi R1
  mov R2, [BP-57]
  iadd R2, 2
  mov [R2], R1
  mov R0, R1
__if_3816_start:
  mov R1, [BP-57]
  iadd R1, 16
  mov R0, [R1]
  ige R0, 0
  jf R0, __LogicalAnd_ShortCircuit_3823
  mov R2, [BP-57]
  iadd R2, 16
  mov R1, [R2]
  mov R3, [BP-57]
  iadd R3, 9
  mov R2, [R3]
  ile R1, R2
  and R0, R1
__LogicalAnd_ShortCircuit_3823:
  jf R0, __if_3816_end
  mov R1, [BP-57]
  iadd R1, 14
  mov R0, [R1]
  iadd R0, 1
  mov R1, [BP-57]
  iadd R1, 14
  mov [R1], R0
  mov R0, 90
  mov R1, [BP-57]
  iadd R1, 16
  mov [R1], R0
__if_3816_end:
  jmp __if_3774_end
__if_3774_else:
__if_3836_start:
  mov R1, [BP-57]
  iadd R1, 14
  mov R0, [R1]
  ieq R0, 1
  jf R0, __if_3836_else
  mov R1, [BP-57]
  iadd R1, 16
  mov R0, [R1]
  mov R2, [BP-57]
  iadd R2, 9
  mov R1, [R2]
  isub R0, R1
  mov R1, [BP-57]
  iadd R1, 16
  mov [R1], R0
  mov R1, [BP-57]
  iadd R1, 16
  mov R0, [R1]
  cif R0
  fmul R0, 3.141593
  fdiv R0, 180.000000
  mov [BP-40], R0
  mov R2, [BP-40]
  mov [SP], R2
  call __function_cos
  mov R1, R0
  fmul R1, 60.000000
  fadd R1, 90.000000
  cfi R1
  mov R2, [BP-57]
  iadd R2, 1
  mov [R2], R1
  mov R0, R1
  mov R2, [BP-40]
  mov [SP], R2
  call __function_sin
  mov R1, R0
  fmul R1, 60.000000
  fadd R1, 100.000000
  cfi R1
  mov R2, [BP-57]
  iadd R2, 2
  mov [R2], R1
  mov R0, R1
__if_3877_start:
  mov R1, [BP-57]
  iadd R1, 16
  mov R0, [R1]
  ige R0, 0
  jf R0, __LogicalAnd_ShortCircuit_3884
  mov R2, [BP-57]
  iadd R2, 16
  mov R1, [R2]
  mov R3, [BP-57]
  iadd R3, 9
  mov R2, [R3]
  ile R1, R2
  and R0, R1
__LogicalAnd_ShortCircuit_3884:
  jf R0, __if_3877_end
  mov R0, 360
  mov R1, [BP-57]
  iadd R1, 16
  mov [R1], R0
  mov R1, [BP-57]
  iadd R1, 17
  mov R0, [R1]
  iadd R0, 1
  mov R1, [BP-57]
  iadd R1, 17
  mov [R1], R0
__if_3877_end:
__if_3897_start:
  mov R1, [BP-57]
  iadd R1, 17
  mov R0, [R1]
  ieq R0, 4
  jf R0, __if_3897_end
  mov R1, [BP-57]
  iadd R1, 14
  mov R0, [R1]
  iadd R0, 1
  mov R1, [BP-57]
  iadd R1, 14
  mov [R1], R0
__if_3897_end:
  jmp __if_3836_end
__if_3836_else:
__if_3907_start:
  mov R1, [BP-57]
  iadd R1, 14
  mov R0, [R1]
  ieq R0, 2
  jf R0, __if_3907_end
__if_3913_start:
  mov R1, [BP-57]
  iadd R1, 1
  mov R0, [R1]
  iadd R0, 16
  igt R0, 640
  jf R0, __if_3913_end
  mov R1, [BP-57]
  iadd R1, 9
  mov R0, [R1]
  imul R0, -1
  mov R1, [BP-57]
  iadd R1, 9
  mov [R1], R0
  mov R1, [BP-57]
  iadd R1, 2
  mov R0, [R1]
  iadd R0, 10
  mov R1, [BP-57]
  iadd R1, 2
  mov [R1], R0
__if_3913_end:
__if_3934_start:
  mov R1, [BP-57]
  iadd R1, 1
  mov R0, [R1]
  isub R0, 16
  ilt R0, 0
  jf R0, __if_3934_end
  mov R1, [BP-57]
  iadd R1, 9
  mov R0, [R1]
  imul R0, -1
  mov R1, [BP-57]
  iadd R1, 9
  mov [R1], R0
  mov R1, [BP-57]
  iadd R1, 2
  mov R0, [R1]
  iadd R0, 10
  mov R1, [BP-57]
  iadd R1, 2
  mov [R1], R0
__if_3934_end:
  mov R1, [BP-57]
  iadd R1, 1
  mov R0, [R1]
  mov R2, [BP-57]
  iadd R2, 9
  mov R1, [R2]
  iadd R0, R1
  mov R1, [BP-57]
  iadd R1, 1
  mov [R1], R0
__if_3907_end:
__if_3836_end:
__if_3774_end:
  jmp __if_3759_end
__if_3759_else:
__if_3963_start:
  mov R2, [BP-57]
  iadd R2, 13
  mov R1, [R2]
  ieq R1, 2
  jf R1, __LogicalAnd_ShortCircuit_3969
  call __function_get_frame_counter
  mov R2, R0
  imod R2, 3
  ieq R2, 0
  and R1, R2
__LogicalAnd_ShortCircuit_3969:
  mov R0, R1
  jf R0, __if_3963_else
__if_3975_start:
  mov R1, [BP-57]
  iadd R1, 2
  mov R0, [R1]
  iadd R0, 16
  ige R0, 250
  jf R0, __if_3975_else
  mov R1, [BP-57]
  iadd R1, 10
  mov R0, [R1]
  imul R0, -1
  mov R1, [BP-57]
  iadd R1, 10
  mov [R1], R0
  jmp __if_3975_end
__if_3975_else:
__if_3992_start:
  mov R1, [BP-57]
  iadd R1, 2
  mov R0, [R1]
  isub R0, 16
  ile R0, 0
  jf R0, __if_3992_else
  mov R1, [BP-57]
  iadd R1, 10
  mov R0, [R1]
  imul R0, -1
  mov R1, [BP-57]
  iadd R1, 10
  mov [R1], R0
  jmp __if_3992_end
__if_3992_else:
__if_4009_start:
  mov R1, [BP-57]
  iadd R1, 1
  mov R0, [R1]
  iadd R0, 16
  ige R0, 640
  jf R0, __if_4009_else
  mov R1, [BP-57]
  iadd R1, 9
  mov R0, [R1]
  imul R0, -1
  mov R1, [BP-57]
  iadd R1, 9
  mov [R1], R0
  jmp __if_4009_end
__if_4009_else:
__if_4026_start:
  mov R1, [BP-57]
  iadd R1, 1
  mov R0, [R1]
  isub R0, 16
  ile R0, 0
  jf R0, __if_4026_end
  mov R1, [BP-57]
  iadd R1, 9
  mov R0, [R1]
  imul R0, -1
  mov R1, [BP-57]
  iadd R1, 9
  mov [R1], R0
__if_4026_end:
__if_4009_end:
__if_3992_end:
__if_3975_end:
  mov R1, [BP-57]
  iadd R1, 1
  mov R0, [R1]
  mov R2, [BP-57]
  iadd R2, 9
  mov R1, [R2]
  iadd R0, R1
  mov R1, [BP-57]
  iadd R1, 1
  mov [R1], R0
  mov R1, [BP-57]
  iadd R1, 2
  mov R0, [R1]
  mov R2, [BP-57]
  iadd R2, 10
  mov R1, [R2]
  iadd R0, R1
  mov R1, [BP-57]
  iadd R1, 2
  mov [R1], R0
  jmp __if_3963_end
__if_3963_else:
__if_4053_start:
  mov R2, [BP-57]
  iadd R2, 13
  mov R1, [R2]
  ieq R1, 3
  jf R1, __LogicalAnd_ShortCircuit_4059
  call __function_get_frame_counter
  mov R2, R0
  imod R2, 3
  ieq R2, 0
  and R1, R2
__LogicalAnd_ShortCircuit_4059:
  mov R0, R1
  jf R0, __if_4053_else
__if_4065_start:
  mov R1, [BP-57]
  iadd R1, 1
  mov R0, [R1]
  iadd R0, 16
  ige R0, 640
  jf R0, __if_4065_else
  mov R1, [BP-57]
  iadd R1, 9
  mov R0, [R1]
  imul R0, -1
  mov R1, [BP-57]
  iadd R1, 9
  mov [R1], R0
  jmp __if_4065_end
__if_4065_else:
__if_4082_start:
  mov R1, [BP-57]
  iadd R1, 1
  mov R0, [R1]
  isub R0, 16
  ile R0, 0
  jf R0, __if_4082_end
  mov R1, [BP-57]
  iadd R1, 9
  mov R0, [R1]
  imul R0, -1
  mov R1, [BP-57]
  iadd R1, 9
  mov [R1], R0
__if_4082_end:
__if_4065_end:
  mov R1, [BP-57]
  iadd R1, 1
  mov R0, [R1]
  mov R2, [BP-57]
  iadd R2, 9
  mov R1, [R2]
  iadd R0, R1
  mov R1, [BP-57]
  iadd R1, 1
  mov [R1], R0
  mov R1, [BP-57]
  iadd R1, 2
  mov R0, [R1]
  mov R2, [BP-57]
  iadd R2, 10
  mov R1, [R2]
  iadd R0, R1
  mov R1, [BP-57]
  iadd R1, 2
  mov [R1], R0
  jmp __if_4053_end
__if_4053_else:
__if_4109_start:
  mov R2, [BP-57]
  iadd R2, 13
  mov R1, [R2]
  ieq R1, 4
  jf R1, __LogicalAnd_ShortCircuit_4115
  call __function_get_frame_counter
  mov R2, R0
  imod R2, 3
  ieq R2, 0
  and R1, R2
__LogicalAnd_ShortCircuit_4115:
  mov R0, R1
  jf R0, __if_4109_end
  mov R0, [BP-44]
  iadd R0, 1
  mov [BP-44], R0
__if_4124_start:
  mov R1, [BP-57]
  iadd R1, 14
  mov R0, [R1]
  ieq R0, 0
  jf R0, __if_4124_else
  mov R1, [BP-57]
  iadd R1, 16
  mov R0, [R1]
  mov R2, [BP-57]
  iadd R2, 9
  mov R1, [R2]
  iadd R0, R1
  mov R1, [BP-57]
  iadd R1, 16
  mov [R1], R0
  mov R1, [BP-57]
  iadd R1, 16
  mov R0, [R1]
  cif R0
  fmul R0, 3.141593
  fdiv R0, 180.000000
  mov [BP-40], R0
  mov R2, [BP-40]
  mov [SP], R2
  call __function_cos
  mov R1, R0
  fmul R1, 100.000000
  fadd R1, 650.000000
  cfi R1
  mov R2, [BP-57]
  iadd R2, 1
  mov [R2], R1
  mov R0, R1
  mov R2, [BP-40]
  mov [SP], R2
  call __function_sin
  mov R1, R0
  fmul R1, 100.000000
  fadd R1, 160.000000
  cfi R1
  mov R2, [BP-57]
  iadd R2, 2
  mov [R2], R1
  mov R0, R1
__if_4165_start:
  mov R1, [BP-57]
  iadd R1, 1
  mov R0, [R1]
  ieq R0, 550
  jf R0, __if_4165_end
  mov R1, [BP-57]
  iadd R1, 14
  mov R0, [R1]
  iadd R0, 1
  mov R1, [BP-57]
  iadd R1, 14
  mov [R1], R0
  mov R0, 90
  mov R1, [BP-57]
  iadd R1, 16
  mov [R1], R0
__if_4165_end:
  jmp __if_4124_end
__if_4124_else:
__if_4179_start:
  mov R1, [BP-57]
  iadd R1, 14
  mov R0, [R1]
  ieq R0, 1
  jf R0, __if_4179_else
  mov R1, [BP-57]
  iadd R1, 16
  mov R0, [R1]
  mov R2, [BP-57]
  iadd R2, 9
  mov R1, [R2]
  iadd R0, R1
  mov R1, [BP-57]
  iadd R1, 16
  mov [R1], R0
  mov R1, [BP-57]
  iadd R1, 16
  mov R0, [R1]
  cif R0
  fmul R0, 3.141593
  fdiv R0, 180.000000
  mov [BP-40], R0
  mov R2, [BP-40]
  mov [SP], R2
  call __function_cos
  mov R1, R0
  fmul R1, 60.000000
  fadd R1, 550.000000
  cfi R1
  mov R2, [BP-57]
  iadd R2, 1
  mov [R2], R1
  mov R0, R1
  mov R2, [BP-40]
  mov [SP], R2
  call __function_sin
  mov R1, R0
  fmul R1, 60.000000
  fadd R1, 100.000000
  cfi R1
  mov R2, [BP-57]
  iadd R2, 2
  mov [R2], R1
  mov R0, R1
__if_4220_start:
  mov R1, [BP-57]
  iadd R1, 16
  mov R0, [R1]
  iadd R0, 182
  imod R0, 364
  ieq R0, 0
  jf R0, __if_4220_end
  mov R1, [BP-57]
  iadd R1, 17
  mov R0, [R1]
  iadd R0, 1
  mov R1, [BP-57]
  iadd R1, 17
  mov [R1], R0
__if_4220_end:
__if_4235_start:
  mov R1, [BP-57]
  iadd R1, 17
  mov R0, [R1]
  ieq R0, 4
  jf R0, __if_4235_end
  mov R1, [BP-57]
  iadd R1, 14
  mov R0, [R1]
  iadd R0, 1
  mov R1, [BP-57]
  iadd R1, 14
  mov [R1], R0
__if_4235_end:
  jmp __if_4179_end
__if_4179_else:
__if_4245_start:
  mov R1, [BP-57]
  iadd R1, 14
  mov R0, [R1]
  ieq R0, 2
  jf R0, __if_4245_end
__if_4251_start:
  mov R1, [BP-57]
  iadd R1, 1
  mov R0, [R1]
  iadd R0, 16
  igt R0, 640
  jf R0, __if_4251_end
  mov R1, [BP-57]
  iadd R1, 9
  mov R0, [R1]
  imul R0, -1
  mov R1, [BP-57]
  iadd R1, 9
  mov [R1], R0
  mov R1, [BP-57]
  iadd R1, 2
  mov R0, [R1]
  iadd R0, 10
  mov R1, [BP-57]
  iadd R1, 2
  mov [R1], R0
__if_4251_end:
__if_4272_start:
  mov R1, [BP-57]
  iadd R1, 1
  mov R0, [R1]
  isub R0, 16
  ilt R0, 0
  jf R0, __if_4272_end
  mov R1, [BP-57]
  iadd R1, 9
  mov R0, [R1]
  imul R0, -1
  mov R1, [BP-57]
  iadd R1, 9
  mov [R1], R0
  mov R1, [BP-57]
  iadd R1, 2
  mov R0, [R1]
  iadd R0, 10
  mov R1, [BP-57]
  iadd R1, 2
  mov [R1], R0
__if_4272_end:
  mov R1, [BP-57]
  iadd R1, 1
  mov R0, [R1]
  mov R2, [BP-57]
  iadd R2, 9
  mov R1, [R2]
  isub R0, R1
  mov R1, [BP-57]
  iadd R1, 1
  mov [R1], R0
__if_4245_end:
__if_4179_end:
__if_4124_end:
__if_4109_end:
__if_4053_end:
__if_3963_end:
__if_3759_end:
  mov R0, [BP-42]
  iadd R0, 1
  mov [BP-42], R0
__if_3753_end:
__if_4301_start:
  mov R1, [BP-57]
  iadd R1, 12
  mov R0, [R1]
  ieq R0, 3
  jf R0, __if_4301_end
__if_4307_start:
  mov R1, [BP-57]
  iadd R1, 2
  mov R0, [R1]
  igt R0, 300
  jf R0, __if_4307_end
  mov R2, [BP-50]
  mov [SP], R2
  lea R2, [BP-57]
  mov [SP+1], R2
  call __function_obtain
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R1, [BP-57]
  mov [SP], R1
  call __function_rmnode
__if_4307_end:
  mov R1, [BP-57]
  iadd R1, 2
  mov R0, [R1]
  iadd R0, 1
  mov R1, [BP-57]
  iadd R1, 2
  mov [R1], R0
__if_4301_end:
  mov R1, [BP-57]
  iadd R1, 20
  mov R0, [R1]
  mov [BP-57], R0
  jmp __while_3718_start
__while_3718_end:
  mov R0, -1
  mov [BP-57], R0
  mov R1, [BP-50]
  mov R0, [R1]
  mov [BP-57], R0
__while_4336_start:
__while_4336_continue:
  mov R0, [BP-57]
  ine R0, -1
  jf R0, __while_4336_end
__if_4341_start:
  mov R1, [BP-57]
  iadd R1, 12
  mov R0, [R1]
  ieq R0, 5
  jf R0, __if_4341_else
  mov R0, -1
  mov [BP-58], R0
  mov R1, [BP-50]
  mov R0, [R1]
  mov [BP-58], R0
__while_4354_start:
__while_4354_continue:
  mov R0, [BP-58]
  ine R0, -1
  jf R0, __while_4354_end
__if_4359_start:
  mov R1, [BP-58]
  iadd R1, 12
  mov R0, [R1]
  ieq R0, 2
  jf R0, __if_4359_end
__if_4365_start:
  mov R1, [BP-57]
  mov [SP], R1
  mov R1, [BP-58]
  mov [SP+1], R1
  call __function_ObjectsOverlap
  jf R0, __if_4365_end
  mov R2, [BP-50]
  mov [SP], R2
  lea R2, [BP-57]
  mov [SP+1], R2
  call __function_obtain
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R1, [BP-57]
  mov [SP], R1
  call __function_rmnode
  mov R2, [BP-50]
  mov [SP], R2
  lea R2, [BP-58]
  mov [SP+1], R2
  call __function_obtain
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R1, [BP-58]
  mov [SP], R1
  call __function_rmnode
  mov R0, [BP-45]
  isub R0, 3
  mov [BP-45], R0
  mov R0, [BP-3]
  mov R2, [BP-57]
  iadd R2, 8
  mov R1, [R2]
  iadd R0, R1
  mov [BP-3], R0
  mov R1, 6
  mov [SP], R1
  call __function_select_sound
  mov R1, 6
  mov [SP], R1
  call __function_play_sound
__if_4365_end:
__if_4359_end:
__if_4397_start:
  mov R1, [BP-58]
  iadd R1, 12
  mov R0, [R1]
  ieq R0, 0
  jf R0, __if_4397_end
__if_4403_start:
  mov R1, [BP-57]
  mov [SP], R1
  mov R1, [BP-58]
  mov [SP+1], R1
  call __function_ObjectsOverlap
  jf R0, __if_4403_end
  mov R2, [BP-50]
  mov [SP], R2
  lea R2, [BP-57]
  mov [SP+1], R2
  call __function_obtain
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R1, [BP-57]
  mov [SP], R1
  call __function_rmnode
  mov R2, [BP-50]
  mov [SP], R2
  lea R2, [BP-58]
  mov [SP+1], R2
  call __function_obtain
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R1, [BP-58]
  mov [SP], R1
  call __function_rmnode
  mov R0, 0
  mov R1, [BP-51]
  iadd R1, 7
  mov [R1], R0
__if_4403_end:
__if_4397_end:
  mov R1, [BP-58]
  iadd R1, 20
  mov R0, [R1]
  mov [BP-58], R0
  jmp __while_4354_start
__while_4354_end:
  jmp __if_4341_end
__if_4341_else:
__if_4432_start:
  mov R1, [BP-57]
  iadd R1, 12
  mov R0, [R1]
  ieq R0, 3
  jf R0, __if_4432_else
  mov R0, -1
  mov [BP-58], R0
  mov R1, [BP-50]
  mov R0, [R1]
  mov [BP-58], R0
__while_4445_start:
__while_4445_continue:
  mov R0, [BP-58]
  ine R0, -1
  jf R0, __while_4445_end
__if_4450_start:
  mov R1, [BP-58]
  iadd R1, 12
  mov R0, [R1]
  ieq R0, 0
  jf R0, __LogicalAnd_ShortCircuit_4456
  mov R1, [BP-48]
  igt R1, 60
  and R0, R1
__LogicalAnd_ShortCircuit_4456:
  jf R0, __if_4450_end
__if_4460_start:
  mov R1, [BP-57]
  mov [SP], R1
  mov R1, [BP-58]
  mov [SP+1], R1
  call __function_ObjectsOverlap
  jf R0, __if_4460_end
  mov R2, [BP-50]
  mov [SP], R2
  lea R2, [BP-57]
  mov [SP+1], R2
  call __function_obtain
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R1, [BP-57]
  mov [SP], R1
  call __function_rmnode
  mov R0, -1
  mov [BP-59], R0
  mov R1, [BP-50]
  mov R0, [R1]
  mov [BP-59], R0
__while_4480_start:
__while_4480_continue:
  mov R0, [BP-59]
  ine R0, -1
  jf R0, __while_4480_end
__if_4485_start:
  mov R1, [BP-59]
  iadd R1, 12
  mov R0, [R1]
  ieq R0, 4
  jf R0, __if_4485_end
  mov R2, [BP-50]
  mov [SP], R2
  lea R2, [BP-59]
  mov [SP+1], R2
  call __function_obtain
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R1, [BP-59]
  mov [SP], R1
  call __function_rmnode
  mov R0, 0
  mov [BP-48], R0
  mov R1, [BP-51]
  iadd R1, 7
  mov R0, [R1]
  isub R0, 1
  mov R1, [BP-51]
  iadd R1, 7
  mov [R1], R0
  mov R1, 3
  mov [SP], R1
  call __function_select_sound
  mov R1, 3
  mov [SP], R1
  call __function_play_sound
  jmp __while_4480_end
__if_4485_end:
  mov R1, [BP-59]
  iadd R1, 20
  mov R0, [R1]
  mov [BP-59], R0
  jmp __while_4480_start
__while_4480_end:
__if_4460_end:
__if_4450_end:
  mov R1, [BP-58]
  iadd R1, 20
  mov R0, [R1]
  mov [BP-58], R0
  jmp __while_4445_start
__while_4445_end:
  jmp __if_4432_end
__if_4432_else:
__if_4519_start:
  mov R1, [BP-57]
  iadd R1, 12
  mov R0, [R1]
  ieq R0, 1
  jf R0, __if_4519_end
  mov R0, -1
  mov [BP-58], R0
  mov R1, [BP-50]
  mov R0, [R1]
  mov [BP-58], R0
__while_4532_start:
__while_4532_continue:
  mov R0, [BP-58]
  ine R0, -1
  jf R0, __while_4532_end
__if_4537_start:
  mov R1, [BP-58]
  iadd R1, 12
  mov R0, [R1]
  ieq R0, 3
  jf R0, __if_4537_end
__if_4543_start:
  mov R1, [BP-57]
  mov [SP], R1
  mov R1, [BP-58]
  mov [SP+1], R1
  call __function_ObjectsOverlap
  jf R0, __if_4543_end
  mov R1, [BP-57]
  iadd R1, 7
  mov R0, [R1]
  isub R0, 1
  mov R1, [BP-57]
  iadd R1, 7
  mov [R1], R0
__if_4552_start:
  mov R1, [BP-57]
  iadd R1, 7
  mov R0, [R1]
  ieq R0, 18
  jt R0, __LogicalOr_ShortCircuit_4559
  mov R2, [BP-57]
  iadd R2, 7
  mov R1, [R2]
  ieq R1, 12
  or R0, R1
__LogicalOr_ShortCircuit_4559:
  jt R0, __LogicalOr_ShortCircuit_4564
  mov R2, [BP-57]
  iadd R2, 7
  mov R1, [R2]
  ieq R1, 6
  or R0, R1
__LogicalOr_ShortCircuit_4564:
  jf R0, __if_4552_end
  mov R1, [BP-57]
  mov R0, [R1]
  iadd R0, 1
  mov R1, [BP-57]
  mov [R1], R0
__if_4552_end:
__if_4572_start:
  mov R1, [BP-57]
  iadd R1, 7
  mov R0, [R1]
  ieq R0, 0
  jf R0, __if_4572_end
  mov R2, [BP-50]
  mov [SP], R2
  lea R2, [BP-57]
  mov [SP+1], R2
  call __function_obtain
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R1, [BP-57]
  mov [SP], R1
  call __function_rmnode
__if_4572_end:
  mov R2, [BP-50]
  mov [SP], R2
  lea R2, [BP-58]
  mov [SP+1], R2
  call __function_obtain
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R1, [BP-58]
  mov [SP], R1
  call __function_rmnode
__if_4543_end:
__if_4537_end:
__if_4594_start:
  mov R1, [BP-58]
  iadd R1, 12
  mov R0, [R1]
  ieq R0, 2
  jf R0, __if_4594_end
__if_4600_start:
  mov R1, [BP-57]
  mov [SP], R1
  mov R1, [BP-58]
  mov [SP+1], R1
  call __function_ObjectsOverlap
  jf R0, __if_4600_end
  mov R2, [BP-50]
  mov [SP], R2
  lea R2, [BP-58]
  mov [SP+1], R2
  call __function_obtain
  mov R1, R0
  mov [BP-50], R1
  mov R0, R1
  mov R1, [BP-58]
  mov [SP], R1
  call __function_rmnode
__if_4600_end:
__if_4594_end:
  mov R1, [BP-58]
  iadd R1, 20
  mov R0, [R1]
  mov [BP-58], R0
  jmp __while_4532_start
__while_4532_end:
__if_4519_end:
__if_4432_end:
__if_4341_end:
  mov R1, [BP-57]
  iadd R1, 20
  mov R0, [R1]
  mov [BP-57], R0
  jmp __while_4336_start
__while_4336_end:
  mov R0, [BP-48]
  iadd R0, 1
  mov [BP-48], R0
__if_4624_start:
  mov R1, [BP-51]
  iadd R1, 7
  mov R0, [R1]
  ieq R0, 0
  jf R0, __if_4624_else
  call __function_stop_all_channels
  mov R1, 4
  mov [SP], R1
  call __function_select_sound
  mov R1, 4
  mov [SP], R1
  call __function_play_sound
  mov R1, -16777216
  mov [SP], R1
  call __function_clear_screen
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R1, 2
  cif R1
  mov [SP], R1
  mov R1, 2
  cif R1
  mov [SP+1], R1
  call __function_set_drawing_scale
  mov R1, 29
  mov [SP], R1
  call __function_select_region
  mov R1, 320
  mov [SP], R1
  mov R1, 100
  mov [SP+1], R1
  call __function_draw_region_zoomed_at
  mov R1, 26
  mov [SP], R1
  call __function_select_region
  mov R1, 320
  mov [SP], R1
  mov R1, 175
  mov [SP+1], R1
  call __function_draw_region_zoomed_at
  mov R1, [BP-3]
  mov [SP], R1
  lea R1, [BP-34]
  mov [SP+1], R1
  mov R1, 10
  mov [SP+2], R1
  call __function_itoa
  mov R1, 300
  mov [SP], R1
  mov R1, 200
  mov [SP+1], R1
  lea R1, [BP-34]
  mov [SP+2], R1
  call __function_print_at
  call __function_exit
  jmp __if_4624_end
__if_4624_else:
__if_4661_start:
  mov R0, [BP-42]
  ieq R0, 0
  jf R0, __if_4661_end
  call __function_stop_all_channels
  mov R1, -16777216
  mov [SP], R1
  call __function_clear_screen
  mov R1, 1
  cif R1
  mov [SP], R1
  call __function_set_channel_volume
  mov R1, 1
  mov [SP], R1
  call __function_select_sound
  mov R1, 1
  mov [SP], R1
  call __function_set_sound_loop
  mov R1, 1
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  call __function_play_sound_in_channel
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R1, 2
  cif R1
  mov [SP], R1
  mov R1, 2
  cif R1
  mov [SP+1], R1
  call __function_set_drawing_scale
  mov R1, 28
  mov [SP], R1
  call __function_select_region
  mov R1, 320
  mov [SP], R1
  mov R1, 100
  mov [SP+1], R1
  call __function_draw_region_zoomed_at
  mov R1, 26
  mov [SP], R1
  call __function_select_region
  mov R1, 320
  mov [SP], R1
  mov R1, 175
  mov [SP+1], R1
  call __function_draw_region_zoomed_at
  mov R1, [BP-3]
  mov [SP], R1
  lea R1, [BP-34]
  mov [SP+1], R1
  mov R1, 10
  mov [SP+2], R1
  call __function_itoa
  mov R1, 300
  mov [SP], R1
  mov R1, 200
  mov [SP+1], R1
  lea R1, [BP-34]
  mov [SP+2], R1
  call __function_print_at
  call __function_exit
__if_4661_end:
__if_4624_end:
  mov R1, [BP-50]
  mov R0, [R1]
  mov [BP-57], R0
__while_4706_start:
__while_4706_continue:
  mov R0, [BP-57]
  ine R0, -1
  jf R0, __while_4706_end
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R2, [BP-57]
  mov R1, [R2]
  mov [SP], R1
  call __function_select_region
  mov R2, [BP-57]
  iadd R2, 5
  mov R1, [R2]
  cif R1
  mov [SP], R1
  mov R1, 2
  cif R1
  mov [SP+1], R1
  call __function_set_drawing_scale
  mov R2, [BP-57]
  iadd R2, 1
  mov R1, [R2]
  mov [SP], R1
  mov R2, [BP-57]
  iadd R2, 2
  mov R1, [R2]
  mov [SP+1], R1
  call __function_draw_region_zoomed_at
  mov R1, [BP-57]
  iadd R1, 20
  mov R0, [R1]
  mov [BP-57], R0
  jmp __while_4706_start
__while_4706_end:
  mov R1, 25
  mov [SP], R1
  call __function_select_region
  mov R1, 2
  cif R1
  mov [SP], R1
  mov R1, 2
  cif R1
  mov [SP+1], R1
  call __function_set_drawing_scale
  mov R1, 50
  mov [SP], R1
  mov R1, 340
  mov [SP+1], R1
  call __function_draw_region_zoomed_at
  mov R1, 1
  cif R1
  mov [SP], R1
  mov R1, 1
  cif R1
  mov [SP+1], R1
  call __function_set_drawing_scale
  mov R1, 26
  mov [SP], R1
  call __function_select_region
  mov R1, 2
  cif R1
  mov [SP], R1
  mov R1, 2
  cif R1
  mov [SP+1], R1
  call __function_set_drawing_scale
  mov R1, 60
  mov [SP], R1
  mov R1, 20
  mov [SP+1], R1
  call __function_draw_region_zoomed_at
  mov R1, 1
  cif R1
  mov [SP], R1
  mov R1, 1
  cif R1
  mov [SP+1], R1
  call __function_set_drawing_scale
  mov R1, [BP-3]
  mov [SP], R1
  lea R1, [BP-34]
  mov [SP+1], R1
  mov R1, 10
  mov [SP+2], R1
  call __function_itoa
  mov R1, 130
  mov [SP], R1
  mov R1, 10
  mov [SP+1], R1
  lea R1, [BP-34]
  mov [SP+2], R1
  call __function_print_at
__if_3408_end:
__if_3360_end:
  call __function_end_frame
  jmp __while_3292_start
__while_3292_end:
__function_main_return:
  mov SP, BP
  pop BP
  ret

__literal_string_1796:
  string "0123456789ABCDEF"
__literal_string_1906:
  string "."
__literal_string_1917:
  string "0"
