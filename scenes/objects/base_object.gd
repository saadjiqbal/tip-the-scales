extends StaticBody2D

# Access to the object_dictionary.gd resource to get data on the object
# Used so that we don't need to create a new script for each object
@export var object_dict: Resource

var object_name: String = ""
var object_text: String = ""

func _ready() -> void:
	# On ready, set object_name and object_text based on the name of the\
	# inherited scene
	
	# Using [self.name]["name"] seems repetitive and not quite necessary,
	# but it felt right to have "name" as one of the values in the object's
	# entry
	object_name = object_dict[self.name]["name"]
	object_text = object_dict[self.name]["description"]
