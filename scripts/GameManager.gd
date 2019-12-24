extends Node2D

var Explosion = load("res://game-objects/Explosion.tscn")
var Character = load("res://game-objects/Character.tscn")
var explosion = null

onready var level_node = $"../"
onready var character = $"../Character"
onready var respawn_flag = $"../RespawnFlag"

func _ready():
	listen_to_character_death(character)
	
func listen_to_character_death(character):
	character.connect("died", self, "_on_Character_died")
	
func _on_Character_died(character):
	var character_position = character.position
	character.visible = false
	
	explosion = Explosion.instance()
	explosion.position = character_position
	level_node.add_child(explosion)
	
	var anim_player = explosion.get_node("AnimationPlayer")
	anim_player.connect("animation_finished", self, "_on_Explosion_animation_finished")

func _on_Explosion_animation_finished(anim_name):
	if explosion: explosion.queue_free()
	
	var new_character = Character.instance()
	new_character.position = respawn_flag.position
	
	self.character.queue_free()
	level_node.add_child(new_character)
	
	listen_to_character_death(new_character)
	self.character = new_character