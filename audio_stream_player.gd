extends Node2D

@export var score: int
@export var menu: PackedScene

func _ready() -> void:
	score = 0

func _process(_delta: float) -> void:
	pass

func add() -> void:
	score += 1
	$AudioStreamPlayer.stream = preload("res://Assets/nomNOM.wav")
	$AudioStreamPlayer.play()
	$Head.copy()
	print(score)
