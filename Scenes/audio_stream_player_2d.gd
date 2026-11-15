
extends Node

var music_player: AudioStreamPlayer

func _ready() -> void:
	music_player = AudioStreamPlayer.new()
	add_child(music_player)

	music_player.stream = load("res://Game-song.mp3")
	music_player.bus = "Master"
	music_player.volume_db = 0

	music_player.play()

	await get_tree().create_timer(3.0).timeout

	print("Playing: ", music_player.playing)
	print("Position: ", music_player.get_playback_position())
	print("Master muted: ", AudioServer.is_bus_mute(0))
	print("Master volume: ", AudioServer.get_bus_volume_linear(0))
	print("Master bus index: ", AudioServer.get_bus_index("Master"))
