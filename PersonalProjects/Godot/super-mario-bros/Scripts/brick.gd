extends Block;

class_name Brick;

func bump(player_node: Player.PlayerMode):
	if player_node == Player.PlayerMode.SMALL:
		super.bump(player_node);
