extends Node2D

@export var score: int
@export var menu: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func add() -> void:
	score += 1
	$Head.copy()
	print(score)
