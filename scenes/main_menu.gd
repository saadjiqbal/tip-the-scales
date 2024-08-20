extends Control

@onready var game_scene: PackedScene = preload("res://scenes/game.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)
	
#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("pause"):
		#if get_tree().paused:
			#unpause()
		#elif (not get_tree().paused):
			#pause()
