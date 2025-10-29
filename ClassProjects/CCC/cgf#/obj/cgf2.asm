; program start section
  call __global_scope_initialization
  call __function_main
  hlt

; location of global variables
  %define global_malloc_start_address 0
  %define global_malloc_end_address 1
  %define global_malloc_first_block 2
  %define global_Statement 3
  %define global_Shuffle 33
  %define global_index 813
  %define global_random 814
  %define global_Count 815
  %define global_Total 816
  %define global_CardCount 817
  %define global_type 818
  %define global_MaxCards 819
  %define global_MaxStacks 820
  %define global_GrabTimer 821
  %define global_MoveTimer 822
  %define global_MaxGrab 823
  %define global_temp 824
  %define global_SelectMod13 825
  %define global_SelectMod26 826
  %define global_RefMod13 827
  %define global_RefMod26 828
  %define global_GrabFlag 829
  %define global_StartFlag 830
  %define global_EndFlag 831
  %define global_StopFlag 832
  %define global_AutoFlag 833
  %define global_Size1 834
  %define global_Size2 835
  %define global_Size3 836
  %define global_Size4 837
  %define global_Size5 838
  %define global_Size6 839
  %define global_Size7 840
  %define global_Size8 841
  %define global_EndCount 842
  %define global_tmp 843
  %define global_Cardstack 844
  %define global_Selector 845
  %define global_Stack1 846
  %define global_Stack2 847
  %define global_Stack3 848
  %define global_Stack4 849
  %define global_Stack5 850
  %define global_Stack6 851
  %define global_Stack7 852
  %define global_Stack8 853
  %define global_Free1 854
  %define global_Free2 855
  %define global_Free3 856
  %define global_Free4 857
  %define global_Home1 858
  %define global_Home2 859
  %define global_Home3 860
  %define global_Home4 861

__global_scope_initialization:
  push BP
  mov BP, SP
  mov R0, 1048576
  mov [global_malloc_start_address], R0
  mov R0, 3145727
  mov [global_malloc_end_address], R0
  mov R0, -1
  mov [global_malloc_first_block], R0
  mov R0, 0
  mov [global_Count], R0
  mov R0, 0
  mov [global_Total], R0
  mov R0, 0
  mov [global_CardCount], R0
  mov R0, 0
  mov [global_type], R0
  mov R0, 52
  mov [global_MaxCards], R0
  mov R0, 16
  mov [global_MaxStacks], R0
  mov R0, 0
  mov [global_GrabTimer], R0
  mov R0, 0
  mov [global_MoveTimer], R0
  mov R0, 5
  mov [global_MaxGrab], R0
  mov R0, 0
  mov [global_SelectMod13], R0
  mov R0, 0
  mov [global_SelectMod26], R0
  mov R0, 0
  mov [global_RefMod13], R0
  mov R0, 0
  mov [global_RefMod26], R0
  mov R0, 0
  mov [global_GrabFlag], R0
  mov R0, 0
  mov [global_StartFlag], R0
  mov R0, 1
  mov [global_EndFlag], R0
  mov R0, 0
  mov [global_StopFlag], R0
  mov R0, 0
  mov [global_AutoFlag], R0
  mov R0, 1
  mov [global_Size1], R0
  mov R0, 1
  mov [global_Size2], R0
  mov R0, 1
  mov [global_Size3], R0
  mov R0, 1
  mov [global_Size4], R0
  mov R0, 1
  mov [global_Size5], R0
  mov R0, 1
  mov [global_Size6], R0
  mov R0, 1
  mov [global_Size7], R0
  mov R0, 1
  mov [global_Size8], R0
  mov R0, 0
  mov [global_EndCount], R0
  mov R0, -1
  mov [global_Cardstack], R0
  mov R0, -1
  mov [global_Selector], R0
  mov R0, -1
  mov [global_Stack1], R0
  mov R0, -1
  mov [global_Stack2], R0
  mov R0, -1
  mov [global_Stack3], R0
  mov R0, -1
  mov [global_Stack4], R0
  mov R0, -1
  mov [global_Stack5], R0
  mov R0, -1
  mov [global_Stack6], R0
  mov R0, -1
  mov [global_Stack7], R0
  mov R0, -1
  mov [global_Stack8], R0
  mov R0, -1
  mov [global_Free1], R0
  mov R0, -1
  mov [global_Free2], R0
  mov R0, -1
  mov [global_Free3], R0
  mov R0, -1
  mov [global_Free4], R0
  mov R0, -1
  mov [global_Home1], R0
  mov R0, -1
  mov [global_Home2], R0
  mov R0, -1
  mov [global_Home3], R0
  mov R0, -1
  mov [global_Home4], R0
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

__function_mknode:
  push BP
  mov BP, SP
  isub SP, 1
  push R1
  push R2
  isub SP, 2
  mov R0, -1
  mov [BP-1], R0
  mov R2, 15
  mov [SP], R2
  call __function_malloc
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
__if_2171_start:
  mov R0, [BP-1]
  ieq R0, -1
  jf R0, __if_2171_end
  mov R1, -12500547
  mov [SP], R1
  call __function_clear_screen
  mov R1, 25
  mov [SP], R1
  mov R1, 100
  mov [SP+1], R1
  call __function_set_drawing_point
  mov R1, __literal_string_2182
  mov [SP], R1
  call __function_print
  call __function_end_frame
  mov R0, -1
  jmp __function_mknode_return
__if_2171_end:
  mov R0, [BP+2]
  mov R1, [BP-1]
  mov [R1], R0
  mov R0, [BP+10]
  mov R1, [BP-1]
  iadd R1, 1
  mov [R1], R0
  mov R0, [BP+9]
  mov R1, [BP-1]
  iadd R1, 2
  mov [R1], R0
  mov R0, [BP+3]
  mov R1, [BP-1]
  iadd R1, 3
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP-1]
  iadd R1, 4
  mov [R1], R0
  mov R0, [BP+5]
  cif R0
  mov R1, [BP-1]
  iadd R1, 7
  mov [R1], R0
  mov R0, [BP+6]
  cif R0
  mov R1, [BP-1]
  iadd R1, 8
  mov [R1], R0
  mov R0, [BP+7]
  mov R1, [BP+5]
  imul R0, R1
  mov R1, [BP-1]
  iadd R1, 5
  mov [R1], R0
  mov R0, [BP+8]
  mov R1, [BP+6]
  imul R0, R1
  mov R1, [BP-1]
  iadd R1, 6
  mov [R1], R0
  mov R0, [BP+11]
  mov R1, [BP-1]
  iadd R1, 9
  mov [R1], R0
  mov R0, -1
  mov R1, [BP-1]
  iadd R1, 11
  mov [R1], R0
  mov R0, -1
  mov R1, [BP-1]
  iadd R1, 12
  mov [R1], R0
  mov R0, [BP-1]
__function_mknode_return:
  iadd SP, 2
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
  mov R2, 3
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
  isub SP, 1
  push R1
  push R2
__if_2261_start:
  mov R1, [BP+2]
  mov R0, [R1]
  ieq R0, -1
  jf R0, __if_2261_else
  mov R0, [BP+4]
  mov R1, [BP+2]
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+2]
  iadd R1, 1
  mov [R1], R0
  mov R0, -1
  mov R1, [BP+4]
  iadd R1, 11
  mov [R1], R0
  mov R0, -1
  mov R1, [BP+4]
  iadd R1, 12
  mov [R1], R0
  jmp __if_2261_end
__if_2261_else:
__if_2283_start:
  mov R0, [BP+3]
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  ieq R0, R1
  jf R0, __if_2283_else
  mov R0, [BP+4]
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  iadd R1, 11
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+2]
  iadd R1, 1
  mov [R1], R0
  mov R0, [BP+3]
  mov R1, [BP+4]
  iadd R1, 12
  mov [R1], R0
  mov R0, -1
  mov R1, [BP+4]
  iadd R1, 11
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+3]
  iadd R1, 11
  mov [R1], R0
  jmp __if_2283_end
__if_2283_else:
  mov R0, [BP+3]
  mov R1, [BP+4]
  iadd R1, 12
  mov [R1], R0
  mov R1, [BP+3]
  iadd R1, 11
  mov R0, [R1]
  mov R1, [BP+4]
  iadd R1, 11
  mov [R1], R0
  mov R0, -1
  mov [BP-1], R0
  mov R1, [BP+3]
  iadd R1, 11
  mov R0, [R1]
  mov [BP-1], R0
  mov R0, [BP+4]
  mov R1, [BP-1]
  iadd R1, 12
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+3]
  iadd R1, 11
  mov [R1], R0
__if_2283_end:
__if_2261_end:
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
__if_2341_start:
  mov R1, [BP+2]
  mov R0, [R1]
  ieq R0, -1
  jf R0, __if_2341_else
  mov R0, [BP+4]
  mov R1, [BP+2]
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+2]
  iadd R1, 1
  mov [R1], R0
  mov R0, -1
  mov R1, [BP+4]
  iadd R1, 11
  mov [R1], R0
  mov R0, -1
  mov R1, [BP+4]
  iadd R1, 12
  mov [R1], R0
  jmp __if_2341_end
__if_2341_else:
__if_2363_start:
  mov R0, [BP+3]
  mov R2, [BP+2]
  mov R1, [R2]
  ieq R0, R1
  jf R0, __if_2363_else
  mov R0, [BP+4]
  mov R1, [BP+2]
  mov [R1], R0
  mov R0, [BP+3]
  mov R1, [BP+4]
  iadd R1, 11
  mov [R1], R0
  mov R0, -1
  mov R1, [BP+4]
  iadd R1, 12
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+3]
  iadd R1, 12
  mov [R1], R0
  jmp __if_2363_end
__if_2363_else:
  mov R0, -1
  mov [BP-1], R0
  mov R1, [BP+3]
  iadd R1, 12
  mov R0, [R1]
  mov [BP-1], R0
  mov R0, [BP+4]
  mov R1, [BP-1]
  iadd R1, 11
  mov [R1], R0
  mov R0, [BP-1]
  mov R1, [BP+4]
  iadd R1, 12
  mov [R1], R0
  mov R0, [BP+3]
  mov R1, [BP+4]
  iadd R1, 11
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+3]
  iadd R1, 12
  mov [R1], R0
__if_2363_end:
__if_2341_end:
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
__if_2417_start:
  mov R0, [BP+2]
  ine R0, -1
  jf R0, __if_2417_end
__if_2422_start:
  mov R0, [BP+3]
  mov R0, [R0]
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  ieq R0, R1
  jf R0, __if_2422_else
  mov R1, [BP+3]
  mov R1, [R1]
  iadd R1, 12
  mov R0, [R1]
  mov R1, [BP+2]
  iadd R1, 1
  mov [R1], R0
  mov R0, -1
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  iadd R1, 11
  mov [R1], R0
__if_2442_start:
  mov R0, [BP+3]
  mov R0, [R0]
  mov R2, [BP+2]
  mov R1, [R2]
  ieq R0, R1
  jf R0, __if_2442_end
  mov R1, [BP+3]
  mov R1, [R1]
  iadd R1, 11
  mov R0, [R1]
  mov R1, [BP+2]
  mov [R1], R0
  mov R0, -1
  mov R2, [BP+2]
  mov R1, [R2]
  iadd R1, 12
  mov [R1], R0
__if_2442_end:
  jmp __if_2422_end
__if_2422_else:
__if_2462_start:
  mov R0, [BP+3]
  mov R0, [R0]
  mov R2, [BP+2]
  mov R1, [R2]
  ieq R0, R1
  jf R0, __if_2462_else
  mov R1, [BP+3]
  mov R1, [R1]
  iadd R1, 11
  mov R0, [R1]
  mov R1, [BP+2]
  mov [R1], R0
  mov R0, -1
  mov R2, [BP+2]
  mov R1, [R2]
  iadd R1, 12
  mov [R1], R0
  jmp __if_2462_end
__if_2462_else:
  mov R0, -1
  mov [BP-1], R0
  mov R1, [BP+3]
  mov R1, [R1]
  iadd R1, 12
  mov R0, [R1]
  mov [BP-1], R0
  mov R1, [BP+3]
  mov R1, [R1]
  iadd R1, 11
  mov R0, [R1]
  mov R1, [BP-1]
  iadd R1, 11
  mov [R1], R0
  mov R0, [BP-1]
  mov R2, [BP-1]
  iadd R2, 11
  mov R1, [R2]
  iadd R1, 12
  mov [R1], R0
__if_2462_end:
__if_2422_end:
  mov R0, -1
  mov R1, [BP+3]
  mov R1, [R1]
  iadd R1, 11
  mov [R1], R0
  mov R0, -1
  mov R1, [BP+3]
  mov R1, [R1]
  iadd R1, 12
  mov [R1], R0
__if_2417_end:
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
__if_2520_start:
  mov R0, [BP+2]
  ine R0, -1
  jf R0, __if_2520_end
  mov R0, -1
  mov R1, [BP+2]
  iadd R1, 11
  mov [R1], R0
  mov R1, [BP+2]
  mov [SP], R1
  call __function_free
  mov R0, -1
  mov [BP+2], R0
__if_2520_end:
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
  isub SP, 1
  push R1
  push R2
  isub SP, 2
  mov R0, -1
  mov [BP-1], R0
  mov R1, [BP+2]
  mov R0, [R1]
  mov [BP-1], R0
__while_2545_start:
__while_2545_continue:
  mov R0, [BP-1]
  ine R0, -1
  jf R0, __while_2545_end
  mov R2, [BP+2]
  mov [SP], R2
  lea R2, [BP-1]
  mov [SP+1], R2
  call __function_obtain
  mov R1, R0
  mov [BP+2], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  call __function_rmnode
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R1, [BP+2]
  mov R0, [R1]
  mov [BP-1], R0
  jmp __while_2545_start
__while_2545_end:
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
  mov R0, -1
  mov [BP+2], R0
  mov R0, [BP+2]
__function_rmlist_return:
  iadd SP, 1
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_mkstack:
  push BP
  mov BP, SP
  isub SP, 1
  push R1
  push R2
  isub SP, 1
  mov R2, 11
  mov [SP], R2
  call __function_malloc
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R0, [BP+2]
  mov R1, [BP-1]
  iadd R1, 2
  mov [R1], R0
  mov R0, -1
  mov R1, [BP-1]
  mov [R1], R0
  call __function_mklist
  mov R1, R0
  mov R2, [BP-1]
  iadd R2, 1
  mov [R2], R1
  mov R0, R1
  mov R0, [BP-1]
__function_mkstack_return:
  iadd SP, 1
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_rmstack:
  push BP
  mov BP, SP
  push R1
  push R2
  push R3
  isub SP, 1
  mov R3, [BP+2]
  iadd R3, 1
  mov R2, [R3]
  mov [SP], R2
  call __function_clearlist
  mov R1, R0
  mov R2, [BP+2]
  iadd R2, 1
  mov [R2], R1
  mov R0, R1
  mov R3, [BP+2]
  iadd R3, 1
  mov R2, [R3]
  mov [SP], R2
  call __function_rmlist
  mov R1, R0
  mov R2, [BP+2]
  iadd R2, 1
  mov [R2], R1
  mov R0, R1
  mov R1, [BP+2]
  mov [SP], R1
  call __function_free
  mov R0, -1
  mov [BP+2], R0
  mov R0, [BP+2]
__function_rmstack_return:
  iadd SP, 1
  pop R3
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_pop:
  push BP
  mov BP, SP
  push R1
  push R2
  push R3
  push R4
  isub SP, 2
__if_2625_start:
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  iadd R1, 2
  mov R0, [R1]
  ige R0, 1
  jf R0, __LogicalAnd_ShortCircuit_2633
  mov R1, [BP+2]
  ine R1, -1
  and R0, R1
__LogicalAnd_ShortCircuit_2633:
  jt R0, __LogicalOr_ShortCircuit_2636
  mov R2, [BP+2]
  iadd R2, 10
  mov R1, [R2]
  ieq R1, 4
  jf R1, __LogicalAnd_ShortCircuit_2645
  mov R4, [BP+2]
  iadd R4, 1
  mov R3, [R4]
  iadd R3, 2
  mov R2, [R3]
  ige R2, 0
  and R1, R2
__LogicalAnd_ShortCircuit_2645:
  jf R1, __LogicalAnd_ShortCircuit_2649
  mov R2, [BP+2]
  ine R2, -1
  and R1, R2
__LogicalAnd_ShortCircuit_2649:
  or R0, R1
__LogicalOr_ShortCircuit_2636:
  jf R0, __if_2625_end
  mov R3, [BP+2]
  iadd R3, 1
  mov R2, [R3]
  mov [SP], R2
  mov R2, [BP+3]
  mov [SP+1], R2
  call __function_obtain
  mov R1, R0
  mov R2, [BP+2]
  iadd R2, 1
  mov [R2], R1
  mov R0, R1
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  mov R1, [BP+2]
  mov [R1], R0
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  iadd R1, 2
  mov R0, [R1]
  isub R0, 1
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  iadd R1, 2
  mov [R1], R0
__if_2625_end:
  mov R0, [BP+2]
__function_pop_return:
  iadd SP, 2
  pop R4
  pop R3
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_push:
  push BP
  mov BP, SP
  push R1
  push R2
  push R3
  isub SP, 3
__if_2676_start:
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  iadd R1, 2
  mov R0, [R1]
  mov R2, [BP+2]
  iadd R2, 2
  mov R1, [R2]
  ilt R0, R1
  jf R0, __LogicalAnd_ShortCircuit_2684
  mov R1, [BP+2]
  ine R1, -1
  and R0, R1
__LogicalAnd_ShortCircuit_2684:
  jf R0, __if_2676_end
  mov R3, [BP+2]
  iadd R3, 1
  mov R2, [R3]
  mov [SP], R2
  mov R3, [BP+2]
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [BP+3]
  mov [SP+2], R2
  call __function_append
  mov R1, R0
  mov R2, [BP+2]
  iadd R2, 1
  mov [R2], R1
  mov R0, R1
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  mov R1, [BP+2]
  mov [R1], R0
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  iadd R1, 2
  mov R0, [R1]
  iadd R0, 1
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  iadd R1, 2
  mov [R1], R0
__if_2676_end:
  mov R0, [BP+2]
__function_push_return:
  iadd SP, 3
  pop R3
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_Refresh_Stack:
  push BP
  mov BP, SP
  push R1
  push R2
  isub SP, 1
  mov R2, [BP+2]
  mov [SP], R2
  call __function_rmstack
  mov R1, R0
  mov [BP+2], R1
  mov R0, R1
  mov R0, -1
  mov [BP+2], R0
  mov R2, [BP+3]
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [BP+2], R1
  mov R0, R1
  mov R0, [BP+2]
__function_Refresh_Stack_return:
  iadd SP, 1
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_mkstacklist:
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
__function_mkstacklist_return:
  iadd SP, 1
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_SLadd:
  push BP
  mov BP, SP
  isub SP, 1
  push R1
  push R2
__if_2747_start:
  mov R1, [BP+2]
  mov R0, [R1]
  ieq R0, -1
  jf R0, __if_2747_else
  mov R0, [BP+4]
  mov R1, [BP+2]
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+2]
  iadd R1, 1
  mov [R1], R0
  mov R0, -1
  mov R1, [BP+4]
  iadd R1, 5
  mov [R1], R0
  mov R0, -1
  mov R1, [BP+4]
  iadd R1, 6
  mov [R1], R0
  jmp __if_2747_end
__if_2747_else:
__if_2769_start:
  mov R0, [BP+3]
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  ieq R0, R1
  jf R0, __if_2769_else
  mov R0, [BP+4]
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  iadd R1, 5
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+2]
  iadd R1, 1
  mov [R1], R0
  mov R0, [BP+3]
  mov R1, [BP+4]
  iadd R1, 6
  mov [R1], R0
  mov R0, -1
  mov R1, [BP+4]
  iadd R1, 5
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+3]
  iadd R1, 5
  mov [R1], R0
  jmp __if_2769_end
__if_2769_else:
  mov R0, [BP+3]
  mov R1, [BP+4]
  iadd R1, 6
  mov [R1], R0
  mov R1, [BP+3]
  iadd R1, 5
  mov R0, [R1]
  mov R1, [BP+4]
  iadd R1, 5
  mov [R1], R0
  mov R0, -1
  mov [BP-1], R0
  mov R1, [BP+3]
  iadd R1, 5
  mov R0, [R1]
  mov [BP-1], R0
  mov R0, [BP+4]
  mov R1, [BP-1]
  iadd R1, 6
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+3]
  iadd R1, 5
  mov [R1], R0
__if_2769_end:
__if_2747_end:
  mov R0, [BP+2]
__function_SLadd_return:
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_SLup:
  push BP
  mov BP, SP
  push R1
__if_2827_start:
  mov R0, [BP+3]
  ine R0, -1
  jf R0, __if_2827_end
  mov R0, [BP+4]
  mov R1, [BP+3]
  iadd R1, 7
  mov [R1], R0
  mov R0, [BP+3]
  mov R1, [BP+4]
  iadd R1, 8
  mov [R1], R0
  mov R0, -1
  mov R1, [BP+4]
  iadd R1, 7
  mov [R1], R0
  mov R0, -1
  mov R1, [BP+3]
  iadd R1, 8
  mov [R1], R0
__if_2827_end:
  mov R0, [BP+2]
__function_SLup_return:
  pop R1
  mov SP, BP
  pop BP
  ret

__function_ObjectsOverlap:
  push BP
  mov BP, SP
  push R1
  push R2
  push R3
__if_2853_start:
  mov R1, [BP+2]
  iadd R1, 3
  mov R0, [R1]
  mov R2, [BP+2]
  iadd R2, 5
  mov R1, [R2]
  idiv R1, 2
  isub R0, R1
  mov R2, [BP+3]
  iadd R2, 3
  mov R1, [R2]
  mov R3, [BP+3]
  iadd R3, 5
  mov R2, [R3]
  idiv R2, 2
  iadd R1, R2
  ige R0, R1
  jf R0, __if_2853_end
  mov R0, 0
  jmp __function_ObjectsOverlap_return
__if_2853_end:
__if_2873_start:
  mov R1, [BP+2]
  iadd R1, 3
  mov R0, [R1]
  mov R2, [BP+2]
  iadd R2, 5
  mov R1, [R2]
  idiv R1, 2
  iadd R0, R1
  mov R2, [BP+3]
  iadd R2, 3
  mov R1, [R2]
  mov R3, [BP+3]
  iadd R3, 5
  mov R2, [R3]
  idiv R2, 2
  isub R1, R2
  ile R0, R1
  jf R0, __if_2873_end
  mov R0, 0
  jmp __function_ObjectsOverlap_return
__if_2873_end:
__if_2893_start:
  mov R1, [BP+2]
  iadd R1, 4
  mov R0, [R1]
  mov R2, [BP+2]
  iadd R2, 6
  mov R1, [R2]
  idiv R1, 2
  isub R0, R1
  mov R2, [BP+3]
  iadd R2, 4
  mov R1, [R2]
  mov R3, [BP+3]
  iadd R3, 6
  mov R2, [R3]
  idiv R2, 2
  iadd R1, R2
  ige R0, R1
  jf R0, __if_2893_end
  mov R0, 0
  jmp __function_ObjectsOverlap_return
__if_2893_end:
__if_2913_start:
  mov R1, [BP+2]
  iadd R1, 4
  mov R0, [R1]
  mov R2, [BP+2]
  iadd R2, 6
  mov R1, [R2]
  idiv R1, 2
  iadd R0, R1
  mov R2, [BP+3]
  iadd R2, 4
  mov R1, [R2]
  mov R3, [BP+3]
  iadd R3, 6
  mov R2, [R3]
  idiv R2, 2
  isub R1, R2
  ile R0, R1
  jf R0, __if_2913_end
  mov R0, 0
  jmp __function_ObjectsOverlap_return
__if_2913_end:
  mov R0, 1
__function_ObjectsOverlap_return:
  pop R3
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_Give_Card:
  push BP
  mov BP, SP
  isub SP, 3
__if_2940_start:
  mov R0, [BP+3]
  ine R0, -1
  jf R0, __if_2940_end
  mov R1, [BP+3]
  mov R0, [R1]
  mov [BP-1], R0
  mov R2, [BP+3]
  mov [SP], R2
  lea R2, [BP-1]
  mov [SP+1], R2
  call __function_pop
  mov R1, R0
  mov [BP+3], R1
  mov R0, R1
__if_2955_start:
  mov R2, [BP+2]
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  ine R0, 61
  jf R0, __if_2955_end
  mov R1, [BP+2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP+4]
  iadd R0, R1
  mov R1, [BP+2]
  iadd R1, 3
  mov [R1], R0
  mov R1, [BP+2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP+5]
  iadd R0, R1
  mov R1, [BP+2]
  iadd R1, 4
  mov [R1], R0
__if_2955_end:
  mov R1, [BP+2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP-1]
  iadd R1, 3
  mov [R1], R0
  mov R1, [BP+2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP-1]
  iadd R1, 4
  mov [R1], R0
  mov R2, [BP+2]
  mov [SP], R2
  mov R2, [BP-1]
  mov [SP+1], R2
  call __function_push
  mov R1, R0
  mov [BP+2], R1
  mov R0, R1
  mov R0, 0
  mov [global_GrabTimer], R0
__if_2940_end:
__function_Give_Card_return:
  mov SP, BP
  pop BP
  ret

__function_Give_Cards:
  push BP
  mov BP, SP
  isub SP, 5
__if_2994_start:
  mov R0, [BP+6]
  mov R3, [BP+3]
  iadd R3, 1
  mov R2, [R3]
  iadd R2, 2
  mov R1, [R2]
  ile R0, R1
  jf R0, __LogicalAnd_ShortCircuit_3003
  mov R3, [BP+2]
  iadd R3, 1
  mov R2, [R3]
  iadd R2, 2
  mov R1, [R2]
  mov R2, [BP+6]
  iadd R1, R2
  mov R3, [BP+2]
  iadd R3, 2
  mov R2, [R3]
  ile R1, R2
  and R0, R1
__LogicalAnd_ShortCircuit_3003:
  jf R0, __if_2994_end
  mov R0, 0
  mov [BP-1], R0
__for_3010_start:
  mov R0, [BP-1]
  mov R1, [BP+6]
  ilt R0, R1
  jf R0, __for_3010_end
  mov R1, [BP+2]
  mov [SP], R1
  mov R1, [BP+3]
  mov [SP+1], R1
  mov R1, [BP+4]
  mov [SP+2], R1
  mov R1, [BP+5]
  mov [SP+3], R1
  call __function_Give_Card
__for_3010_continue:
  mov R0, [BP-1]
  mov R1, R0
  iadd R1, 1
  mov [BP-1], R1
  jmp __for_3010_start
__for_3010_end:
__if_2994_end:
__function_Give_Cards_return:
  mov SP, BP
  pop BP
  ret

__function_Print_Stack:
  push BP
  mov BP, SP
  isub SP, 3
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  mov R0, [R1]
  mov [BP-1], R0
__while_3032_start:
__while_3032_continue:
  mov R0, [BP-1]
  ine R0, -1
  jf R0, __while_3032_end
  mov R2, [BP-1]
  iadd R2, 2
  mov R1, [R2]
  mov [SP], R1
  call __function_select_texture
  mov R2, [BP-1]
  iadd R2, 1
  mov R1, [R2]
  mov [SP], R1
  call __function_select_region
  mov R2, [BP-1]
  iadd R2, 7
  mov R1, [R2]
  mov [SP], R1
  mov R2, [BP-1]
  iadd R2, 8
  mov R1, [R2]
  mov [SP+1], R1
  call __function_set_drawing_scale
  mov R2, [BP-1]
  iadd R2, 3
  mov R1, [R2]
  mov [SP], R1
  mov R2, [BP-1]
  iadd R2, 4
  mov R1, [R2]
  mov [SP+1], R1
  call __function_draw_region_zoomed_at
  mov R1, [BP-1]
  iadd R1, 11
  mov R0, [R1]
  mov [BP-1], R0
  jmp __while_3032_start
__while_3032_end:
__function_Print_Stack_return:
  mov SP, BP
  pop BP
  ret

__function_Print_Card:
  push BP
  mov BP, SP
  isub SP, 2
  mov R2, [BP+2]
  iadd R2, 2
  mov R1, [R2]
  mov [SP], R1
  call __function_select_texture
__if_3063_start:
  mov R0, [BP+3]
  ieq R0, 1
  jf R0, __if_3063_else
  mov R2, [BP+2]
  iadd R2, 9
  mov R1, [R2]
  mov [SP], R1
  call __function_select_region
  jmp __if_3063_end
__if_3063_else:
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  mov [SP], R1
  call __function_select_region
__if_3063_end:
  mov R2, [BP+2]
  iadd R2, 7
  mov R1, [R2]
  mov [SP], R1
  mov R2, [BP+2]
  iadd R2, 8
  mov R1, [R2]
  mov [SP+1], R1
  call __function_set_drawing_scale
  mov R2, [BP+2]
  iadd R2, 3
  mov R1, [R2]
  mov [SP], R1
  mov R2, [BP+2]
  iadd R2, 4
  mov R1, [R2]
  mov [SP+1], R1
  call __function_draw_region_zoomed_at
__function_Print_Card_return:
  mov SP, BP
  pop BP
  ret

__function_Print_Value:
  push BP
  mov BP, SP
  isub SP, 3
  mov R1, [BP+2]
  mov [SP], R1
  mov R1, global_Statement
  mov [SP+1], R1
  mov R1, 10
  mov [SP+2], R1
  call __function_itoa
  mov R1, [BP+3]
  mov [SP], R1
  mov R1, [BP+4]
  mov [SP+1], R1
  mov R1, global_Statement
  mov [SP+2], R1
  call __function_print_at
__function_Print_Value_return:
  mov SP, BP
  pop BP
  ret

__function_Print_Text:
  push BP
  mov BP, SP
  isub SP, 3
  mov R1, [BP+6]
  mov [SP], R1
  call __function_select_texture
  mov R0, [BP+2]
  mov [BP-1], R0
__while_3108_start:
__while_3108_continue:
  mov R0, [BP+4]
  mov R0, [R0]
  cib R0
  jf R0, __while_3108_end
  mov R1, [BP+4]
  mov R1, [R1]
  mov [SP], R1
  call __function_select_region
  mov R1, [BP+5]
  mov [SP], R1
  mov R1, [BP+5]
  mov [SP+1], R1
  call __function_set_drawing_scale
  mov R1, [BP-1]
  cfi R1
  mov [SP], R1
  mov R1, [BP+3]
  cfi R1
  mov [SP+1], R1
  call __function_draw_region_zoomed_at
  mov R0, [BP-1]
  mov R1, [BP+5]
  fmul R1, 32.000000
  fadd R1, 1.000000
  fadd R0, R1
  mov [BP-1], R0
__if_3129_start:
  mov R0, [BP+4]
  mov R0, [R0]
  ieq R0, 10
  jf R0, __if_3129_end
  mov R0, [BP+3]
  mov R1, [BP+5]
  fmul R1, 32.000000
  fadd R1, 8.000000
  fadd R0, R1
  mov [BP+3], R0
__if_3129_end:
  mov R0, [BP+4]
  iadd R0, 1
  mov [BP+4], R0
  jmp __while_3108_start
__while_3108_end:
__function_Print_Text_return:
  mov SP, BP
  pop BP
  ret

__function_Play_Sound:
  push BP
  mov BP, SP
  isub SP, 1
  mov R1, [BP+2]
  mov [SP], R1
  call __function_select_sound
  mov R1, [BP+2]
  mov [SP], R1
  call __function_play_sound
__function_Play_Sound_return:
  mov SP, BP
  pop BP
  ret

__function_Stack_Pos:
  push BP
  mov BP, SP
  mov R0, [BP+3]
  mov R1, [BP+2]
  iadd R1, 3
  mov [R1], R0
  mov R0, [BP+4]
  mov R1, [BP+2]
  iadd R1, 4
  mov [R1], R0
__function_Stack_Pos_return:
  mov SP, BP
  pop BP
  ret

__function_Empty_Stack:
  push BP
  mov BP, SP
  isub SP, 11
  mov R1, 1
  mov [SP], R1
  mov R2, [BP+2]
  iadd R2, 3
  mov R1, [R2]
  mov [SP+1], R1
  mov R2, [BP+2]
  iadd R2, 4
  mov R1, [R2]
  mov [SP+2], R1
  mov R1, 1
  mov [SP+3], R1
  mov R1, 1
  mov [SP+4], R1
  mov R1, 55
  mov [SP+5], R1
  mov R1, 95
  mov [SP+6], R1
  mov R1, 1
  mov [SP+7], R1
  mov R1, 61
  mov [SP+8], R1
  mov R1, 60
  mov [SP+9], R1
  call __function_mknode
  mov [BP-1], R0
  mov R2, [BP+2]
  mov [SP], R2
  mov R2, [BP-1]
  mov [SP+1], R2
  call __function_push
  mov R1, R0
  mov [BP+2], R1
  mov R0, R1
__function_Empty_Stack_return:
  mov SP, BP
  pop BP
  ret

__function_Move_Stack:
  push BP
  mov BP, SP
  isub SP, 1
  mov R3, [BP+2]
  iadd R3, 1
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 11
  mov R0, [R1]
  mov [BP-1], R0
__while_3195_start:
__while_3195_continue:
  mov R0, [BP-1]
  ine R0, -1
  jf R0, __while_3195_end
  mov R2, [BP-1]
  iadd R2, 12
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP+3]
  iadd R0, R1
  mov R1, [BP-1]
  iadd R1, 3
  mov [R1], R0
  mov R2, [BP-1]
  iadd R2, 12
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP+4]
  iadd R0, R1
  mov R1, [BP-1]
  iadd R1, 4
  mov [R1], R0
  mov R1, [BP-1]
  iadd R1, 11
  mov R0, [R1]
  mov [BP-1], R0
  jmp __while_3195_start
__while_3195_end:
__function_Move_Stack_return:
  mov SP, BP
  pop BP
  ret

__function_Place_Cards:
  push BP
  mov BP, SP
  isub SP, 6
  mov R0, 0
  mov [BP-1], R0
__while_3226_start:
__while_3226_continue:
  mov R3, [BP+2]
  iadd R3, 1
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 11
  mov R0, [R1]
  ine R0, -1
  jf R0, __while_3226_end
  mov R3, [BP+2]
  iadd R3, 1
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 11
  mov R0, [R1]
  mov [BP-2], R0
  mov R2, [BP+2]
  iadd R2, 9
  mov R1, [R2]
  iadd R1, 10
  mov R0, [R1]
  mov [BP-3], R0
__if_3245_start:
  mov R3, [BP+2]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  ieq R0, 61
  jf R0, __LogicalAnd_ShortCircuit_3253
  mov R1, [BP-1]
  ieq R1, 0
  and R0, R1
__LogicalAnd_ShortCircuit_3253:
  jt R0, __LogicalOr_ShortCircuit_3257
  mov R1, [BP-3]
  ieq R1, 1
  or R0, R1
__LogicalOr_ShortCircuit_3257:
  jt R0, __LogicalOr_ShortCircuit_3261
  mov R1, [BP-3]
  ieq R1, 2
  or R0, R1
__LogicalOr_ShortCircuit_3261:
  jf R0, __if_3245_else
  mov R2, [BP+3]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 3
  mov [R1], R0
  mov R2, [BP+3]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 4
  mov [R1], R0
  mov R0, 1
  mov [BP-1], R0
  jmp __if_3245_end
__if_3245_else:
__if_3280_start:
  mov R0, [BP-1]
  ieq R0, 1
  jf R0, __if_3280_end
  mov R1, [BP+2]
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 17
  mov [SP+2], R1
  call __function_Move_Stack
__if_3280_end:
__if_3245_end:
  mov R3, [BP+2]
  iadd R3, 1
  mov R2, [R3]
  mov [SP], R2
  lea R2, [BP-2]
  mov [SP+1], R2
  call __function_obtain
  mov R1, R0
  mov R2, [BP+2]
  iadd R2, 1
  mov [R2], R1
  mov R0, R1
  mov R3, [BP+2]
  iadd R3, 9
  mov R2, [R3]
  mov [SP], R2
  mov R2, [BP-2]
  mov [SP+1], R2
  call __function_push
  mov R1, R0
  mov R2, [BP+2]
  iadd R2, 9
  mov [R2], R1
  mov R0, R1
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  iadd R1, 2
  mov R0, [R1]
  isub R0, 1
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  iadd R1, 2
  mov [R1], R0
  jmp __while_3226_start
__while_3226_end:
  mov R0, [BP+3]
  mov R1, [BP+2]
  mov [R1], R0
  mov R2, [BP+2]
  iadd R2, 9
  mov R1, [R2]
  mov R0, [R1]
  mov R1, [BP+3]
  iadd R1, 13
  mov [R1], R0
  mov R0, 0
  mov [global_GrabTimer], R0
  mov R0, 0
  mov [global_GrabFlag], R0
__function_Place_Cards_return:
  mov SP, BP
  pop BP
  ret

__function_Card_Count:
  push BP
  mov BP, SP
  push R1
__while_3328_start:
__while_3328_continue:
  mov R0, [BP+2]
  ine R0, -1
  jf R0, __while_3328_end
  mov R0, [BP+3]
  iadd R0, 1
  mov [BP+3], R0
  mov R1, [BP+2]
  iadd R1, 11
  mov R0, [R1]
  mov [BP+2], R0
  jmp __while_3328_start
__while_3328_end:
  mov R0, [BP+3]
__function_Card_Count_return:
  pop R1
  mov SP, BP
  pop BP
  ret

__function_Grab_Amount:
  push BP
  mov BP, SP
  push R1
  push R2
__while_3345_start:
__while_3345_continue:
  mov R1, [BP+2]
  iadd R1, 10
  mov R0, [R1]
  ieq R0, 1
  jf R0, __while_3345_end
__if_3351_start:
  mov R2, [BP+2]
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  ine R0, 61
  jf R0, __if_3351_end
  mov R0, [BP+3]
  isub R0, 1
  mov [BP+3], R0
__if_3351_end:
  mov R1, [BP+2]
  iadd R1, 5
  mov R0, [R1]
  mov [BP+2], R0
  jmp __while_3345_start
__while_3345_end:
  mov R0, [BP+3]
__function_Grab_Amount_return:
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_Grab_Check:
  push BP
  mov BP, SP
  isub SP, 2
  push R1
  push R2
  mov R0, 0
  mov [BP-1], R0
__while_3372_start:
__while_3372_continue:
  mov R1, [BP+2]
  iadd R1, 11
  mov R0, [R1]
  ine R0, -1
  jf R0, __while_3372_end
  mov R2, [BP+2]
  iadd R2, 11
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  imod R0, 13
  mov [BP-2], R0
__if_3385_start:
  mov R0, [BP-2]
  ieq R0, 0
  jf R0, __if_3385_end
  mov R0, 13
  mov [BP-2], R0
__if_3385_end:
__if_3393_start:
  mov R0, [BP-2]
  mov R2, [BP+2]
  iadd R2, 1
  mov R1, [R2]
  imod R1, 13
  isub R1, 1
  ine R0, R1
  jf R0, __if_3393_end
  mov R0, 1
  mov [BP-1], R0
__if_3393_end:
  mov R1, [BP+2]
  iadd R1, 11
  mov R0, [R1]
  mov [BP+2], R0
  jmp __while_3372_start
__while_3372_end:
  mov R0, [BP-1]
__function_Grab_Check_return:
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_End_Check:
  push BP
  mov BP, SP
  isub SP, 4
  push R1
  push R2
  push R3
  push R4
  mov R0, 5
  mov [BP-1], R0
__if_3417_start:
  mov R3, [BP+2]
  iadd R3, 1
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 11
  mov R0, [R1]
  ine R0, -1
  jf R0, __if_3417_else
__if_3425_start:
  mov R4, [BP+2]
  iadd R4, 1
  mov R3, [R4]
  mov R2, [R3]
  iadd R2, 11
  mov R1, [R2]
  iadd R1, 11
  mov R0, [R1]
  ine R0, -1
  jf R0, __if_3425_end
  mov R4, [BP+2]
  iadd R4, 1
  mov R3, [R4]
  mov R2, [R3]
  iadd R2, 11
  mov R1, [R2]
  iadd R1, 11
  mov R0, [R1]
  mov [BP-2], R0
  mov R0, 0
  mov [BP-1], R0
__while_3444_start:
__while_3444_continue:
  mov R0, [BP-2]
  ine R0, -1
  jf R0, __while_3444_end
  mov R2, [BP-2]
  iadd R2, 12
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  imod R0, 13
  mov [BP-3], R0
__if_3456_start:
  mov R0, [BP-3]
  ieq R0, 0
  jf R0, __if_3456_end
  mov R0, 13
  mov [BP-3], R0
__if_3456_end:
  mov R1, [BP-2]
  iadd R1, 1
  mov R0, [R1]
  imod R0, 13
  mov [BP-4], R0
__if_3470_start:
  mov R0, [BP-4]
  ieq R0, 0
  jf R0, __if_3470_end
  mov R0, 13
  mov [BP-4], R0
__if_3470_end:
__if_3478_start:
  mov R0, [BP-4]
  iadd R0, 1
  mov R1, [BP-3]
  ine R0, R1
  jf R0, __if_3478_end
  mov R0, 1
  mov [BP-1], R0
__if_3478_end:
  mov R1, [BP-2]
  iadd R1, 11
  mov R0, [R1]
  mov [BP-2], R0
  jmp __while_3444_start
__while_3444_end:
__if_3425_end:
  jmp __if_3417_end
__if_3417_else:
__if_3492_start:
  mov R2, [BP+2]
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  ieq R0, 61
  jf R0, __if_3492_end
  mov R0, 0
  mov [BP-1], R0
__if_3492_end:
__if_3417_end:
  mov R0, [BP-1]
__function_End_Check_return:
  pop R4
  pop R3
  pop R2
  pop R1
  mov SP, BP
  pop BP
  ret

__function_Grab_Cards:
  push BP
  mov BP, SP
  isub SP, 2
__while_3508_start:
__while_3508_continue:
  mov R0, [BP+4]
  ine R0, 0
  jf R0, __while_3508_end
  mov R2, [BP+3]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 11
  mov R0, [R1]
  mov [global_tmp], R0
__while_3518_start:
__while_3518_continue:
  mov R0, [global_tmp]
  ine R0, -1
  jf R0, __while_3518_end
  mov R1, [global_tmp]
  iadd R1, 4
  mov R0, [R1]
  isub R0, 17
  mov R1, [global_tmp]
  iadd R1, 4
  mov [R1], R0
  mov R1, [global_tmp]
  iadd R1, 11
  mov R0, [R1]
  mov [global_tmp], R0
  jmp __while_3518_start
__while_3518_end:
__if_3531_start:
  mov R2, [BP+3]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 11
  mov R0, [R1]
  ine R0, -1
  jf R0, __if_3531_else
  mov R2, [BP+3]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 11
  mov R0, [R1]
  mov [global_tmp], R0
  jmp __if_3531_end
__if_3531_else:
__if_3543_start:
  mov R2, [BP+3]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  ine R0, 61
  jf R0, __if_3543_end
  mov R2, [BP+3]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 12
  mov R0, [R1]
  mov [global_tmp], R0
__if_3543_end:
__if_3531_end:
  mov R3, [BP+2]
  iadd R3, 9
  mov R2, [R3]
  mov [SP], R2
  mov R2, [BP+3]
  iadd R2, 13
  mov [SP+1], R2
  call __function_pop
  mov R1, R0
  mov R2, [BP+2]
  iadd R2, 9
  mov [R2], R1
  mov R0, R1
  mov R2, [BP+2]
  mov [SP], R2
  mov R3, [BP+3]
  iadd R3, 13
  mov R2, [R3]
  mov [SP+1], R2
  call __function_push
  mov R1, R0
  mov [BP+2], R1
  mov R0, R1
  mov R0, [global_tmp]
  mov R1, [BP+3]
  iadd R1, 13
  mov [R1], R0
  mov R0, [BP+4]
  isub R0, 1
  mov [BP+4], R0
  jmp __while_3508_start
__while_3508_end:
__function_Grab_Cards_return:
  mov SP, BP
  pop BP
  ret

__function_Placement:
  push BP
  mov BP, SP
  isub SP, 2
  mov R0, 0
  mov [global_Total], R0
__if_3583_start:
  mov R2, [BP+2]
  iadd R2, 9
  mov R1, [R2]
  iadd R1, 10
  mov R0, [R1]
  ieq R0, 2
  jf R0, __LogicalAnd_ShortCircuit_3590
  mov R1, [global_CardCount]
  ieq R1, 1
  and R0, R1
__LogicalAnd_ShortCircuit_3590:
  jf R0, __if_3583_end
__if_3594_start:
  mov R2, [BP+3]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  ieq R0, 61
  jf R0, __LogicalAnd_ShortCircuit_3601
  mov R1, [global_SelectMod13]
  ieq R1, 1
  and R0, R1
__LogicalAnd_ShortCircuit_3601:
  jf R0, __if_3594_else
  mov R0, 1
  mov [global_Total], R0
  mov R1, [BP+2]
  mov [SP], R1
  mov R1, [BP+3]
  mov [SP+1], R1
  call __function_Place_Cards
  jmp __if_3594_end
__if_3594_else:
__if_3611_start:
  mov R2, [BP+3]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  iadd R0, 1
  mov R5, [BP+2]
  iadd R5, 1
  mov R4, [R5]
  mov R3, [R4]
  iadd R3, 11
  mov R2, [R3]
  iadd R2, 1
  mov R1, [R2]
  ieq R0, R1
  jf R0, __if_3611_end
  mov R0, 1
  mov [global_Total], R0
  mov R1, [BP+2]
  mov [SP], R1
  mov R1, [BP+3]
  mov [SP+1], R1
  call __function_Place_Cards
__if_3611_end:
__if_3594_end:
__if_3583_end:
__if_3630_start:
  mov R2, [BP+2]
  iadd R2, 9
  mov R1, [R2]
  iadd R1, 10
  mov R0, [R1]
  ieq R0, 3
  jf R0, __if_3630_else
__if_3637_start:
  mov R0, [global_temp]
  imod R0, 13
  ine R0, 0
  jf R0, __if_3637_else
__if_3644_start:
  mov R0, [global_RefMod13]
  isub R0, 1
  mov R1, [global_temp]
  imod R1, 13
  ieq R0, R1
  jf R0, __LogicalAnd_ShortCircuit_3655
  mov R3, [BP+3]
  iadd R3, 13
  mov R2, [R3]
  iadd R2, 1
  mov R1, [R2]
  ile R1, 26
  and R0, R1
__LogicalAnd_ShortCircuit_3655:
  jf R0, __LogicalAnd_ShortCircuit_3663
  mov R5, [BP+2]
  iadd R5, 1
  mov R4, [R5]
  mov R3, [R4]
  iadd R3, 11
  mov R2, [R3]
  iadd R2, 1
  mov R1, [R2]
  igt R1, 26
  and R0, R1
__LogicalAnd_ShortCircuit_3663:
  jf R0, __if_3644_else
  mov R0, 1
  mov [global_Total], R0
  mov R1, [BP+2]
  mov [SP], R1
  mov R1, [BP+3]
  mov [SP+1], R1
  call __function_Place_Cards
  jmp __if_3644_end
__if_3644_else:
__if_3673_start:
  mov R0, [global_RefMod13]
  isub R0, 1
  mov R1, [global_temp]
  imod R1, 13
  ieq R0, R1
  jf R0, __LogicalAnd_ShortCircuit_3684
  mov R3, [BP+3]
  iadd R3, 13
  mov R2, [R3]
  iadd R2, 1
  mov R1, [R2]
  igt R1, 26
  and R0, R1
__LogicalAnd_ShortCircuit_3684:
  jf R0, __LogicalAnd_ShortCircuit_3692
  mov R5, [BP+2]
  iadd R5, 1
  mov R4, [R5]
  mov R3, [R4]
  iadd R3, 11
  mov R2, [R3]
  iadd R2, 1
  mov R1, [R2]
  ile R1, 26
  and R0, R1
__LogicalAnd_ShortCircuit_3692:
  jf R0, __if_3673_else
  mov R0, 1
  mov [global_Total], R0
  mov R1, [BP+2]
  mov [SP], R1
  mov R1, [BP+3]
  mov [SP+1], R1
  call __function_Place_Cards
  jmp __if_3673_end
__if_3673_else:
__if_3702_start:
  mov R2, [BP+3]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  ieq R0, 61
  jf R0, __if_3702_end
  mov R0, 1
  mov [global_Total], R0
  mov R1, [BP+2]
  mov [SP], R1
  mov R1, [BP+3]
  mov [SP+1], R1
  call __function_Place_Cards
__if_3702_end:
__if_3673_end:
__if_3644_end:
  jmp __if_3637_end
__if_3637_else:
__if_3715_start:
  mov R0, [global_temp]
  imod R0, 13
  ieq R0, 0
  jf R0, __if_3715_end
  mov R0, 13
  mov [global_temp], R0
__if_3725_start:
  mov R0, [global_RefMod13]
  isub R0, 1
  mov R1, [global_temp]
  ieq R0, R1
  jf R0, __LogicalAnd_ShortCircuit_3734
  mov R3, [BP+3]
  iadd R3, 13
  mov R2, [R3]
  iadd R2, 1
  mov R1, [R2]
  ile R1, 26
  and R0, R1
__LogicalAnd_ShortCircuit_3734:
  jf R0, __LogicalAnd_ShortCircuit_3742
  mov R5, [BP+2]
  iadd R5, 1
  mov R4, [R5]
  mov R3, [R4]
  iadd R3, 11
  mov R2, [R3]
  iadd R2, 1
  mov R1, [R2]
  igt R1, 26
  and R0, R1
__LogicalAnd_ShortCircuit_3742:
  jf R0, __if_3725_else
  mov R0, 1
  mov [global_Total], R0
  mov R1, [BP+2]
  mov [SP], R1
  mov R1, [BP+3]
  mov [SP+1], R1
  call __function_Place_Cards
  jmp __if_3725_end
__if_3725_else:
__if_3752_start:
  mov R0, [global_RefMod13]
  isub R0, 1
  mov R1, [global_temp]
  ieq R0, R1
  jf R0, __LogicalAnd_ShortCircuit_3761
  mov R3, [BP+3]
  iadd R3, 13
  mov R2, [R3]
  iadd R2, 1
  mov R1, [R2]
  igt R1, 26
  and R0, R1
__LogicalAnd_ShortCircuit_3761:
  jf R0, __LogicalAnd_ShortCircuit_3769
  mov R5, [BP+2]
  iadd R5, 1
  mov R4, [R5]
  mov R3, [R4]
  iadd R3, 11
  mov R2, [R3]
  iadd R2, 1
  mov R1, [R2]
  ile R1, 26
  and R0, R1
__LogicalAnd_ShortCircuit_3769:
  jf R0, __if_3752_else
  mov R0, 1
  mov [global_Total], R0
  mov R1, [BP+2]
  mov [SP], R1
  mov R1, [BP+3]
  mov [SP+1], R1
  call __function_Place_Cards
  jmp __if_3752_end
__if_3752_else:
__if_3779_start:
  mov R2, [BP+3]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  ieq R0, 61
  jf R0, __if_3779_end
  mov R0, 1
  mov [global_Total], R0
  mov R1, [BP+2]
  mov [SP], R1
  mov R1, [BP+3]
  mov [SP+1], R1
  call __function_Place_Cards
__if_3779_end:
__if_3752_end:
__if_3725_end:
__if_3715_end:
__if_3637_end:
  jmp __if_3630_end
__if_3630_else:
__if_3792_start:
  mov R2, [BP+3]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  ieq R0, 61
  jf R0, __LogicalAnd_ShortCircuit_3799
  mov R1, [global_CardCount]
  ieq R1, 1
  and R0, R1
__LogicalAnd_ShortCircuit_3799:
  jf R0, __LogicalAnd_ShortCircuit_3805
  mov R3, [BP+2]
  iadd R3, 9
  mov R2, [R3]
  iadd R2, 10
  mov R1, [R2]
  ieq R1, 1
  and R0, R1
__LogicalAnd_ShortCircuit_3805:
  jf R0, __if_3792_end
  mov R0, 1
  mov [global_Total], R0
  mov R1, [BP+2]
  mov [SP], R1
  mov R1, [BP+3]
  mov [SP+1], R1
  call __function_Place_Cards
__if_3792_end:
__if_3630_end:
__function_Placement_return:
  mov SP, BP
  pop BP
  ret

__function_Placement_Check:
  push BP
  mov BP, SP
  isub SP, 4
__do_3821_start:
  mov R0, [BP+2]
  mov R1, [BP+3]
  iadd R1, 9
  mov [R1], R0
  mov R1, [BP+2]
  mov R0, [R1]
  mov R1, [BP+4]
  iadd R1, 13
  mov [R1], R0
  mov R3, [BP+3]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP+3]
  iadd R1, 3
  mov [R1], R0
  mov R3, [BP+3]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP+3]
  iadd R1, 4
  mov [R1], R0
  mov R3, [BP+3]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP+4]
  iadd R1, 3
  mov [R1], R0
  mov R3, [BP+3]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP+4]
  iadd R1, 4
  mov [R1], R0
  mov R1, [BP+3]
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 17
  mov [SP+2], R1
  call __function_Move_Stack
  mov R2, [BP+4]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  imod R0, 13
  mov [global_RefMod13], R0
__if_3871_start:
  mov R0, [global_RefMod13]
  ieq R0, 0
  jf R0, __if_3871_end
  mov R0, 13
  mov [global_RefMod13], R0
__if_3871_end:
  mov R5, [BP+3]
  iadd R5, 1
  mov R4, [R5]
  mov R3, [R4]
  iadd R3, 11
  mov R2, [R3]
  mov [SP], R2
  mov R2, 0
  mov [SP+1], R2
  call __function_Card_Count
  mov R1, R0
  mov [global_CardCount], R1
  mov R0, R1
  mov R4, [BP+3]
  iadd R4, 1
  mov R3, [R4]
  mov R2, [R3]
  iadd R2, 11
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  imod R0, 13
  mov [global_SelectMod13], R0
  mov R2, [BP+3]
  iadd R2, 9
  mov R1, [R2]
  iadd R1, 10
  mov R0, [R1]
  mov [global_type], R0
__if_3901_start:
  mov R2, [BP+3]
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  ine R0, 61
  jf R0, __if_3901_end
  mov R1, [BP+3]
  mov [SP], R1
  mov R1, [BP+4]
  mov [SP+1], R1
  call __function_Placement
__if_3901_end:
  mov R2, [BP+3]
  iadd R2, 9
  mov R1, [R2]
  iadd R1, 10
  mov R0, [R1]
  mov [BP-1], R0
  mov R1, [BP+2]
  iadd R1, 5
  mov R0, [R1]
  mov [BP+2], R0
__do_3821_continue:
  mov R0, [BP+2]
  ine R0, -1
  jf R0, __LogicalAnd_ShortCircuit_3924
  mov R1, [global_Total]
  ieq R1, 0
  and R0, R1
__LogicalAnd_ShortCircuit_3924:
  jt R0, __do_3821_start
__do_3821_end:
  mov R2, [BP+3]
  iadd R2, 9
  mov R1, [R2]
  mov R0, [R1]
  mov R1, [BP+4]
  iadd R1, 13
  mov [R1], R0
  mov R3, [BP+3]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP+3]
  iadd R1, 3
  mov [R1], R0
  mov R3, [BP+3]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP+3]
  iadd R1, 4
  mov [R1], R0
  mov R3, [BP+3]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP+4]
  iadd R1, 3
  mov [R1], R0
  mov R3, [BP+3]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP+4]
  iadd R1, 4
  mov [R1], R0
  mov R1, [BP+3]
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 17
  mov [SP+2], R1
  call __function_Move_Stack
__function_Placement_Check_return:
  mov SP, BP
  pop BP
  ret

__function_main:
  push BP
  mov BP, SP
  isub SP, 23
  mov R1, 0
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
  call __function_define_region_center
  mov R1, 1
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 1
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 0
  mov [SP+2], R1
  mov R1, 55
  mov [SP+3], R1
  mov R1, 95
  mov [SP+4], R1
  mov R1, 28
  mov [SP+5], R1
  mov R1, 48
  mov [SP+6], R1
  mov R1, 10
  mov [SP+7], R1
  mov R1, 3
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 2
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 27
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 0
  mov [SP+2], R1
  mov R1, 55
  mov [SP+3], R1
  mov R1, 95
  mov [SP+4], R1
  mov R1, 28
  mov [SP+5], R1
  mov R1, 48
  mov [SP+6], R1
  mov R1, 10
  mov [SP+7], R1
  mov R1, 3
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 1
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 55
  mov [SP], R1
  mov R1, 560
  mov [SP+1], R1
  mov R1, 0
  mov [SP+2], R1
  mov R1, 615
  mov [SP+3], R1
  mov R1, 65
  mov [SP+4], R1
  mov R1, 588
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
  mov R1, 2
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
  mov R1, 55
  mov [SP], R1
  mov R1, 560
  mov [SP+1], R1
  mov R1, 0
  mov [SP+2], R1
  mov R1, 615
  mov [SP+3], R1
  mov R1, 65
  mov [SP+4], R1
  mov R1, 588
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
  mov R1, 1
  mov [SP], R1
  call __function_select_texture
  mov R1, 59
  mov [SP], R1
  call __function_select_region
  mov R1, 59
  mov [SP], R1
  mov R1, 336
  mov [SP+1], R1
  mov R1, 192
  mov [SP+2], R1
  mov R1, 391
  mov [SP+3], R1
  mov R1, 287
  mov [SP+4], R1
  mov R1, 364
  mov [SP+5], R1
  mov R1, 240
  mov [SP+6], R1
  mov R1, 1
  mov [SP+7], R1
  mov R1, 1
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 1
  mov [SP], R1
  call __function_select_texture
  mov R1, 61
  mov [SP], R1
  call __function_select_region
  mov R1, 61
  mov [SP], R1
  mov R1, 504
  mov [SP+1], R1
  mov R1, 192
  mov [SP+2], R1
  mov R1, 559
  mov [SP+3], R1
  mov R1, 287
  mov [SP+4], R1
  mov R1, 532
  mov [SP+5], R1
  mov R1, 240
  mov [SP+6], R1
  mov R1, 1
  mov [SP+7], R1
  mov R1, 1
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 1
  mov [SP], R1
  call __function_select_texture
  mov R1, 59
  mov [SP], R1
  call __function_select_region
  mov R1, 60
  mov [SP], R1
  mov R1, 560
  mov [SP+1], R1
  mov R1, 192
  mov [SP+2], R1
  mov R1, 615
  mov [SP+3], R1
  mov R1, 287
  mov [SP+4], R1
  mov R1, 588
  mov [SP+5], R1
  mov R1, 240
  mov [SP+6], R1
  mov R1, 1
  mov [SP+7], R1
  mov R1, 1
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 2
  mov [SP], R1
  call __function_select_texture
  mov R1, 59
  mov [SP], R1
  call __function_select_region
  mov R1, 60
  mov [SP], R1
  mov R1, 560
  mov [SP+1], R1
  mov R1, 192
  mov [SP+2], R1
  mov R1, 615
  mov [SP+3], R1
  mov R1, 287
  mov [SP+4], R1
  mov R1, 588
  mov [SP+5], R1
  mov R1, 240
  mov [SP+6], R1
  mov R1, 1
  mov [SP+7], R1
  mov R1, 1
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 3
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 0
  mov [SP+2], R1
  mov R1, 31
  mov [SP+3], R1
  mov R1, 31
  mov [SP+4], R1
  mov R1, 0
  mov [SP+5], R1
  mov R1, 31
  mov [SP+6], R1
  mov R1, 16
  mov [SP+7], R1
  mov R1, 8
  mov [SP+8], R1
  mov R1, 0
  mov [SP+9], R1
  call __function_define_region_matrix
  mov R1, 4
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
  mov R0, -1
  mov [BP-1], R0
  call __function_mkstacklist
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R1, 0
  mov [SP], R1
  call __function_select_gamepad
  call __function_get_time
  mov R1, R0
  mov [BP-13], R1
  mov R1, [BP-13]
  mov [SP], R1
  call __function_srand
  mov R0, -1
  mov [BP-2], R0
  mov R0, -1
  mov [BP-3], R0
  mov R0, -1
  mov [BP-4], R0
  mov R0, -1
  mov [BP-5], R0
  mov R0, -1
  mov [BP-6], R0
  mov R2, 52
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Cardstack], R1
  mov R0, R1
  mov R2, 5
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Selector], R1
  mov R0, R1
  mov R2, 14
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Stack1], R1
  mov R0, R1
  mov R2, 14
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Stack2], R1
  mov R0, R1
  mov R2, 14
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Stack3], R1
  mov R0, R1
  mov R2, 14
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Stack4], R1
  mov R0, R1
  mov R2, 14
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Stack5], R1
  mov R0, R1
  mov R2, 14
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Stack6], R1
  mov R0, R1
  mov R2, 14
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Stack7], R1
  mov R0, R1
  mov R2, 14
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Stack8], R1
  mov R0, R1
  mov R2, 2
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Free1], R1
  mov R0, R1
  mov R2, 2
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Free2], R1
  mov R0, R1
  mov R2, 2
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Free3], R1
  mov R0, R1
  mov R2, 2
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Free4], R1
  mov R0, R1
  mov R2, 14
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Home1], R1
  mov R0, R1
  mov R2, 14
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Home2], R1
  mov R0, R1
  mov R2, 14
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Home3], R1
  mov R0, R1
  mov R2, 14
  mov [SP], R2
  call __function_mkstack
  mov R1, R0
  mov [global_Home4], R1
  mov R0, R1
  mov R1, 0
  mov [SP], R1
  call __function_select_sound
  mov R1, 1
  mov [SP], R1
  call __function_set_sound_loop
  mov R1, 0.250000
  mov [SP], R1
  call __function_set_channel_volume
  mov R1, 0
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  call __function_play_sound_in_channel
  mov R1, 160
  cif R1
  mov [SP], R1
  mov R1, 180
  cif R1
  mov [SP+1], R1
  mov R1, __literal_string_4226
  mov [SP+2], R1
  mov R1, 0.500000
  mov [SP+3], R1
  mov R1, 3
  mov [SP+4], R1
  call __function_Print_Text
  mov R1, 126
  cif R1
  mov [SP], R1
  mov R1, 200
  cif R1
  mov [SP+1], R1
  mov R1, __literal_string_4232
  mov [SP+2], R1
  mov R1, 0.500000
  mov [SP+3], R1
  mov R1, 3
  mov [SP+4], R1
  call __function_Print_Text
  mov R1, 92
  cif R1
  mov [SP], R1
  mov R1, 220
  cif R1
  mov [SP+1], R1
  mov R1, __literal_string_4238
  mov [SP+2], R1
  mov R1, 0.500000
  mov [SP+3], R1
  mov R1, 3
  mov [SP+4], R1
  call __function_Print_Text
  mov R1, 150
  cif R1
  mov [SP], R1
  mov R1, 260
  cif R1
  mov [SP+1], R1
  mov R1, __literal_string_4244
  mov [SP+2], R1
  mov R1, 0.500000
  mov [SP+3], R1
  mov R1, 3
  mov [SP+4], R1
  call __function_Print_Text
__while_4247_start:
__while_4247_continue:
  call __function_gamepad_button_start
  mov R1, R0
  ilt R1, 0
  mov R0, R1
  jf R0, __while_4247_end
  jmp __while_4247_start
__while_4247_end:
  mov R1, 3
  mov [SP], R1
  call __function_Play_Sound
  mov R1, 60
  mov [SP], R1
  call __function_sleep
  mov R1, 2
  mov [SP], R1
  call __function_Play_Sound
  mov R1, 120
  mov [SP], R1
  call __function_sleep
__while_4260_start:
__while_4260_continue:
  mov R0, 1
  jf R0, __while_4260_end
__if_4263_start:
  mov R0, [global_StartFlag]
  ieq R0, 0
  jf R0, __if_4263_end
  mov R2, [global_Selector]
  mov [SP], R2
  mov R2, 6
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Selector], R1
  mov R0, R1
  mov R2, [global_Stack1]
  mov [SP], R2
  mov R2, 14
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Stack1], R1
  mov R0, R1
  mov R2, [global_Stack2]
  mov [SP], R2
  mov R2, 14
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Stack2], R1
  mov R0, R1
  mov R2, [global_Stack3]
  mov [SP], R2
  mov R2, 14
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Stack3], R1
  mov R0, R1
  mov R2, [global_Stack4]
  mov [SP], R2
  mov R2, 14
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Stack4], R1
  mov R0, R1
  mov R2, [global_Stack5]
  mov [SP], R2
  mov R2, 14
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Stack5], R1
  mov R0, R1
  mov R2, [global_Stack6]
  mov [SP], R2
  mov R2, 14
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Stack6], R1
  mov R0, R1
  mov R2, [global_Stack7]
  mov [SP], R2
  mov R2, 14
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Stack7], R1
  mov R0, R1
  mov R2, [global_Stack8]
  mov [SP], R2
  mov R2, 14
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Stack8], R1
  mov R0, R1
  mov R2, [global_Free1]
  mov [SP], R2
  mov R2, 2
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Free1], R1
  mov R0, R1
  mov R2, [global_Free2]
  mov [SP], R2
  mov R2, 2
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Free2], R1
  mov R0, R1
  mov R2, [global_Free3]
  mov [SP], R2
  mov R2, 2
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Free3], R1
  mov R0, R1
  mov R2, [global_Free4]
  mov [SP], R2
  mov R2, 2
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Free4], R1
  mov R0, R1
  mov R2, [global_Home1]
  mov [SP], R2
  mov R2, 14
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Home1], R1
  mov R0, R1
  mov R2, [global_Home2]
  mov [SP], R2
  mov R2, 14
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Home2], R1
  mov R0, R1
  mov R2, [global_Home3]
  mov [SP], R2
  mov R2, 14
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Home3], R1
  mov R0, R1
  mov R2, [global_Home4]
  mov [SP], R2
  mov R2, 14
  mov [SP+1], R2
  call __function_Refresh_Stack
  mov R1, R0
  mov [global_Home4], R1
  mov R0, R1
  mov R0, 0
  mov [global_Count], R0
  mov R0, 0
  mov [global_Total], R0
  mov R0, 0
  mov [global_CardCount], R0
  mov R0, 5
  mov [global_MaxGrab], R0
  mov R0, 0
  mov [global_type], R0
  mov R0, 0
  mov [global_SelectMod13], R0
  mov R0, 0
  mov [global_SelectMod26], R0
  mov R0, 0
  mov [global_RefMod13], R0
  mov R0, 0
  mov [global_RefMod26], R0
  mov R0, 52
  mov [global_MaxCards], R0
  mov R0, 16
  mov [global_MaxStacks], R0
  mov R0, 0
  mov [global_GrabTimer], R0
  mov R0, 0
  mov [global_MoveTimer], R0
  mov R0, 0
  mov [global_GrabFlag], R0
  mov R0, 0
  mov [global_StopFlag], R0
  mov R0, 0
  mov [global_AutoFlag], R0
  mov R0, 0
  mov [global_index], R0
  call __function_get_time
  mov R1, R0
  mov [BP-13], R1
  mov R1, [BP-13]
  mov [SP], R1
  call __function_srand
  mov R0, -1
  mov [BP-2], R0
  mov R0, -1
  mov [BP-3], R0
  mov R0, -1
  mov [BP-4], R0
  mov R0, -1
  mov [BP-5], R0
  mov R0, -1
  mov [BP-6], R0
  mov R2, [BP-1]
  mov [SP], R2
  mov R3, [BP-1]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [global_Home1]
  mov [SP+2], R2
  call __function_SLadd
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R3, [BP-1]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [global_Home2]
  mov [SP+2], R2
  call __function_SLadd
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R3, [BP-1]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [global_Home3]
  mov [SP+2], R2
  call __function_SLadd
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R3, [BP-1]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [global_Home4]
  mov [SP+2], R2
  call __function_SLadd
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R3, [BP-1]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [global_Stack1]
  mov [SP+2], R2
  call __function_SLadd
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R3, [BP-1]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [global_Stack2]
  mov [SP+2], R2
  call __function_SLadd
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R3, [BP-1]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [global_Stack3]
  mov [SP+2], R2
  call __function_SLadd
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R3, [BP-1]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [global_Stack4]
  mov [SP+2], R2
  call __function_SLadd
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R3, [BP-1]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [global_Stack5]
  mov [SP+2], R2
  call __function_SLadd
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R3, [BP-1]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [global_Stack6]
  mov [SP+2], R2
  call __function_SLadd
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R3, [BP-1]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [global_Stack7]
  mov [SP+2], R2
  call __function_SLadd
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R3, [BP-1]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [global_Stack8]
  mov [SP+2], R2
  call __function_SLadd
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R3, [BP-1]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [global_Free1]
  mov [SP+2], R2
  call __function_SLadd
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R3, [BP-1]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [global_Free2]
  mov [SP+2], R2
  call __function_SLadd
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R3, [BP-1]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [global_Free3]
  mov [SP+2], R2
  call __function_SLadd
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R3, [BP-1]
  iadd R3, 1
  mov R2, [R3]
  mov [SP+1], R2
  mov R2, [global_Free4]
  mov [SP+2], R2
  call __function_SLadd
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R2, [global_Stack1]
  mov [SP+1], R2
  mov R2, [global_Free1]
  mov [SP+2], R2
  call __function_SLup
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R2, [global_Stack2]
  mov [SP+1], R2
  mov R2, [global_Free2]
  mov [SP+2], R2
  call __function_SLup
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R2, [global_Stack3]
  mov [SP+1], R2
  mov R2, [global_Free3]
  mov [SP+2], R2
  call __function_SLup
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R2, [global_Stack4]
  mov [SP+1], R2
  mov R2, [global_Free4]
  mov [SP+2], R2
  call __function_SLup
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R2, [global_Stack5]
  mov [SP+1], R2
  mov R2, [global_Home1]
  mov [SP+2], R2
  call __function_SLup
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R2, [global_Stack6]
  mov [SP+1], R2
  mov R2, [global_Home2]
  mov [SP+2], R2
  call __function_SLup
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R2, [global_Stack7]
  mov [SP+1], R2
  mov R2, [global_Home3]
  mov [SP+2], R2
  call __function_SLup
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R2, [BP-1]
  mov [SP], R2
  mov R2, [global_Stack8]
  mov [SP+1], R2
  mov R2, [global_Home4]
  mov [SP+2], R2
  call __function_SLup
  mov R1, R0
  mov [BP-1], R1
  mov R0, R1
  mov R1, [global_Cardstack]
  mov [SP], R1
  mov R1, 800
  mov [SP+1], R1
  mov R1, 56
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R1, [global_Stack1]
  mov [SP], R1
  mov R1, 75
  mov [SP+1], R1
  mov R1, 156
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R1, [global_Stack2]
  mov [SP], R1
  mov R1, 145
  mov [SP+1], R1
  mov R1, 156
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R1, [global_Stack3]
  mov [SP], R1
  mov R1, 215
  mov [SP+1], R1
  mov R1, 156
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R1, [global_Stack4]
  mov [SP], R1
  mov R1, 285
  mov [SP+1], R1
  mov R1, 156
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R1, [global_Stack5]
  mov [SP], R1
  mov R1, 355
  mov [SP+1], R1
  mov R1, 156
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R1, [global_Stack6]
  mov [SP], R1
  mov R1, 425
  mov [SP+1], R1
  mov R1, 156
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R1, [global_Stack7]
  mov [SP], R1
  mov R1, 495
  mov [SP+1], R1
  mov R1, 156
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R1, [global_Stack8]
  mov [SP], R1
  mov R1, 565
  mov [SP+1], R1
  mov R1, 156
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R1, [global_Free1]
  mov [SP], R1
  mov R1, 75
  mov [SP+1], R1
  mov R1, 56
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R1, [global_Free2]
  mov [SP], R1
  mov R1, 145
  mov [SP+1], R1
  mov R1, 56
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R1, [global_Free3]
  mov [SP], R1
  mov R1, 215
  mov [SP+1], R1
  mov R1, 56
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R1, [global_Free4]
  mov [SP], R1
  mov R1, 285
  mov [SP+1], R1
  mov R1, 56
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R1, [global_Home1]
  mov [SP], R1
  mov R1, 355
  mov [SP+1], R1
  mov R1, 56
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R1, [global_Home2]
  mov [SP], R1
  mov R1, 425
  mov [SP+1], R1
  mov R1, 56
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R1, [global_Home3]
  mov [SP], R1
  mov R1, 495
  mov [SP+1], R1
  mov R1, 56
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R1, [global_Home4]
  mov [SP], R1
  mov R1, 565
  mov [SP+1], R1
  mov R1, 56
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R0, 1
  mov [global_Count], R0
  mov R0, 0
  mov [global_index], R0
__for_4652_start:
  mov R0, [global_index]
  mov R1, [global_MaxCards]
  ilt R0, R1
  jf R0, __for_4652_end
  mov R0, [global_index]
  iadd R0, 1
  mov R1, global_Shuffle
  mov R2, [global_index]
  imul R2, 15
  iadd R1, R2
  iadd R1, 1
  mov [R1], R0
__for_4652_continue:
  mov R0, [global_index]
  mov R1, R0
  iadd R1, 1
  mov [global_index], R1
  jmp __for_4652_start
__for_4652_end:
  mov R0, [global_MaxCards]
  isub R0, 1
  mov [global_index], R0
__for_4670_start:
  mov R0, [global_index]
  ige R0, 0
  jf R0, __for_4670_end
  call __function_rand
  mov R1, R0
  mov R2, [global_index]
  iadd R2, 1
  imod R1, R2
  iadd R1, 1
  mov [global_random], R1
  mov R0, R1
  mov R1, global_Shuffle
  mov R2, [global_index]
  imul R2, 15
  iadd R1, R2
  iadd R1, 1
  mov R0, [R1]
  mov [global_temp], R0
  mov R1, global_Shuffle
  mov R2, [global_random]
  imul R2, 15
  iadd R1, R2
  iadd R1, 1
  mov R0, [R1]
  mov R1, global_Shuffle
  mov R2, [global_index]
  imul R2, 15
  iadd R1, R2
  iadd R1, 1
  mov [R1], R0
  mov R0, [global_temp]
  mov R1, global_Shuffle
  mov R2, [global_random]
  imul R2, 15
  iadd R1, R2
  iadd R1, 1
  mov [R1], R0
__for_4670_continue:
  mov R0, [global_index]
  mov R1, R0
  isub R1, 1
  mov [global_index], R1
  jmp __for_4670_start
__for_4670_end:
  mov R0, [global_MaxCards]
  isub R0, 1
  mov [global_index], R0
__for_4714_start:
  mov R0, [global_index]
  ige R0, 0
  jf R0, __for_4714_end
  mov R0, [global_index]
  iadd R0, 1
  mov R1, global_Shuffle
  mov R2, [global_index]
  imul R2, 15
  iadd R1, R2
  iadd R1, 1
  mov [R1], R0
__for_4714_continue:
  mov R0, [global_index]
  mov R1, R0
  isub R1, 1
  mov [global_index], R1
  jmp __for_4714_start
__for_4714_end:
  mov R0, 0
  mov [global_index], R0
__for_4734_start:
  mov R0, [global_index]
  mov R1, [global_MaxCards]
  ilt R0, R1
  jf R0, __for_4734_end
__if_4744_start:
  mov R1, global_Shuffle
  mov R2, [global_index]
  imul R2, 15
  iadd R1, R2
  iadd R1, 1
  mov R0, [R1]
  ile R0, 26
  jf R0, __if_4744_else
  mov R2, 1
  mov [SP], R2
  mov R3, [global_Cardstack]
  iadd R3, 3
  mov R2, [R3]
  mov [SP+1], R2
  mov R3, [global_Cardstack]
  iadd R3, 4
  mov R2, [R3]
  mov [SP+2], R2
  mov R2, 1
  mov [SP+3], R2
  mov R2, 1
  mov [SP+4], R2
  mov R2, 55
  mov [SP+5], R2
  mov R2, 95
  mov [SP+6], R2
  mov R2, 1
  mov [SP+7], R2
  mov R3, global_Shuffle
  mov R4, [global_index]
  imul R4, 15
  iadd R3, R4
  iadd R3, 1
  mov R2, [R3]
  mov [SP+8], R2
  mov R2, 60
  mov [SP+9], R2
  call __function_mknode
  mov R1, R0
  mov [BP-3], R1
  mov R0, R1
  mov R2, [global_Cardstack]
  mov [SP], R2
  mov R2, [BP-3]
  mov [SP+1], R2
  call __function_push
  mov R1, R0
  mov [global_Cardstack], R1
  mov R0, R1
  jmp __if_4744_end
__if_4744_else:
__if_4775_start:
  mov R1, global_Shuffle
  mov R2, [global_index]
  imul R2, 15
  iadd R1, R2
  iadd R1, 1
  mov R0, [R1]
  igt R0, 26
  jf R0, __LogicalAnd_ShortCircuit_4786
  mov R2, global_Shuffle
  mov R3, [global_index]
  imul R3, 15
  iadd R2, R3
  iadd R2, 1
  mov R1, [R2]
  ile R1, 52
  and R0, R1
__LogicalAnd_ShortCircuit_4786:
  jf R0, __if_4775_end
  mov R2, 1
  mov [SP], R2
  mov R3, [global_Cardstack]
  iadd R3, 3
  mov R2, [R3]
  mov [SP+1], R2
  mov R3, [global_Cardstack]
  iadd R3, 4
  mov R2, [R3]
  mov [SP+2], R2
  mov R2, 1
  mov [SP+3], R2
  mov R2, 1
  mov [SP+4], R2
  mov R2, 55
  mov [SP+5], R2
  mov R2, 95
  mov [SP+6], R2
  mov R2, 2
  mov [SP+7], R2
  mov R3, global_Shuffle
  mov R4, [global_index]
  imul R4, 15
  iadd R3, R4
  iadd R3, 1
  mov R2, [R3]
  mov [SP+8], R2
  mov R2, 60
  mov [SP+9], R2
  call __function_mknode
  mov R1, R0
  mov [BP-3], R1
  mov R0, R1
  mov R2, [global_Cardstack]
  mov [SP], R2
  mov R2, [BP-3]
  mov [SP+1], R2
  call __function_push
  mov R1, R0
  mov [global_Cardstack], R1
  mov R0, R1
__if_4775_end:
__if_4744_end:
__for_4734_continue:
  mov R0, [global_index]
  mov R1, R0
  iadd R1, 1
  mov [global_index], R1
  jmp __for_4734_start
__for_4734_end:
  mov R0, 104
  mov [BP-11], R0
  mov R0, 0
  mov [BP-12], R0
  mov R0, 0
  mov [global_index], R0
  mov R0, -1
  mov [BP-4], R0
  mov R0, 104
  mov [BP-11], R0
__for_4825_start:
  mov R0, [BP-11]
  ige R0, 0
  jf R0, __for_4825_end
  call __function_rand
  mov R1, R0
  imod R1, 52
  mov [BP-12], R1
  mov R0, R1
  mov R2, [global_Cardstack]
  iadd R2, 1
  mov R1, [R2]
  mov R0, [R1]
  mov [BP-4], R0
__while_4845_start:
__while_4845_continue:
  mov R0, [global_index]
  mov R1, [BP-12]
  ine R0, R1
  jf R0, __while_4845_end
  mov R1, [BP-4]
  iadd R1, 11
  mov R0, [R1]
  mov [BP-4], R0
  mov R0, [global_index]
  mov R1, R0
  iadd R1, 1
  mov [global_index], R1
  jmp __while_4845_start
__while_4845_end:
  mov R2, [global_Cardstack]
  mov [SP], R2
  lea R2, [BP-4]
  mov [SP+1], R2
  call __function_pop
  mov R1, R0
  mov [global_Cardstack], R1
  mov R0, R1
  mov R2, [global_Cardstack]
  mov [SP], R2
  mov R2, [BP-4]
  mov [SP+1], R2
  call __function_push
  mov R1, R0
  mov [global_Cardstack], R1
  mov R0, R1
  mov R0, 0
  mov [global_index], R0
__for_4825_continue:
  mov R0, [BP-11]
  mov R1, R0
  isub R1, 1
  mov [BP-11], R1
  jmp __for_4825_start
__for_4825_end:
  mov R1, [global_Stack1]
  mov [SP], R1
  call __function_Empty_Stack
  mov R1, [global_Stack2]
  mov [SP], R1
  call __function_Empty_Stack
  mov R1, [global_Stack3]
  mov [SP], R1
  call __function_Empty_Stack
  mov R1, [global_Stack4]
  mov [SP], R1
  call __function_Empty_Stack
  mov R1, [global_Stack5]
  mov [SP], R1
  call __function_Empty_Stack
  mov R1, [global_Stack6]
  mov [SP], R1
  call __function_Empty_Stack
  mov R1, [global_Stack7]
  mov [SP], R1
  call __function_Empty_Stack
  mov R1, [global_Stack8]
  mov [SP], R1
  call __function_Empty_Stack
  mov R1, [global_Free1]
  mov [SP], R1
  call __function_Empty_Stack
  mov R1, [global_Free2]
  mov [SP], R1
  call __function_Empty_Stack
  mov R1, [global_Free3]
  mov [SP], R1
  call __function_Empty_Stack
  mov R1, [global_Free4]
  mov [SP], R1
  call __function_Empty_Stack
  mov R1, [global_Home1]
  mov [SP], R1
  call __function_Empty_Stack
  mov R1, [global_Home2]
  mov [SP], R1
  call __function_Empty_Stack
  mov R1, [global_Home3]
  mov [SP], R1
  call __function_Empty_Stack
  mov R1, [global_Home4]
  mov [SP], R1
  call __function_Empty_Stack
  mov R1, [global_Stack1]
  mov [SP], R1
  mov R1, [global_Cardstack]
  mov [SP+1], R1
  mov R1, 0
  mov [SP+2], R1
  mov R1, 17
  mov [SP+3], R1
  mov R1, 7
  mov [SP+4], R1
  call __function_Give_Cards
  mov R1, [global_Stack2]
  mov [SP], R1
  mov R1, [global_Cardstack]
  mov [SP+1], R1
  mov R1, 0
  mov [SP+2], R1
  mov R1, 17
  mov [SP+3], R1
  mov R1, 7
  mov [SP+4], R1
  call __function_Give_Cards
  mov R1, [global_Stack3]
  mov [SP], R1
  mov R1, [global_Cardstack]
  mov [SP+1], R1
  mov R1, 0
  mov [SP+2], R1
  mov R1, 17
  mov [SP+3], R1
  mov R1, 7
  mov [SP+4], R1
  call __function_Give_Cards
  mov R1, [global_Stack4]
  mov [SP], R1
  mov R1, [global_Cardstack]
  mov [SP+1], R1
  mov R1, 0
  mov [SP+2], R1
  mov R1, 17
  mov [SP+3], R1
  mov R1, 7
  mov [SP+4], R1
  call __function_Give_Cards
  mov R1, [global_Stack5]
  mov [SP], R1
  mov R1, [global_Cardstack]
  mov [SP+1], R1
  mov R1, 0
  mov [SP+2], R1
  mov R1, 17
  mov [SP+3], R1
  mov R1, 6
  mov [SP+4], R1
  call __function_Give_Cards
  mov R1, [global_Stack6]
  mov [SP], R1
  mov R1, [global_Cardstack]
  mov [SP+1], R1
  mov R1, 0
  mov [SP+2], R1
  mov R1, 17
  mov [SP+3], R1
  mov R1, 6
  mov [SP+4], R1
  call __function_Give_Cards
  mov R1, [global_Stack7]
  mov [SP], R1
  mov R1, [global_Cardstack]
  mov [SP+1], R1
  mov R1, 0
  mov [SP+2], R1
  mov R1, 17
  mov [SP+3], R1
  mov R1, 6
  mov [SP+4], R1
  call __function_Give_Cards
  mov R1, [global_Stack8]
  mov [SP], R1
  mov R1, [global_Cardstack]
  mov [SP+1], R1
  mov R1, 0
  mov [SP+2], R1
  mov R1, 17
  mov [SP+3], R1
  mov R1, 6
  mov [SP+4], R1
  call __function_Give_Cards
  mov R2, 1
  mov [SP], R2
  mov R2, 360
  mov [SP+1], R2
  mov R2, 180
  mov [SP+2], R2
  mov R2, 1
  mov [SP+3], R2
  mov R2, 1
  mov [SP+4], R2
  mov R2, 55
  mov [SP+5], R2
  mov R2, 95
  mov [SP+6], R2
  mov R2, 1
  mov [SP+7], R2
  mov R2, 59
  mov [SP+8], R2
  mov R2, 59
  mov [SP+9], R2
  call __function_mknode
  mov R1, R0
  mov [BP-2], R1
  mov R0, R1
  mov R1, [global_Selector]
  mov [SP], R1
  mov R2, [global_Stack4]
  iadd R2, 3
  mov R1, [R2]
  mov [SP+1], R1
  mov R2, [global_Stack4]
  iadd R2, 4
  mov R1, [R2]
  mov [SP+2], R1
  call __function_Stack_Pos
  mov R2, [global_Selector]
  mov [SP], R2
  mov R2, [BP-2]
  mov [SP+1], R2
  call __function_push
  mov R1, R0
  mov [global_Selector], R1
  mov R0, R1
  mov R0, [global_Stack4]
  mov R1, [global_Selector]
  iadd R1, 9
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 4
  mov [R1], R0
  mov R2, [global_Selector]
  iadd R2, 9
  mov R1, [R2]
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 13
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 4
  mov [R1], R0
  mov R0, 4
  mov R1, [global_Cardstack]
  iadd R1, 10
  mov [R1], R0
  mov R0, 3
  mov R1, [global_Stack1]
  iadd R1, 10
  mov [R1], R0
  mov R0, 3
  mov R1, [global_Stack2]
  iadd R1, 10
  mov [R1], R0
  mov R0, 3
  mov R1, [global_Stack3]
  iadd R1, 10
  mov [R1], R0
  mov R0, 3
  mov R1, [global_Stack4]
  iadd R1, 10
  mov [R1], R0
  mov R0, 3
  mov R1, [global_Stack5]
  iadd R1, 10
  mov [R1], R0
  mov R0, 3
  mov R1, [global_Stack6]
  iadd R1, 10
  mov [R1], R0
  mov R0, 3
  mov R1, [global_Stack7]
  iadd R1, 10
  mov [R1], R0
  mov R0, 3
  mov R1, [global_Stack8]
  iadd R1, 10
  mov [R1], R0
  mov R0, 1
  mov R1, [global_Free1]
  iadd R1, 10
  mov [R1], R0
  mov R0, 1
  mov R1, [global_Free2]
  iadd R1, 10
  mov [R1], R0
  mov R0, 1
  mov R1, [global_Free3]
  iadd R1, 10
  mov [R1], R0
  mov R0, 1
  mov R1, [global_Free4]
  iadd R1, 10
  mov [R1], R0
  mov R0, 2
  mov R1, [global_Home1]
  iadd R1, 10
  mov [R1], R0
  mov R0, 2
  mov R1, [global_Home2]
  iadd R1, 10
  mov [R1], R0
  mov R0, 2
  mov R1, [global_Home3]
  iadd R1, 10
  mov [R1], R0
  mov R0, 2
  mov R1, [global_Home4]
  iadd R1, 10
  mov [R1], R0
  mov R0, 1
  mov [global_StartFlag], R0
  mov R0, 1
  mov [global_Size1], R0
  mov R0, 1
  mov [global_Size2], R0
  mov R0, 1
  mov [global_Size3], R0
  mov R0, 1
  mov [global_Size4], R0
  mov R0, 1
  mov [global_Size5], R0
  mov R0, 1
  mov [global_Size6], R0
  mov R0, 1
  mov [global_Size7], R0
  mov R0, 1
  mov [global_Size8], R0
  mov R0, 1
  mov [global_EndFlag], R0
  mov R0, 0
  mov [global_EndCount], R0
__if_4263_end:
  mov R1, -16777216
  mov [SP], R1
  call __function_clear_screen
  mov R1, 1.105000
  mov [SP], R1
  mov R1, 1.180000
  mov [SP+1], R1
  call __function_set_drawing_scale
  mov R1, 0
  mov [SP], R1
  call __function_select_texture
  mov R1, 0
  mov [SP], R1
  call __function_select_region
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
  mov R1, [global_Cardstack]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Stack1]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Stack2]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Stack3]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Stack4]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Stack5]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Stack6]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Stack7]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Stack8]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Free1]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Free2]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Free3]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Free4]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Home1]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Home2]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Home3]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Home4]
  mov [SP], R1
  call __function_Print_Stack
  mov R1, [global_Selector]
  mov [SP], R1
  call __function_Print_Stack
__if_5166_start:
  mov R0, [global_EndFlag]
  ieq R0, 0
  jf R0, __if_5166_end
  mov R1, 4
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
__if_5178_start:
  mov R0, [global_EndCount]
  ieq R0, 0
  jf R0, __if_5178_end
  mov R1, 4
  mov [SP], R1
  call __function_Play_Sound
__if_5178_end:
  mov R1, 175
  cif R1
  mov [SP], R1
  mov R1, 180
  cif R1
  mov [SP+1], R1
  mov R1, __literal_string_5188
  mov [SP+2], R1
  mov R1, 1
  cif R1
  mov [SP+3], R1
  mov R1, 3
  mov [SP+4], R1
  call __function_Print_Text
  mov R1, 150
  cif R1
  mov [SP], R1
  mov R1, 200
  cif R1
  mov [SP+1], R1
  mov R1, __literal_string_5194
  mov [SP+2], R1
  mov R1, 0.500000
  mov [SP+3], R1
  mov R1, 3
  mov [SP+4], R1
  call __function_Print_Text
  mov R1, 286
  cif R1
  mov [SP], R1
  mov R1, 220
  cif R1
  mov [SP+1], R1
  mov R1, __literal_string_5200
  mov [SP+2], R1
  mov R1, 0.500000
  mov [SP+3], R1
  mov R1, 3
  mov [SP+4], R1
  call __function_Print_Text
  mov R1, 20
  mov [SP], R1
  call __function_sleep
  mov R1, 303
  cif R1
  mov [SP], R1
  mov R1, 220
  cif R1
  mov [SP+1], R1
  mov R1, __literal_string_5208
  mov [SP+2], R1
  mov R1, 0.500000
  mov [SP+3], R1
  mov R1, 3
  mov [SP+4], R1
  call __function_Print_Text
  mov R1, 20
  mov [SP], R1
  call __function_sleep
  mov R1, 321
  cif R1
  mov [SP], R1
  mov R1, 220
  cif R1
  mov [SP+1], R1
  mov R1, __literal_string_5216
  mov [SP+2], R1
  mov R1, 0.500000
  mov [SP+3], R1
  mov R1, 3
  mov [SP+4], R1
  call __function_Print_Text
  mov R1, 20
  mov [SP], R1
  call __function_sleep
  mov R1, 338
  cif R1
  mov [SP], R1
  mov R1, 220
  cif R1
  mov [SP+1], R1
  mov R1, __literal_string_5224
  mov [SP+2], R1
  mov R1, 0.500000
  mov [SP+3], R1
  mov R1, 3
  mov [SP+4], R1
  call __function_Print_Text
  mov R1, 20
  mov [SP], R1
  call __function_sleep
__if_5229_start:
  mov R0, [global_EndCount]
  ieq R0, 1
  jf R0, __if_5229_else
  mov R1, 2
  mov [SP], R1
  call __function_Play_Sound
  jmp __if_5229_end
__if_5229_else:
__if_5236_start:
  mov R0, [global_EndCount]
  ieq R0, 3
  jf R0, __if_5236_end
  mov R0, 0
  mov [global_StartFlag], R0
__if_5236_end:
__if_5229_end:
  mov R0, [global_EndCount]
  mov R1, R0
  iadd R1, 1
  mov [global_EndCount], R1
__if_5166_end:
__if_5246_start:
  call __function_gamepad_left
  mov R1, R0
  igt R1, 0
  jf R1, __LogicalAnd_ShortCircuit_5251
  mov R2, [global_MoveTimer]
  ige R2, 15
  and R1, R2
__LogicalAnd_ShortCircuit_5251:
  mov R0, R1
  jf R0, __if_5246_else
__if_5255_start:
  mov R2, [global_Selector]
  iadd R2, 9
  mov R1, [R2]
  iadd R1, 6
  mov R0, [R1]
  ine R0, -1
  jf R0, __if_5255_else
  mov R2, [global_Selector]
  iadd R2, 9
  mov R1, [R2]
  iadd R1, 6
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 9
  mov [R1], R0
  jmp __if_5255_end
__if_5255_else:
  mov R1, [BP-1]
  iadd R1, 1
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 9
  mov [R1], R0
__if_5255_end:
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 4
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 4
  mov [R1], R0
  mov R2, [global_Selector]
  iadd R2, 9
  mov R1, [R2]
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 13
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 4
  mov [R1], R0
  mov R0, 0
  mov [global_MoveTimer], R0
  mov R1, 1
  mov [SP], R1
  call __function_Play_Sound
  jmp __if_5246_end
__if_5246_else:
__if_5329_start:
  call __function_gamepad_right
  mov R1, R0
  igt R1, 0
  jf R1, __LogicalAnd_ShortCircuit_5334
  mov R2, [global_MoveTimer]
  ige R2, 15
  and R1, R2
__LogicalAnd_ShortCircuit_5334:
  mov R0, R1
  jf R0, __if_5329_else
__if_5338_start:
  mov R2, [global_Selector]
  iadd R2, 9
  mov R1, [R2]
  iadd R1, 5
  mov R0, [R1]
  ine R0, -1
  jf R0, __if_5338_else
  mov R2, [global_Selector]
  iadd R2, 9
  mov R1, [R2]
  iadd R1, 5
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 9
  mov [R1], R0
  jmp __if_5338_end
__if_5338_else:
  mov R1, [BP-1]
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 9
  mov [R1], R0
__if_5338_end:
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 4
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 4
  mov [R1], R0
  mov R2, [global_Selector]
  iadd R2, 9
  mov R1, [R2]
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 13
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 4
  mov [R1], R0
  mov R0, 0
  mov [global_MoveTimer], R0
  mov R1, 1
  mov [SP], R1
  call __function_Play_Sound
  jmp __if_5329_end
__if_5329_else:
__if_5412_start:
  call __function_gamepad_up
  mov R1, R0
  igt R1, 0
  jf R1, __LogicalAnd_ShortCircuit_5417
  mov R2, [global_MoveTimer]
  ige R2, 15
  and R1, R2
__LogicalAnd_ShortCircuit_5417:
  jf R1, __LogicalAnd_ShortCircuit_5424
  mov R5, [BP-2]
  iadd R5, 13
  mov R4, [R5]
  iadd R4, 11
  mov R3, [R4]
  iadd R3, 1
  mov R2, [R3]
  ine R2, 61
  and R1, R2
__LogicalAnd_ShortCircuit_5424:
  jf R1, __LogicalAnd_ShortCircuit_5430
  mov R4, [global_Selector]
  iadd R4, 9
  mov R3, [R4]
  iadd R3, 7
  mov R2, [R3]
  ine R2, -1
  and R1, R2
__LogicalAnd_ShortCircuit_5430:
  mov R0, R1
  jf R0, __if_5412_else
__if_5434_start:
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  ine R0, 61
  jf R0, __if_5434_end
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 4
  mov [R1], R0
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 12
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 13
  mov [R1], R0
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 3
  mov [R1], R0
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 4
  mov [R1], R0
  mov R1, 1
  mov [SP], R1
  call __function_Play_Sound
__if_5434_end:
__if_5475_start:
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  ieq R0, 61
  jf R0, __LogicalAnd_ShortCircuit_5484
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  iadd R2, 7
  mov R1, [R2]
  ine R1, -1
  and R0, R1
__LogicalAnd_ShortCircuit_5484:
  jf R0, __if_5475_end
  mov R2, [global_Selector]
  iadd R2, 9
  mov R1, [R2]
  iadd R1, 7
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 9
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 4
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 4
  mov [R1], R0
  mov R2, [global_Selector]
  iadd R2, 9
  mov R1, [R2]
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 13
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 4
  mov [R1], R0
  mov R1, 1
  mov [SP], R1
  call __function_Play_Sound
__if_5475_end:
  mov R0, 0
  mov [global_MoveTimer], R0
  jmp __if_5412_end
__if_5412_else:
__if_5549_start:
  call __function_gamepad_down
  mov R1, R0
  igt R1, 0
  jf R1, __LogicalAnd_ShortCircuit_5554
  mov R2, [global_MoveTimer]
  ige R2, 15
  and R1, R2
__LogicalAnd_ShortCircuit_5554:
  mov R0, R1
  jf R0, __if_5549_else
__if_5558_start:
  mov R1, [BP-2]
  iadd R1, 13
  mov R0, [R1]
  mov R4, [global_Selector]
  iadd R4, 9
  mov R3, [R4]
  iadd R3, 1
  mov R2, [R3]
  iadd R2, 1
  mov R1, [R2]
  ine R0, R1
  jf R0, __if_5558_else
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 4
  mov [R1], R0
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 11
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 13
  mov [R1], R0
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 3
  mov [R1], R0
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 4
  mov [R1], R0
  mov R1, 1
  mov [SP], R1
  call __function_Play_Sound
  jmp __if_5558_end
__if_5558_else:
__if_5601_start:
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 11
  mov R0, [R1]
  ieq R0, -1
  jf R0, __LogicalAnd_ShortCircuit_5610
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  iadd R2, 8
  mov R1, [R2]
  ine R1, -1
  and R0, R1
__LogicalAnd_ShortCircuit_5610:
  jf R0, __if_5601_end
  mov R2, [global_Selector]
  iadd R2, 9
  mov R1, [R2]
  iadd R1, 8
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 9
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 4
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 4
  mov [R1], R0
  mov R2, [global_Selector]
  iadd R2, 9
  mov R1, [R2]
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 13
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 4
  mov [R1], R0
  mov R1, 1
  mov [SP], R1
  call __function_Play_Sound
__if_5601_end:
__if_5558_end:
  mov R0, 0
  mov [global_MoveTimer], R0
  jmp __if_5549_end
__if_5549_else:
__if_5675_start:
  call __function_gamepad_button_l
  mov R1, R0
  igt R1, 0
  jt R1, __LogicalOr_ShortCircuit_5680
  call __function_gamepad_button_r
  mov R2, R0
  igt R2, 0
  jf R2, __LogicalAnd_ShortCircuit_5684
  mov R3, [global_MoveTimer]
  ige R3, 15
  and R2, R3
__LogicalAnd_ShortCircuit_5684:
  or R1, R2
__LogicalOr_ShortCircuit_5680:
  mov R0, R1
  jf R0, __if_5675_end
__if_5688_start:
  call __function_gamepad_button_l
  mov R1, R0
  igt R1, 0
  mov R0, R1
  jf R0, __if_5688_else
  mov R0, [global_Free1]
  mov R1, [global_Selector]
  iadd R1, 9
  mov [R1], R0
  jmp __if_5688_end
__if_5688_else:
__if_5697_start:
  call __function_gamepad_button_r
  mov R1, R0
  igt R1, 0
  mov R0, R1
  jf R0, __if_5697_end
  mov R0, [global_Home1]
  mov R1, [global_Selector]
  iadd R1, 9
  mov [R1], R0
__if_5697_end:
__if_5688_end:
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [global_Selector]
  iadd R1, 4
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 4
  mov [R1], R0
  mov R2, [global_Selector]
  iadd R2, 9
  mov R1, [R2]
  mov R0, [R1]
  mov R1, [BP-2]
  iadd R1, 13
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 3
  mov [R1], R0
  mov R3, [global_Selector]
  iadd R3, 9
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 4
  mov [R1], R0
  mov R1, 1
  mov [SP], R1
  call __function_Play_Sound
__if_5675_end:
__if_5549_end:
__if_5412_end:
__if_5329_end:
__if_5246_end:
  mov R0, 0
  mov [global_StopFlag], R0
__if_5761_start:
  call __function_gamepad_button_a
  mov R1, R0
  igt R1, 0
  jf R1, __LogicalAnd_ShortCircuit_5766
  mov R2, [global_GrabTimer]
  ige R2, 15
  and R1, R2
__LogicalAnd_ShortCircuit_5766:
  mov R0, R1
  jf R0, __if_5761_end
  mov R1, 1
  mov [SP], R1
  call __function_Play_Sound
__if_5772_start:
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  ine R0, 61
  jf R0, __LogicalAnd_ShortCircuit_5781
  mov R3, [global_Selector]
  iadd R3, 1
  mov R2, [R3]
  iadd R2, 2
  mov R1, [R2]
  mov R3, [global_Selector]
  iadd R3, 2
  mov R2, [R3]
  ilt R1, R2
  and R0, R1
__LogicalAnd_ShortCircuit_5781:
  jf R0, __LogicalAnd_ShortCircuit_5786
  mov R1, [global_GrabFlag]
  ieq R1, 0
  and R0, R1
__LogicalAnd_ShortCircuit_5786:
  jf R0, __if_5772_else
  mov R3, [BP-2]
  iadd R3, 13
  mov R2, [R3]
  mov [SP], R2
  mov R2, 0
  mov [SP+1], R2
  call __function_Card_Count
  mov R1, R0
  mov [global_CardCount], R1
  mov R0, R1
  mov R2, [global_Free1]
  mov [SP], R2
  mov R2, 5
  mov [SP+1], R2
  call __function_Grab_Amount
  mov R1, R0
  mov [global_MaxGrab], R1
  mov R0, R1
  mov R3, [BP-2]
  iadd R3, 13
  mov R2, [R3]
  mov [SP], R2
  call __function_Grab_Check
  mov R1, R0
  mov [global_StopFlag], R1
  mov R0, R1
__if_5806_start:
  mov R0, [global_CardCount]
  mov R1, [global_MaxGrab]
  ile R0, R1
  jf R0, __LogicalAnd_ShortCircuit_5811
  mov R1, [global_StopFlag]
  ieq R1, 0
  and R0, R1
__LogicalAnd_ShortCircuit_5811:
  jf R0, __if_5806_end
  mov R1, [global_Selector]
  mov [SP], R1
  mov R1, [BP-2]
  mov [SP+1], R1
  mov R1, [global_CardCount]
  mov [SP+2], R1
  call __function_Grab_Cards
  mov R0, 0
  mov [global_GrabTimer], R0
  mov R0, 1
  mov [global_GrabFlag], R0
__if_5806_end:
  jmp __if_5772_end
__if_5772_else:
__if_5825_start:
  mov R0, [global_GrabFlag]
  ieq R0, 1
  jf R0, __LogicalAnd_ShortCircuit_5830
  mov R1, [global_GrabTimer]
  ige R1, 15
  and R0, R1
__LogicalAnd_ShortCircuit_5830:
  jf R0, __if_5825_end
  mov R4, [global_Selector]
  iadd R4, 1
  mov R3, [R4]
  mov R2, [R3]
  iadd R2, 11
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  mov [global_temp], R0
  mov R2, [BP-2]
  iadd R2, 13
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  imod R0, 13
  mov [global_RefMod13], R0
__if_5848_start:
  mov R0, [global_RefMod13]
  ieq R0, 0
  jf R0, __if_5848_end
  mov R0, 13
  mov [global_RefMod13], R0
__if_5848_end:
  mov R5, [global_Selector]
  iadd R5, 1
  mov R4, [R5]
  mov R3, [R4]
  iadd R3, 11
  mov R2, [R3]
  mov [SP], R2
  mov R2, 0
  mov [SP+1], R2
  call __function_Card_Count
  mov R1, R0
  mov [global_CardCount], R1
  mov R0, R1
  mov R4, [global_Selector]
  iadd R4, 1
  mov R3, [R4]
  mov R2, [R3]
  iadd R2, 11
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  imod R0, 13
  mov [global_SelectMod13], R0
  mov R2, [global_Selector]
  iadd R2, 9
  mov R1, [R2]
  iadd R1, 10
  mov R0, [R1]
  mov [global_type], R0
  mov R1, [global_Selector]
  mov [SP], R1
  mov R1, [BP-2]
  mov [SP+1], R1
  call __function_Placement
  mov R0, 0
  mov [global_Total], R0
__if_5825_end:
__if_5772_end:
__if_5761_end:
__if_5884_start:
  call __function_gamepad_button_start
  mov R1, R0
  igt R1, 0
  jf R1, __LogicalAnd_ShortCircuit_5889
  mov R2, [global_GrabTimer]
  ige R2, 15
  and R1, R2
__LogicalAnd_ShortCircuit_5889:
  jf R1, __LogicalAnd_ShortCircuit_5895
  mov R4, [BP-2]
  iadd R4, 13
  mov R3, [R4]
  iadd R3, 1
  mov R2, [R3]
  ine R2, 61
  and R1, R2
__LogicalAnd_ShortCircuit_5895:
  jf R1, __LogicalAnd_ShortCircuit_5901
  mov R4, [global_Selector]
  iadd R4, 1
  mov R3, [R4]
  iadd R3, 2
  mov R2, [R3]
  mov R4, [global_Selector]
  iadd R4, 2
  mov R3, [R4]
  ilt R2, R3
  and R1, R2
__LogicalAnd_ShortCircuit_5901:
  jf R1, __LogicalAnd_ShortCircuit_5906
  mov R2, [global_GrabFlag]
  ieq R2, 0
  and R1, R2
__LogicalAnd_ShortCircuit_5906:
  mov R0, R1
  jf R0, __if_5884_end
  mov R1, 1
  mov [SP], R1
  call __function_Play_Sound
  mov R3, [BP-2]
  iadd R3, 13
  mov R2, [R3]
  mov [SP], R2
  mov R2, 0
  mov [SP+1], R2
  call __function_Card_Count
  mov R1, R0
  mov [global_CardCount], R1
  mov R0, R1
  mov R2, [global_Free1]
  mov [SP], R2
  mov R2, 5
  mov [SP+1], R2
  call __function_Grab_Amount
  mov R1, R0
  mov [global_MaxGrab], R1
  mov R0, R1
  mov R3, [BP-2]
  iadd R3, 13
  mov R2, [R3]
  mov [SP], R2
  call __function_Grab_Check
  mov R1, R0
  mov [global_StopFlag], R1
  mov R0, R1
__if_5928_start:
  mov R0, [global_CardCount]
  mov R1, [global_MaxGrab]
  ile R0, R1
  jf R0, __LogicalAnd_ShortCircuit_5933
  mov R1, [global_StopFlag]
  ieq R1, 0
  and R0, R1
__LogicalAnd_ShortCircuit_5933:
  jf R0, __if_5928_end
  mov R1, [global_Selector]
  mov [SP], R1
  mov R1, [BP-2]
  mov [SP+1], R1
  mov R1, [global_CardCount]
  mov [SP+2], R1
  call __function_Grab_Cards
__if_5928_end:
  mov R0, 0
  mov [global_Total], R0
  mov R0, [global_Home1]
  mov [BP-11], R0
  mov R4, [global_Selector]
  iadd R4, 1
  mov R3, [R4]
  mov R2, [R3]
  iadd R2, 11
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  mov [global_temp], R0
  mov R1, [BP-11]
  mov [SP], R1
  mov R1, [global_Selector]
  mov [SP+1], R1
  mov R1, [BP-2]
  mov [SP+2], R1
  call __function_Placement_Check
  mov R0, 0
  mov [global_GrabTimer], R0
__if_5961_start:
  mov R3, [global_Selector]
  iadd R3, 1
  mov R2, [R3]
  mov R1, [R2]
  iadd R1, 11
  mov R0, [R1]
  ieq R0, -1
  jf R0, __if_5961_else
  mov R0, 0
  mov [global_GrabFlag], R0
  jmp __if_5961_end
__if_5961_else:
  mov R0, 1
  mov [global_GrabFlag], R0
__if_5961_end:
__if_5884_end:
  mov R0, [global_Free1]
  mov [BP-7], R0
  mov R0, -1
  mov [BP-8], R0
  mov R1, [global_Selector]
  iadd R1, 9
  mov R0, [R1]
  mov [BP-9], R0
  mov R1, [BP-2]
  iadd R1, 13
  mov R0, [R1]
  mov [BP-10], R0
__do_5990_start:
  mov R4, [BP-7]
  iadd R4, 1
  mov R3, [R4]
  mov R2, [R3]
  iadd R2, 11
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  imod R0, 13
  mov [global_SelectMod13], R0
__if_6001_start:
  mov R2, [BP-7]
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  ine R0, 61
  jf R0, __if_6001_end
  mov R0, [global_Home1]
  mov [BP-11], R0
__do_6011_start:
__if_6013_start:
  mov R2, [BP-11]
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  ieq R0, 61
  jf R0, __LogicalAnd_ShortCircuit_6020
  mov R1, [global_SelectMod13]
  ieq R1, 1
  and R0, R1
__LogicalAnd_ShortCircuit_6020:
  jf R0, __if_6013_else
  mov R1, [BP-7]
  mov R0, [R1]
  mov [BP-8], R0
  mov R2, [BP-11]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP-8]
  iadd R1, 3
  mov [R1], R0
  mov R2, [BP-11]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP-8]
  iadd R1, 4
  mov [R1], R0
  mov R2, [BP-7]
  mov [SP], R2
  lea R2, [BP-8]
  mov [SP+1], R2
  call __function_pop
  mov R1, R0
  mov [BP-7], R1
  mov R0, R1
  mov R2, [BP-11]
  mov [SP], R2
  mov R2, [BP-8]
  mov [SP+1], R2
  call __function_push
  mov R1, R0
  mov [BP-11], R1
  mov R0, R1
  jmp __do_6011_end
  jmp __if_6013_end
__if_6013_else:
__if_6052_start:
  mov R2, [BP-11]
  mov R1, [R2]
  iadd R1, 1
  mov R0, [R1]
  iadd R0, 1
  mov R5, [BP-7]
  iadd R5, 1
  mov R4, [R5]
  mov R3, [R4]
  iadd R3, 11
  mov R2, [R3]
  iadd R2, 1
  mov R1, [R2]
  ieq R0, R1
  jf R0, __if_6052_end
  mov R1, [BP-7]
  mov R0, [R1]
  mov [BP-8], R0
  mov R2, [BP-11]
  mov R1, [R2]
  iadd R1, 3
  mov R0, [R1]
  mov R1, [BP-8]
  iadd R1, 3
  mov [R1], R0
  mov R2, [BP-11]
  mov R1, [R2]
  iadd R1, 4
  mov R0, [R1]
  mov R1, [BP-8]
  iadd R1, 4
  mov [R1], R0
  mov R2, [BP-7]
  mov [SP], R2
  lea R2, [BP-8]
  mov [SP+1], R2
  call __function_pop
  mov R1, R0
  mov [BP-7], R1
  mov R0, R1
  mov R2, [BP-11]
  mov [SP], R2
  mov R2, [BP-8]
  mov [SP+1], R2
  call __function_push
  mov R1, R0
  mov [BP-11], R1
  mov R0, R1
  jmp __do_6011_end
__if_6052_end:
__if_6013_end:
  mov R1, [BP-11]
  iadd R1, 5
  mov R0, [R1]
  mov [BP-11], R0
__do_6011_continue:
  mov R0, [BP-11]
  mov R1, [global_Stack1]
  ine R0, R1
  jt R0, __do_6011_start
__do_6011_end:
__if_6001_end:
  mov R1, [BP-7]
  iadd R1, 5
  mov R0, [R1]
  mov [BP-7], R0
__do_5990_continue:
  mov R0, [BP-7]
  ine R0, -1
  jt R0, __do_5990_start
__do_5990_end:
  mov R1, [global_Selector]
  mov [SP], R1
  mov R1, 0
  mov [SP+1], R1
  mov R1, 17
  mov [SP+2], R1
  call __function_Move_Stack
  mov R2, [global_Stack1]
  mov [SP], R2
  call __function_End_Check
  mov R1, R0
  mov [global_Size1], R1
  mov R0, R1
  mov R2, [global_Stack2]
  mov [SP], R2
  call __function_End_Check
  mov R1, R0
  mov [global_Size2], R1
  mov R0, R1
  mov R2, [global_Stack3]
  mov [SP], R2
  call __function_End_Check
  mov R1, R0
  mov [global_Size3], R1
  mov R0, R1
  mov R2, [global_Stack4]
  mov [SP], R2
  call __function_End_Check
  mov R1, R0
  mov [global_Size4], R1
  mov R0, R1
  mov R2, [global_Stack5]
  mov [SP], R2
  call __function_End_Check
  mov R1, R0
  mov [global_Size5], R1
  mov R0, R1
  mov R2, [global_Stack6]
  mov [SP], R2
  call __function_End_Check
  mov R1, R0
  mov [global_Size6], R1
  mov R0, R1
  mov R2, [global_Stack7]
  mov [SP], R2
  call __function_End_Check
  mov R1, R0
  mov [global_Size7], R1
  mov R0, R1
  mov R2, [global_Stack8]
  mov [SP], R2
  call __function_End_Check
  mov R1, R0
  mov [global_Size8], R1
  mov R0, R1
__if_6143_start:
  mov R0, [global_Size1]
  ieq R0, 0
  jf R0, __LogicalAnd_ShortCircuit_6148
  mov R1, [global_Size2]
  ieq R1, 0
  and R0, R1
__LogicalAnd_ShortCircuit_6148:
  jf R0, __LogicalAnd_ShortCircuit_6152
  mov R1, [global_Size3]
  ieq R1, 0
  and R0, R1
__LogicalAnd_ShortCircuit_6152:
  jf R0, __LogicalAnd_ShortCircuit_6156
  mov R1, [global_Size4]
  ieq R1, 0
  and R0, R1
__LogicalAnd_ShortCircuit_6156:
  jf R0, __LogicalAnd_ShortCircuit_6160
  mov R1, [global_Size5]
  ieq R1, 0
  and R0, R1
__LogicalAnd_ShortCircuit_6160:
  jf R0, __LogicalAnd_ShortCircuit_6164
  mov R1, [global_Size6]
  ieq R1, 0
  and R0, R1
__LogicalAnd_ShortCircuit_6164:
  jf R0, __LogicalAnd_ShortCircuit_6168
  mov R1, [global_Size7]
  ieq R1, 0
  and R0, R1
__LogicalAnd_ShortCircuit_6168:
  jf R0, __LogicalAnd_ShortCircuit_6172
  mov R1, [global_Size8]
  ieq R1, 0
  and R0, R1
__LogicalAnd_ShortCircuit_6172:
  jf R0, __LogicalAnd_ShortCircuit_6176
  mov R1, [global_EndFlag]
  ieq R1, 1
  and R0, R1
__LogicalAnd_ShortCircuit_6176:
  jf R0, __if_6143_end
  mov R0, 0
  mov [global_EndFlag], R0
__if_6143_end:
  mov R0, [global_MoveTimer]
  mov R1, R0
  iadd R1, 1
  mov [global_MoveTimer], R1
  mov R0, [global_GrabTimer]
  mov R1, R0
  iadd R1, 1
  mov [global_GrabTimer], R1
  call __function_end_frame
  jmp __while_4260_start
__while_4260_end:
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
__literal_string_2182:
  string "ERROR! FAILED TO ALLOCATE MEMORY"
__literal_string_4226:
  string "eMOVE WITH ARROWSe"
__literal_string_4232:
  string "aX TO MANUALLY PICK UPa"
__literal_string_4238:
  string "qENTER TO AUTO PICK/PLACEq"
__literal_string_4244:
  string "sPRESS ENTER TO PLAYt"
__literal_string_5188:
  string "dYOU WINd"
__literal_string_5194:
  string "PRESS CNTRL+R TO NEW+"
__literal_string_5200:
  string "."
__literal_string_5208:
  string "."
__literal_string_5216:
  string "."
__literal_string_5224:
  string "."
