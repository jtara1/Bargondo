extends KinematicBody2D

signal item_consumed

func consume(item):
	# TODO: play sound 
	emit_signal("item_consumed", item)
	item.queue_free()
	pass