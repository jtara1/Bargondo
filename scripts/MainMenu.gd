extends Control

func _on_Start_pressed():
	get_tree().change_scene("res://levels/Level_0.tscn")

func _on_About_pressed():
	$TextureRect/AcceptDialog.popup()

func _on_Quit_pressed():
	get_tree().quit()
