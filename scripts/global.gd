extends Node

var music = preload("res://Audio/Music/S06_E06_GMTK_2024.mp3")

var health : int
var damage : bool

var win : bool


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = AudioStreamPlayer.new()
	player.stream = music
	player.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
