extends Node2D

export(float) var speed = 100

onready var parent = $"../"
onready var animation_player = $"../AnimationPlayer"

var movement = Vector2()

func _ready():
	animation_player.playback_speed = 0.02 * speed

func _physics_process(delta):
	parent.position += movement * speed * delta

func _process(delta):
	movement = Vector2()
	var animation = ""
	
	if Input.is_action_pressed("move_up"): 
		movement.y -= 1
		animation = "walk_up"
		
	if Input.is_action_pressed("move_right"): 
		movement.x += 1
		animation = "walk_right"
		
	if Input.is_action_pressed("move_down"): 
		movement.y += 1
		animation = "walk_down"
		
	if Input.is_action_pressed("move_left"): 
		movement.x -= 1
		animation = "walk_left"
	
	if animation: animation_player.play(animation)
	else: animation_player.stop()