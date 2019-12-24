extends Node2D

onready var level_node = $"../"
onready var character = $"../Character"
onready var respawn_flag = $"../RespawnFlag"

func _ready():
	character.connect("died", self, "_on_Character_died")
	
func _on_Character_died(character):
	var position = character.position
	character.queue_free()
	
	var sprite = Sprite.new()
	