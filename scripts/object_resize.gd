extends RigidBody2D

# VARIABLES

var scale_object_up : bool = false
var scale_object_down : bool = false
var mouse_in_object : bool = false

var physics_collision_shape : CollisionShape2D
var collision_shape2d : CollisionShape2D

var sprite_2d : Sprite2D

var current_mouse_pos : Vector2
var new_mouse_pos : Vector2

func _ready() -> void:
	pass

func _physics_process(delta) -> void:
	scale_object(delta)
	if Input.is_action_just_released("ui_accept"):
		#Object needs to be slighly moved after stoping on the coveyor
		#This is because once the conveyor stops and starts again,
		#objects do not continue to follow the conveyors colision box once
		#it starts moving again.
		#DO NOT DELETE unless you have an alternate solution
		jitter_scale_up()
		get_tree().create_timer(0.02).timeout.connect(jitter_scale_down)

func jitter_scale_up():
	#Ment to jitter the object to prevent it from getting stuck on the conveyor
	sprite_2d.scale.x += 0.01
	sprite_2d.scale.y += 0.01

	collision_shape2d.scale.x += 0.01
	collision_shape2d.scale.y += 0.01

	physics_collision_shape.scale.x += 0.01
	physics_collision_shape.scale.y += 0.01


func jitter_scale_down():
	#It's only purpose is to scale the item back to what it was after
	#the jitter_scale_up function is exicuted
	sprite_2d.scale.x -= 0.01
	sprite_2d.scale.y -= 0.01

	collision_shape2d.scale.x -= 0.01
	collision_shape2d.scale.y -= 0.01

	physics_collision_shape.scale.x -= 0.01
	physics_collision_shape.scale.y -= 0.01

func scale_object(delta) -> void:
	# Left click to scale up, right click to scale down
	
	# This will break if we give these nodes a different name
	collision_shape2d = get_node("Area2D/CollisionShape2D")
	sprite_2d = get_node("Sprite2D")
	physics_collision_shape = get_node("CollisionShape2D")

	# Left click to scale up the object
	if Input.is_action_pressed("LeftClick") && mouse_in_object:
		if sprite_2d.scale.x <= 1.5:
			scale_object_up = true
		else:
			scale_object_up = false

		if !$AudioStreamPlayer.playing:
			$AudioStreamPlayer.playing = true

	if Input.is_action_just_released("LeftClick"):
		scale_object_up = false

		if $AudioStreamPlayer.playing:
			$AudioStreamPlayer.playing = false

	if scale_object_up:
		sprite_2d.scale.x += sprite_2d.scale.x * delta
		sprite_2d.scale.y += sprite_2d.scale.y * delta

		collision_shape2d.scale.x += collision_shape2d.scale.x * delta
		collision_shape2d.scale.y += collision_shape2d.scale.y * delta

		physics_collision_shape.scale.x += physics_collision_shape.scale.x * delta
		physics_collision_shape.scale.y += physics_collision_shape.scale.y * delta

	# Right click to scale the object down
	if Input.is_action_pressed("RightClick") && mouse_in_object:
		if sprite_2d.scale.x >= 0.2:
			scale_object_down = true
		else:
			scale_object_down = false

		if !$AudioStreamPlayer.playing:
			$AudioStreamPlayer.playing = true

	if Input.is_action_just_released("RightClick"):
		scale_object_down = false

		if $AudioStreamPlayer.playing:
			$AudioStreamPlayer.playing = false

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
	
func _on_area_2d_mouse_exited():
	mouse_in_object = false
