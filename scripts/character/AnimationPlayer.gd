extends AnimationPlayer

var is_in_camo = false

onready var parent = $"../"
onready var sprite = $"../Sprite"
onready var init_sprite_frame = sprite.frame

func _ready():
	parent.connect("camo_changed", self, "_on_Character_camo_changed")

# override
func play(name="", custom_blend=-1, custom_speed=1.0, from_end=false):
	if is_in_camo: name = "camo_walk"
	.play(name, custom_blend, custom_speed, from_end)
	
func _on_Character_camo_changed(camo):
	is_in_camo = camo.type != "none"
	sprite.frame = camo.parameters["sprite_frame"]
	
	if not is_in_camo:
		sprite.position = Vector2()
		sprite.rotation_degrees = 0