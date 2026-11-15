extends Node2D

@export var score_text: Label
var score: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_add_score() -> void:
	score += 1
	score_text.text = str(score)
	
func _on_over():
	Global.last_score = score
	get_tree().change_scene_to_file("res://menu.tscn")
