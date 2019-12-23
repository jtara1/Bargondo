extends Area2D
class_name Pizza

func _on_Pizza_body_entered(body):
	if body is Character:
		body.consume(self)
