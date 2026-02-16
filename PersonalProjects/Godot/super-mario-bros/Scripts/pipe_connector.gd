extends StaticBody2D;

class_name PipeConnector;

@export var retrun_point: Vector2;

func _on_entrance_body_entered(body):
	SceneData.return_point = retrun_point;
	(body as Player).handle_pipe_connector_entrance_collision();
