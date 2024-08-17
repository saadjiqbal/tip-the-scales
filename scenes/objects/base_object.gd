extends StaticBody2D

@export var target_scale: float

func _physics_process(delta: float) -> void:
	if (not is_on_floor()):
		global_position.y += 50 * delta
