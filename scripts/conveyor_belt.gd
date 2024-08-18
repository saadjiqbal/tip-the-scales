extends AnimatedSprite2D

@onready var belt_collision: StaticBody2D = $BeltCollision
@onready var anim_player: AnimationPlayer = null

var rolling: bool = true
var speed: int = 300

func _physics_process(delta: float) -> void:
	detect_object(delta)

func detect_object(delta):
	if $ObjectDetector.is_colliding():
		self.stop()
		rolling = false
	else:
		self.play("roll")
		rolling = true
		belt_collision.position.x += (speed * delta)
	
	#Resets the belt colosion box back to its original position
	if belt_collision.position.x >= 1193.0:
		belt_collision.position.x = 0.0
