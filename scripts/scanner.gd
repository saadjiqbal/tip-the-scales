extends Node2D


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
		print(object_scale)
		print(object_name)
		
