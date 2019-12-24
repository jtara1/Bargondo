extends KinematicBody2D
class_name Character

signal item_consumed
signal camo_changed
signal died

export(float) var speed = 150 setget , get_speed

func _physics_process(delta):
	process_collisions()

func consume(item):
	emit_signal("item_consumed", item)
	item.queue_free()
	$AudioStreamPlayer2D.play(10)
	
func get_speed():
	return speed * $CharacterCamo.camo.get_speed_mult()

func process_collisions():
	for index in get_slide_count():
		var collision = get_slide_collision(index)

		if "Enemy" in collision.collider.name:
			die()

func die():
	emit_signal("died", self)