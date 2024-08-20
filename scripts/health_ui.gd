extends Control

@onready var lose_screen: PackedScene =\
	preload("res://scenes/lose_screen.tscn")
@onready var health_sprites: Control = $HealthSprites

var health: int = 5

# Free the rightmost health indicator, and load lose_screen.tscn if health == 0
func _on_scanner_damaged() -> void:
	health -= 1
	if health == 0:
		get_tree().change_scene_to_packed(lose_screen)
	else:
		health_sprites.get_child(health).queue_free()
