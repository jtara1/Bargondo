extends Node

func _ready():
	var music_file = "res://bgm/HappyLevel.wav"
	var music_player = AudioStreamPlayer.new()
	
	var music = load(music_file)
	music_player.stream = music
	music_player.volume_db = -20
	music_player.play()
	
	add_child(music_player)
	music_player.bus = "music"