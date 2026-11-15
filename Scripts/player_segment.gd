extends CharacterBody2D

@export var next_segment: CharacterBody2D
@export var last_segment: CharacterBody2D
@export var segment_type: PackedScene
@export var last: bool

var follow_speed: float = 7

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	last = true
	if !(get_meta("Active")):
		$AnimatedSprite2D.hide()
		$CollisionShape2D.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if last_segment:
		global_position = global_position.lerp(last_segment.global_position, follow_speed * delta)
		global_rotation_degrees = last_segment.global_rotation_degrees


func _on_more_request() -> void:
	# Activate if disabled
	if !(get_meta("Active")):
		$AnimatedSprite2D.show()
		$CollisionShape2D.disabled = false
		$AnimatedSprite2D.play("end")
		set_meta("Active", true)
	# Duplicate
	else:
		if next_segment:
			next_segment.call("_on_more_request")
			return

		next_segment = segment_type.instantiate()
		next_segment.last_segment = $"."
		next_segment.segment_type = segment_type
		next_segment.position = Vector2(0, 32)
		last = false
		$AnimatedSprite2D.play("middle")
		get_parent().add_child(next_segment)
