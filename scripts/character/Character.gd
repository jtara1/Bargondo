extends KinematicBody2D
class_name Character

signal item_consumed
signal camo_changed

export(float) var speed = 150 setget , get_speed

func consume(item):
	# TODO: play sound 
	emit_signal("item_consumed", item)
	item.queue_free()
	
func get_speed():
#	return speed * $CharacterCamo.camo.get_speed_mult()
	var spd = speed * $CharacterCamo.camo.get_speed_mult()
	print(spd)
	return spd
