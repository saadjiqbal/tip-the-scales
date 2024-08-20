extends Control

func  _ready() -> void:
	$SFX_Win.play()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
	
func _on_restart_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
