extends Node

var resize_object : bool = false
var mouse_in_object : bool = false

var current_mouse_pos : Vector2
var new_mouse_pos : Vector2

var collision_shape2d : CollisionShape2D
var sprite_2d : Sprite2D

func _ready() -> void:
	pass

func _physics_process(delta) -> void:
	new_mouse_pos = get_viewport().get_mouse_position()

	if Input.is_action_pressed("click") && mouse_in_object:
		resize_object = true

	if Input.is_action_just_released("click"):
		resize_object = false

	if resize_object:
		# This will break if we give these nodes a different name
		collision_shape2d = get_node("Area2D/CollisionShape2D")
		sprite_2d = get_node("Sprite2D")

		# If we move mouse to the right, increase sprite and collision scale.
		# Else if, we move mouse to the left, decrease sprite and collision scale.
		if (new_mouse_pos.x - current_mouse_pos.x > 0):
			sprite_2d.scale.x += sprite_2d.scale.x * delta
			sprite_2d.scale.y += sprite_2d.scale.y * delta

			collision_shape2d.scale.x += collision_shape2d.scale.x * delta
			collision_shape2d.scale.y += collision_shape2d.scale.y * delta
		elif (new_mouse_pos.x - current_mouse_pos.x < 0):
			sprite_2d.scale.x += -sprite_2d.scale.x * delta
			sprite_2d.scale.y += -sprite_2d.scale.y * delta

			collision_shape2d.scale.x += -collision_shape2d.scale.x * delta
			collision_shape2d.scale.y += -collision_shape2d.scale.y * delta

func _on_area_2d_mouse_entered():
	current_mouse_pos = get_viewport().get_mouse_position()
	mouse_in_object = true
	pass
	
func _on_area_2d_mouse_exited():
	mouse_in_object = false
	pass
