extends StaticBody2D;

class_name Pipe;

const TOP_PIPE_HEIGHT = 16;

@export var height = 32;
@export var is_traversable = false;

@onready var collision_shape_2d = $CollisionShape2D;
@onready var pipe_body_sprite = $PipeBody;

func _ready():
	var shape = RectangleShape2D.new();
	shape.size = Vector2(32, height);
	collision_shape_2d.shape = shape;
	collision_shape_2d.position = Vector2(0, height/2 - TOP_PIPE_HEIGHT/2);
	
	#Repeat bottom half of pipe until it reaches the ground/set height
	var remaining_pipe_height = height - 16;
	for i in range(remaining_pipe_height/16):
		var new_pipe_body = Sprite2D.new();
		new_pipe_body.texture = pipe_body_sprite.texture;
		new_pipe_body.region_enabled = true;
		new_pipe_body.region_rect = Rect2(256, 16, 32, 16);
		new_pipe_body.position = Vector2(0, remaining_pipe_height);
		add_child(new_pipe_body);
		remaining_pipe_height -= 16;
