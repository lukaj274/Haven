extends Node

func _ready():
	# Create a new AudioStreamPlayer node
	var music_player = AudioStreamPlayer.new()
	
	# Add it to the current scene so it can run
	add_child(music_player)
	
	# Load your mp3 file (make sure the path matches where you put it)
	music_player.stream = load("res://Game-song.mp3")
	
	# Start playing the music
	music_player.play()
