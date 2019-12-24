extends Node2D

var Explosion = load("res://game-objects/Explosion.tscn")

onready var level_node = $"../"
onready var character = $"../Character"

func _ready():
	listen_to_character_death(character)

func listen_to_character_death(character):
	character.connect("died", self, "_on_Character_died")

func reload_level():
	get_tree().reload_current_scene()

func _on_Character_died(character):
	character.visible = false
	
	var explosion = Explosion.instance()
	explosion.position = character.position
	level_node.add_child(explosion)
	
	var anim_player = explosion.get_node("AnimationPlayer")
	anim_player.connect("animation_finished", self, "_on_Explosion_animation_finished")

func _on_Explosion_animation_finished(anim_name):
	reload_level()
