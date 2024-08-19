extends Node2D

# VARIABLES

var core_0 = preload("res://scenes/objects/core_0.tscn")
var arm_0 = preload("res://scenes/objects/arm_0.tscn")
var antenna_0 = preload("res://scenes/objects/antenna_0.tscn")
var thruster_0 = preload("res://scenes/objects/thruster_0.tscn")

var robot_01_parts = [core_0, arm_0, arm_0, antenna_0, thruster_0]

var needs_parts : bool
var robot_01_level : bool = true

var part_number : int = 0

var space_avaialable : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer.play()
	needs_parts = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	spawn_part()
	check_part_number()

func spawn_part() -> void:
	if robot_01_level and part_number == 0:
		add_child(robot_01_parts[part_number].instantiate())
		part_number += 1
		
	if $RayCast2D.is_colliding() and needs_parts and space_avaialable:
		add_child(robot_01_parts[part_number].instantiate())
		part_number += 1
		space_avaialable = false
	
	if $RayCast2D.is_colliding() == false:
		space_avaialable = true
		
func check_part_number() -> void:
	if part_number >= robot_01_parts.size():
		needs_parts = false
