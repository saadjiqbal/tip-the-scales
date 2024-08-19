extends Node2D


var core_0 = preload("res://scenes/objects/core_0.tscn")
var arm_0 = preload("res://scenes/objects/arm_0.tscn")
var antenna_0 = preload("res://scenes/objects/antenna_0.tscn")
var thruster_0 = preload("res://scenes/objects/thruster_0.tscn")

var needs_parts : bool

var robot_01_level : bool = true

var robot_01_parts : Array = [core_0, arm_0, arm_0, antenna_0, thruster_0]
var part_number : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	needs_parts = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var get_part = robot_01_parts [part_number]
	
	if robot_01_level == true && part_number == 0:
		get_part.instantiate()
		print(get_part)
		part_number += 1


	if $RayCast2D.is_colliding() and needs_parts:
		get_part.instantiate()
		part_number += 1
		
	if part_number > robot_01_parts.size():
		needs_parts = false
