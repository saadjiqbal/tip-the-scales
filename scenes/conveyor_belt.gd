extends AnimatedSprite2D

@onready var belt_collision: StaticBody2D = $BeltCollision
@onready var anim_player: AnimationPlayer = null

var rolling: bool = true
var speed: int = 300

func _physics_process(delta: float) -> void:
	detect_object(delta)
	
	#if rolling:
		## If belt_collision is fully to the right, reset it
		#if belt_collision.position.x >= 1193.0:
			#rolling = false
			#belt_collision.position.x = 0.0
			#self.stop()
		## Else, move objects down conveyor belt by translating belt_collision 
		## to the right while playing "roll" animation
		#else:
			#belt_collision.position.x += (speed * delta)
			#if (not self.is_playing()):
				#self.play("roll")

func detect_object(delta):
	if $ObjectDetector.is_colliding():
		self.stop()
		rolling = false
	else:
		self.play("roll")
		rolling = true
		belt_collision.position.x += (speed * delta)
		
	if belt_collision.position.x >= 1193.0:
		belt_collision.position.x = 0.0
