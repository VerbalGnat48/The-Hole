extends CharacterBody2D

#Constants
const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const JUMP_HEIGHT = 500

#Variables
@onready var wave_layer: TileMapLayer = $"../Platform WAVE"
@onready var grid_layer: TileMapLayer = $"../Platform GRID"
@onready var round_layer: TileMapLayer = $"../Platform ROUND"
@onready var switcher: Node = $color_controller

var last_pos: Vector2
var is_in_color = false
var is_in_ground = false

#Methods
func _physics_process(delta):
	#Detect if player is in a block
	color_collider_wave()
	color_collider_grid()
	color_collider_round()
	
	#Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	#Jumping
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("BigJump") and is_on_floor():
		velocity = Vector2(1 * 1, -JUMP_HEIGHT);
	#Falling
	if Input.is_action_just_released("Jump") and velocity.y < 0:
		velocity.y *= 0.5;

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func block_up_yeet():
	velocity = Vector2(1 * 1, -JUMP_HEIGHT)
	position.y -= 25

#Make player go up when inside tiles and on the same mask layer
func color_collider_wave():
	var tile_data = wave_layer.get_cell_tile_data(wave_layer.local_to_map(global_position))
	if tile_data && get_collision_mask_value(2):
		block_up_yeet()
func color_collider_grid():
	var tile_data = grid_layer.get_cell_tile_data(grid_layer.local_to_map(global_position))
	if tile_data && get_collision_mask_value(3):
		block_up_yeet()
func color_collider_round():
	var tile_data = round_layer.get_cell_tile_data(round_layer.local_to_map(global_position))
	if tile_data && get_collision_mask_value(4):
		block_up_yeet()

func is_only_mask_layer_1_active() -> bool:
	return collision_mask == 1


func _on_area_2d_body_entered(body):
	if body.is_in_group("Color Layers"):
		is_in_color = true

func _on_area_2d_body_exited(body):
	if body.is_in_group("Color Layers"):
		is_in_color = false
