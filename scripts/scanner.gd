extends Node2D


var max_scale : Vector2 = Vector2(0.5, 0.55)
var min_scale : Vector2 = Vector2(0.4, 0.35)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RayCast2D.is_colliding():
		#This gets the parent name of the object
		var object_name = $RayCast2D.get_collider().name
		#This gets the scale of the sprite connected to the object
		var object_scale = $RayCast2D.get_collider().get_child(0).scale
		if object_scale < max_scale && object_scale > min_scale:
			$RayCast2D.get_collider().queue_free()
			$Good_job.play()
		else:
			$RayCast2D.get_collider().queue_free()
			$Bad_job.play()
		print(object_scale)
		print(object_name)
		
