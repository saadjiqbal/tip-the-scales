extends Sprite2D

var colliding : bool
var object_position : Vector2

var ray1_colliding : bool
var ray2_colliding : bool
var ray3_colliding : bool
var ray4_colliding : bool
var ray5_colliding : bool

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_object_posistion()
	check_collisions()
	
	if Input.is_action_just_pressed("ui_accept") and colliding:
		if ray1_colliding:
			ray1_colliding = false
		elif ray2_colliding:
			$RayCast2D2.get_collider().position = Vector2(1650, -50)
		elif ray3_colliding:
			$RayCast2D3.get_collider().position = Vector2(1650, -50)
		elif ray4_colliding:
			$RayCast2D4.get_collider().position = Vector2(1650, -50)
		elif ray5_colliding:
			$RayCast2D5.get_collider().position = Vector2(1650, -50)
			
			
		$AudioStreamPlayer.play()

func check_collisions():
	if $RayCast2D.is_colliding():
		ray1_colliding = true
		ray2_colliding = false
		ray3_colliding = false
		ray4_colliding = false
		ray5_colliding = false
		colliding = true
	elif !$RayCast2D.is_colliding() && $RayCast2D2.is_colliding():
		ray1_colliding = false
		ray2_colliding = true
		ray3_colliding = false
		ray4_colliding = false
		ray5_colliding = false
		colliding = true
	elif !$RayCast2D2.is_colliding() && $RayCast2D3.is_colliding():
		ray1_colliding = false
		ray2_colliding = false
		ray3_colliding = true
		ray4_colliding = false
		ray5_colliding = false
		colliding = true
	elif !$RayCast2D3.is_colliding() && $RayCast2D4.is_colliding():
		ray1_colliding = false
		ray2_colliding = false
		ray3_colliding = false
		ray4_colliding = true
		ray5_colliding = false
		colliding = true
	elif !$RayCast2D4.is_colliding() && $RayCast2D5.is_colliding():
		ray1_colliding = false
		ray2_colliding = false
		ray3_colliding = false
		ray4_colliding = false
		ray5_colliding = true
		colliding = true
	else:
		ray1_colliding = false
		ray2_colliding = false
		ray3_colliding = false
		ray4_colliding = false
		ray5_colliding = false
		colliding = false



	#if ray1_colliding == true:
		#object_position = $RayCast2D.get_collider().position
	#elif ray2_colliding == true:
		#object_position = $RayCast2D2.get_collider().position
	#elif ray3_colliding == true:
		#object_position = $RayCast2D3.get_collider().position
	#elif ray4_colliding == true:
		#object_position = $RayCast2D4.get_collider().position
	#elif ray5_colliding == true:
		#object_position = $RayCast2D5.get_collider().position
	#else:
		#object_position = Vector2(0, 0)
	#
	#if !ray1_colliding && !ray2_colliding && !ray3_colliding && !ray4_colliding && !ray5_colliding:
		#object_position = Vector2(0, 0)



func get_object_posistion():
	pass
	#if ray1_colliding == true:
		#object_position = $RayCast2D.get_collider().position
	#elif ray2_colliding == true:
		#object_position = $RayCast2D2.get_collider().position
	#elif ray3_colliding == true:
		#object_position = $RayCast2D3.get_collider().position
	#elif ray4_colliding == true:
		#object_position = $RayCast2D4.get_collider().position
	#elif ray5_colliding == true:
		#object_position = $RayCast2D5.get_collider().position
		#
	#if !ray1_colliding && !ray2_colliding && !ray3_colliding && !ray4_colliding && !ray5_colliding:
		#object_position = Vector2(0, 0)
