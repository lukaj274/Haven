extends CharacterBody2D

@export var segment:CharacterBody2D
@export var speed:float
signal more

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	# -transform.y gets the node's local "up" direction, already normalized
	velocity = -transform.y * speed
	move_and_slide()
	
	var wanted_rotation = Input.get_axis("turn_left", "turn_right")
	rotation_degrees += wanted_rotation * 2

func copy() -> void:
	print("hello")
	more.emit()
