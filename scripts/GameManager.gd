extends Node2D

var Explosion = load("res://game-objects/Explosion.tscn")

onready var level_node = $"../"
onready var character = $"../Character"
onready var canvas = $"../CanvasLayer/GameStateUI"

func _ready():
	listen_to_character_death(character)
	listen_to_game_countdown_timer(character)

func listen_to_character_death(character):
	character.connect("died", self, "_on_Character_died")

func listen_to_game_countdown_timer(character):
	character.get_node("CanvasLayer/GameUI").connect("game_timer_ended", self, "_on_GameUI_game_timer_ended")

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

func _on_GameUI_game_timer_ended():
	canvas.get_node("AnimationPlayer").play("game_state_ui_banner")

func _on_AnimationPlayer_animation_finished(anim_name):
	reload_level()
