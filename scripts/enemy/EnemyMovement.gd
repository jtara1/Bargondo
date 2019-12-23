extends Node2D

export(float) var close_enough_to_target_threshold = 25

var target_index = 0

onready var parent = $"../"
onready var speed = parent.speed
onready var movement_targets = [parent.position]

func _ready():
	load_movement_targets()

func _physics_process(delta):
	var target = get_movement_target_position()
	parent.position = parent.position.linear_interpolate(target, delta * speed)
	
func get_movement_target_position():
	var delta_position = parent.position - get_movement_target()
	if delta_position.length() <= close_enough_to_target_threshold:
		return movement_targets[get_next_target_index()]
	
	return get_movement_target()

func get_next_target_index():
	var next_index = target_index + 1
	if next_index >= len(movement_targets):
		next_index = 0
	
	target_index = next_index
	return next_index
	
func get_movement_target():
	return movement_targets[target_index]
	
func load_movement_targets():
	var targets_container = $"../MovementTargets"
	if not targets_container:
		print_debug("Enemy: needs MovementTargets Node2D & children for it")
		return
		
	for child in targets_container.get_children():
		movement_targets.append(child.global_position)