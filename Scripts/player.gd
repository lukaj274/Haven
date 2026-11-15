extends Node2D

@export var score: int
@export var menu: PackedScene

signal add_score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func add() -> void:
	$AudioStreamPlayer.stream = preload("res://Assets/nomNOM.wav"); 
	$AudioStreamPlayer.play()
	score += 1
	add_score.emit()
	$Head.copy()
	print(score)
