extends Node2D


var core_0 = preload("res://scenes/objects/core_0.tscn")
var arm_0 = preload("res://scenes/objects/arm_0.tscn")
var antenna_0 = preload("res://scenes/objects/antenna_0.tscn")
var thruster_0 = preload("res://scenes/objects/thruster_0.tscn")
var satelite = preload("res://scenes/objects/satelite.tscn")


var max_scale : Vector2 = Vector2(0.5, 0.55)
var min_scale : Vector2 = Vector2(0.4, 0.35)

var object_name

signal damaged()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RayCast2D.is_colliding():
	
		#This gets the scale of the sprite connected to the object
		var object_scale: Vector2
		if $RayCast2D.get_collider() != null:
			object_scale = $RayCast2D.get_collider().get_child(0).scale
			if object_scale < max_scale && object_scale > min_scale:
				$RayCast2D.get_collider().queue_free()
				$Good_job.play()
			else:
				$RayCast2D.get_collider().queue_free()
				$Bad_job.play()
				#Appends the part list array to include the bad part
				translate_name_to_part()
				get_parent().can_appand = true
				get_parent().append_array()
				get_parent().can_appand = false
				#Reduces the machines durability
				damaged.emit()
		
		print(object_scale)
		print(object_name)
		

func translate_name_to_part():
	var og_name : String = $RayCast2D.get_collider().name
	og_name.erase(0, 1)
	if og_name == "core_0":
		get_parent().part_list = 0
	elif og_name == "arm_0":
		get_parent().part_list = 1
	elif og_name == "antenna_0":
		get_parent().part_list = 2
	elif og_name == "thruster_0":
		get_parent().part_list = 3
	elif og_name == "satelite":
		get_parent().part_list = 4
