extends Node;

var total_coins = 0;
var player_lives = 3;

func spawn_mushroom(pos):
	var MushRoomScene = load("res://mushroom.tscn");
	var mushroom = MushRoomScene.instantiate();
	mushroom.global_position = pos;
	get_tree().root.add_child(mushroom);
