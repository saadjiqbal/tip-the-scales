extends Control

func _ready() -> void:
	$FireAnimation.play("fire")
	$SFX_Lose.play()

func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
