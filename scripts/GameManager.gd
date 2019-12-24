extends Node2D

var Explosion = load("res://game-objects/Explosion.tscn")
var Character = load("res://game-objects/Character.tscn")
var explosion = null

onready var level_node = $"../"
onready var character = $"../Character"
onready var respawn_flag = $"../RespawnFlag"

func _ready():
	character.connect("died", self, "_on_Character_died")
	
func _on_Character_died(character):
	var character_position = character.position
	character.queue_free()
	
	var explosion = Explosion.instance()
	explosion.position = character_position
	level_node.add_child(explosion)
	
	var anim_player = explosion.get_node("AnimationPlayer")
	anim_player.connect("animation_finished", self, "_on_Explosion_animation_finished")
	anim_player.play("explosion")
	return
	
func _on_Explosion_animation_finished(anim_name):
	print('expl done')
	if explosion: explosion.queue_free()
	
	var character = Character.instance()
	character.position = respawn_flag.position
	
	level_node.add_child(character)
	self.character = character
	