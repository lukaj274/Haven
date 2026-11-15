extends Node

@onready var music_player = AudioStreamPlayer.new()

func _ready() -> void:
	add_child(music_player)
	music_player.stream = load("res://Game-song.mp3")
	music_player.finished.connect(_on_music_finished)
	music_player.play()

func _on_music_finished() -> void:
	music_player.play()
