extends Control

func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _process(_delta) -> void:
	# When pause pressed, if paused: unpause. Else: pause
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			self.hide()
			get_tree().paused = false
		else:
			self.show()
			get_tree().paused = true
