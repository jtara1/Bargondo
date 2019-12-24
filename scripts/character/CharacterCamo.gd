extends Node2D

var Camo = load("res://scripts/Camo.gd")
var camo = Camo.new()

onready var parent = $"../"

func _input(event):
	var camo_type = ""
	
	if event.is_action_pressed("skill1"): camo_type = "none"
	if event.is_action_pressed("skill2"): camo_type = "tree"
	if event.is_action_pressed("skill3"): camo_type = "trash_can"
	
	if camo_type: set_camo(camo_type)

func set_camo(camo_type):
	camo = Camo.new(camo_type)
	parent.emit_signal("camo_changed", camo)