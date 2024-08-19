extends AnimatedSprite2D

@onready var audio_stream_player = $AudioStreamPlayer
@onready var belt_collision: StaticBody2D = $BeltCollision
@onready var object_detector = $ObjectDetector

var part_under_teleporter: bool = false

var speed: int = 300

func _physics_process(delta: float) -> void:
	detect_object(delta)

func detect_object(delta):
	if object_detector.is_colliding():
		part_under_teleporter = true
		self.stop()
		
		if audio_stream_player.playing:
			audio_stream_player.playing = false
			
	if !part_under_teleporter:
		self.play("roll")
		belt_collision.position.x += speed * delta

		if !audio_stream_player.playing:
			audio_stream_player.playing = true
	
	# Resets the belt colosion box back to its original position
	if belt_collision.position.x >= 1193.0:
		belt_collision.position.x = 0.0
