extends Area2D;

class_name ShootingFlower;

@export var horizontal_speed = 20;
@export var max_vertical_speed = 120;
@export var vertical_velcoity_gain = .1;
@onready var shape_cast_2d = $ShapeCast2D;

var allow_horizontal_movement = false;
var vertical_speed = 0;

func _ready():
	var spawn_tween = get_tree().create_tween();
	spawn_tween.tween_property(self,"position", position + Vector2(0, -16), .4);
	spawn_tween.tween_callback(func():allow_horizontal_movement = true);

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free();
