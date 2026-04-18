extends Block;

class_name Brick;

func bump(player_node: Player.PlayerMode):
	if player_node == Player.PlayerMode.SMALL:
		super.bump(player_node);
	#Break Bricks if Big/Shooting
	else:
		super.bump(player_node);
		await get_tree().create_timer(0.2).timeout
		queue_free();
