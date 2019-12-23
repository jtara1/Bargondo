extends Area2D

onready var Character = load("res://game-objects/Character.tscn")

func _on_Pizza_body_entered(body):
	if body is Character:
		body.consume(self)
