extends Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Teleports the object coliding with the raycast
	if Input.is_action_just_pressed("ui_accept") and $RayCast2D.is_colliding():
		$RayCast2D.get_collider().position = Vector2(1600, 0)
		$AudioStreamPlayer.play()
