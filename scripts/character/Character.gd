extends KinematicBody2D
class_name Character

signal item_consumed
signal camo_changed

export(float) var speed = 150 setget , get_speed

onready var Camo = load("res://scripts/Camo.gd")
onready var camo = Camo.new()
#onready var camo = Camo.new() setget set_camo

func consume(item):
	# TODO: play sound 
	emit_signal("item_consumed", item)
	item.queue_free()
	pass
	
func get_speed():
	return speed * 1 if not camo else camo.get_speed_mult()

func set_camo(camo_type):
	camo = Camo.new(camo_type)
	emit_signal("camo_changed", camo)