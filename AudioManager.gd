extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var music_file = "res://bgm/HappyLevel.wav"
	var stream = AudioStream.new()
	var music_player = AudioStreamPlayer.new()
	if File.new().file_exists(music_file):
		var music = load(music_file)
		music_player.stream = music
		music_player.volume_db = -20
		music_player.play()
		
		add_child(music_player)
		music_player.bus = "music"