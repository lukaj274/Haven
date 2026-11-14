extends CharacterBody2D

@export var next_segment: CharacterBody2D
@export var last_segment: CharacterBody2D
@export var last:bool

var follow_speed: float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	last = true
	$AnimatedSprite2D.hide()
	$CollisionShape2D.disabled = false
	set_meta("Active", false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if last_segment:
		global_position = global_position.lerp(last_segment.global_position, follow_speed * delta)


func _on_more_request() -> void:
	# Activate if disabled
	if !(get_meta("Active")):
		$AnimatedSprite2D.show()
		$CollisionShape2D.disabled = true
		set_meta("Active", true)
	# Duplicate
	else:
		next_segment = duplicate()
		next_segment.last_segment = $"."
		last = false
		
