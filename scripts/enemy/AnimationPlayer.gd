extends AnimationPlayer

onready var parent = $"../"
onready var last_position = parent.position

func _ready():
	load_animations()

func _process(delta):
	play_based_on_delta_movement()
	
func play_based_on_delta_movement():
	var delta = parent.position - last_position
	var use_horizontal = abs(delta.x) > abs(delta.y)
	var animation = ""
	
	if use_horizontal:
		if delta.x > 0: animation = "walk_right"
		if delta.x < 0: animation = "walk_left"
	else:
		if delta.y > 0: animation = "walk_down"
		if delta.y < 0: animation = "walk_up"
	
	last_position = parent.position
	if animation:
		play(animation)
		
func load_animations():
	for animation_name in get_animation_list():
		var animation = get_animation(animation_name)
#		animation.remove_track(0)
		
		var track_index = animation.add_track(Animation.TYPE_VALUE)
		animation.track_set_interpolation_type(track_index, Animation.INTERPOLATION_NEAREST)
		animation.length = 3
		animation.loop = true
	
		animation.track_set_path(track_index, "Sprite:frame")
		
		var hframes = 27
		var offset = 0

		if animation_name == "walk_left": offset = -3
		if animation_name == "walk_down": offset = -2
		if animation_name == "walk_up": offset = -1
		
		var col_index = 27 + offset
		
		animation.track_insert_key(track_index, 0, (hframes - 1 + offset) + 27 * 9)
		animation.track_insert_key(track_index, 1, (hframes - 1 + offset) + 27 * 10)
		animation.track_insert_key(track_index, 2, (hframes - 1 + offset) + 27 * 11)
