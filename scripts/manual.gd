extends Sprite2D

var is_open : bool
# Called when the node enters the scene tree for the first time.
func _ready():
	rotation = -0.097
	is_open = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			if is_open == true:
				$AnimationPlayer.play("open_manual")
				is_open = false
				print("false")
			elif is_open == false:
				$AnimationPlayer.play_backwards("open_manual")
				is_open = true
				print("true")
