extends Control

func play(banner_text="     Time Exhausted!"):
	if banner_text:
		$ColorRect/RichTextLabel.text = "\n" + banner_text
	$AnimationPlayer.play("game_state_ui_banner")