extends Node2D

@export var score:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_apple_area_entered(area: Area2D) -> void:
	score += 1
	#area.queue_free()
	$Head.copy()
	print(score)
