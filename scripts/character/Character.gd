extends KinematicBody2D
class_name Character

signal item_consumed
signal camo_changed
signal died

export(float) var speed = 150 setget , get_speed

func _physics_process(delta):
	process_collisions()

func consume(item):
	# TODO: play sound 
	emit_signal("item_consumed", item)
	item.queue_free()
	
func get_speed():
#	return speed * $CharacterCamo.camo.get_speed_mult()
	var spd = speed * $CharacterCamo.camo.get_speed_mult()
	print(spd)
	return spd

func process_collisions():
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if "Enemy" in collision.collider.name:
			die()

func die():
	emit_signal("died")