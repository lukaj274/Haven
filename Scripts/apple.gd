extends Area2D

@export var player: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		#player.add()
		var screen_size = get_viewport_rect().size
		position = Vector2(
			randf_range(50, screen_size.x - 50),
			randf_range(50, screen_size.y - 50)
		)
