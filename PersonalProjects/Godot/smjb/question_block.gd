extends Area2D

enum State { UNBUMPED, BUMPED };
var state: int = State.UNBUMPED;
var original_pos: Vector2;

func _ready():
	original_pos = position;

func _on_body_entered(body):
	if body.is_in_group("Player") and state == State.UNBUMPED:
		bump_block();

#Logic for block bumping
func bump_block():
	state = State.BUMPED;
	$AnimatedSprite2D.frame = 1;	#Indicates "used" state
	Global.spawn_mushroom(self.global_position + Vector2(0,-20) );
	bump_upwards();
	var timer = get_tree().create_timer(0.2);
	await timer.timeout;
	return_to_original_pos();

func bump_upwards():
	position.y -= 10;

func return_to_original_pos():
	position = original_pos;
