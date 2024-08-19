extends AnimatedSprite2D

@onready var audio_stream_player = $AudioStreamPlayer
@onready var belt_collision: StaticBody2D = $BeltCollision
@onready var object_detector = $ObjectDetector

var part_under_teleporter: bool = false

var speed: int = 250

func _physics_process(delta: float) -> void:
	detect_object(delta)

func detect_object(delta):
	if !part_under_teleporter:
		self.play("roll")
		belt_collision.position.x += speed * delta

		if !audio_stream_player.playing:
			audio_stream_player.playing = true
	
	# Resets the belt colosion box back to its original position
	if belt_collision.position.x >= 1193.0:
		belt_collision.position.x = 0.0


func _on_object_detector_area_entered(area: Area2D) -> void:
	part_under_teleporter = true
	self.stop()
	if audio_stream_player.playing:
		audio_stream_player.playing = false

func _on_object_detector_area_exited(area: Area2D) -> void:
	self.play("roll")
	part_under_teleporter = false
