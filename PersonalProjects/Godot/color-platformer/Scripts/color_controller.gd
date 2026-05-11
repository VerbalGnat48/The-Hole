extends Node

#Variables
var slowmo: bool = false;
var shader_material: ShaderMaterial
var player: CharacterBody2D

#Methods
func _ready():
	shader_material = $"../AnimatedSprite2D".material
	player = $".."

#Switch between what color the player is
func set_color_collision(color_id: int):
	shader_material.set_shader_parameter("palette_index", color_id)
	for i in range(2, 5):
		player.set_collision_mask_value(i, false)
	player.set_collision_mask_value(color_id + 1, true)
	color_id = 0;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):	
	if event.is_action_pressed("select_left"): # && Engine.time_scale == 0.1:
		set_color_collision(0)
	#Red
	if event.is_action_pressed("select_up"): # && Engine.time_scale == 0.1:
		set_color_collision(1)
	#Green
	if event.is_action_pressed("select_right"): # && Engine.time_scale == 0.1:
		set_color_collision(2)
	#Blue
	if event.is_action_pressed("select_down"): # && Engine.time_scale == 0.1:
		set_color_collision(3)
