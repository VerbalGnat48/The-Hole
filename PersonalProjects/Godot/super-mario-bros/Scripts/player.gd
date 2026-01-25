extends CharacterBody2D

class_name Player;

var gravity = ProjectSettings.get_order("physics/2d/default_gravity");

enum PlayerMode {
	 SMALL,
	BUG,
	SHOOTING
}

#References
@onready var animated_sprite_2d = $AnimatedSprite2D as PlayerAnimations;
@onready var area_collision_shape = $Area2D/AreaCollisionShape;
@onready var body_collision_shape = $BodyCollisionShape;

@export_group("Locomotion")
@export var run_speed_damping = 0.5;
@export var speed = 200;
@export var jump_velocity = -350;
@export_group("")

var player_mode = PlayerMode.SMALL;

#Methods
func _physics_process(delta):
	#Apply Gravity
	if not is_on_floor():
		velocity.y += gravity * delta;
	
	#Handle Jumping Height
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity;
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y *= 0.5;
	
	#Handle Axis Movement
	var direction = Input.get_axis("left", "right");
	if direction:
		#Move from one speed to another
		velocity.x = lerpf(velocity.x, speed * direction, run_speed_damping * delta);
	else:
		#Move towards 0 from current speed
		velocity.x = move_toward(velocity.x, 0, speed * delta);
	
	animated_sprite_2d.trigger_animation(velocity, direction, player_mode);
	move_and_slide();
	
	
