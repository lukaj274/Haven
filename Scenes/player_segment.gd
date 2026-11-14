extends CharacterBody2D

var next_segment: CharacterBody2D
@export var last:bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	last = true
	$AnimatedSprite2D.hide()
	$CollisionShape2D.disabled = false
	set_meta("Active", false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_more_request() -> void:
	# Activate if disabled
	if !(get_meta("Active")):
		$AnimatedSprite2D.show()
		$CollisionShape2D.disabled = true
		set_meta("Active", true)
	# Duplicate
	else:
		next_segment = duplicate()
		last = false
		
