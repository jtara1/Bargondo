extends KinematicBody2D
class_name Character

signal item_consumed

func consume(item):
	# TODO: play sound 
	emit_signal("item_consumed", item)
	item.queue_free()
	pass