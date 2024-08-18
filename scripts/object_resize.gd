extends RigidBody2D

var scale_object_up : bool = false
var scale_object_down : bool = false
var mouse_in_object : bool = false

var current_mouse_pos : Vector2
var new_mouse_pos : Vector2

var collision_shape2d : CollisionShape2D
var sprite_2d : Sprite2D
var physics_collision_shape : CollisionShape2D

func _ready() -> void:
	pass

func _physics_process(delta) -> void:
	scale_object(delta)

func scale_object(delta):
	#Left click to scale up, right click to scale down
	
	# This will break if we give these nodes a different name
	collision_shape2d = get_node("Area2D/CollisionShape2D")
	sprite_2d = get_node("Sprite2D")
	physics_collision_shape = get_node("CollisionShape2D")

	#Left click to scale up the object
	if Input.is_action_pressed("LeftClick") && mouse_in_object:
		scale_object_up = true
		if $AudioStreamPlayer2D.playing == false:
			$AudioStreamPlayer2D.playing = true

	if Input.is_action_just_released("LeftClick"):
		scale_object_up = false
		if $AudioStreamPlayer2D.playing == true:
			$AudioStreamPlayer2D.playing = false

	if scale_object_up:
		sprite_2d.scale.x += sprite_2d.scale.x * delta
		sprite_2d.scale.y += sprite_2d.scale.y * delta

		collision_shape2d.scale.x += collision_shape2d.scale.x * delta
		collision_shape2d.scale.y += collision_shape2d.scale.y * delta

		physics_collision_shape.scale.x += physics_collision_shape.scale.x * delta
		physics_collision_shape.scale.y += physics_collision_shape.scale.y * delta

	#Right click to scale the object down
	if Input.is_action_pressed("RightClick") && mouse_in_object:
		scale_object_down = true
		if $AudioStreamPlayer2D.playing == false:
			$AudioStreamPlayer2D.playing = true

	if Input.is_action_just_released("RightClick"):
		scale_object_down = false
		if $AudioStreamPlayer2D.playing == true:
			$AudioStreamPlayer2D.playing = false

	if scale_object_down:
		sprite_2d.scale.x += -sprite_2d.scale.x * delta
		sprite_2d.scale.y += -sprite_2d.scale.y * delta

		collision_shape2d.scale.x += -collision_shape2d.scale.x * delta
		collision_shape2d.scale.y += -collision_shape2d.scale.y * delta

		physics_collision_shape.scale.x += -physics_collision_shape.scale.x * delta
		physics_collision_shape.scale.y += -physics_collision_shape.scale.y * delta

func _on_area_2d_mouse_entered():
	current_mouse_pos = get_viewport().get_mouse_position()
	mouse_in_object = true
	pass
	
func _on_area_2d_mouse_exited():
	mouse_in_object = false
	pass
