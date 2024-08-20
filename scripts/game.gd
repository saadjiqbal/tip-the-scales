extends Node2D


var can_appand : bool
var part_list : int
#core_0 = 0
#arm_0 = 1
#antenna_0 = 2
#thruster_0 = 3
#satelite = 4


# VARIABLES
var core_0 = preload("res://scenes/objects/core_0.tscn")
var arm_0 = preload("res://scenes/objects/arm_0.tscn")
var antenna_0 = preload("res://scenes/objects/antenna_0.tscn")
var thruster_0 = preload("res://scenes/objects/thruster_0.tscn")
var satelite = preload("res://scenes/objects/satelite.tscn")

var robot_01_parts = [core_0, arm_0, satelite, antenna_0, thruster_0]

var needs_parts : bool
var robot_01_level : bool = true

var part_number : int = 0
var randomize_scale : float
var space_avaialable : bool

var times_up : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	robot_01_parts.shuffle()
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
		robot_01_parts.erase(0)
		
	if $RayCast2D.is_colliding() and needs_parts and space_avaialable:
		add_child(robot_01_parts[part_number].instantiate())
		part_number += 1
		space_avaialable = false
	
	if part_number == robot_01_parts.size() - 1:
		get_tree().create_timer(2.0).timeout.connect(object_fall_time)
		if !$RayCast2D2.is_colliding() && times_up == true && space_avaialable:
			add_child(robot_01_parts[part_number].instantiate())
			part_number += 1
			times_up = false
			space_avaialable = false
	
	if $RayCast2D.is_colliding() == false:
		space_avaialable = true

func object_fall_time():
	times_up = true
	space_avaialable = true
	

func timer_timeout():
	pass

func check_part_number() -> void:
	if part_number >= robot_01_parts.size():
		needs_parts = false

func append_array():
	if can_appand:
		if part_list == 0:
			robot_01_parts.append(core_0)
		elif part_list == 1:
			robot_01_parts.append(arm_0)
		elif part_list == 2:
			robot_01_parts.append(antenna_0)
		elif part_list == 3:
			robot_01_parts.append(thruster_0)
		elif part_list == 4:
			robot_01_parts.append(satelite)
		print(robot_01_parts)
