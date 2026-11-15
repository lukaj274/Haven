extends CharacterBody2D

@export var segment:CharacterBody2D
@export var speed:float
@export var menu: PackedScene

signal more

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu = get_parent().menu

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	# -transform.y gets the node's local "up" direction, already normalized
	velocity = -transform.y * speed
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		var collider := collision.get_collider()
		
		if collider is CharacterBody2D:
			print("Collided with another CharacterBody2D: ", collider.name)
			# Trigger your custom event or signal here
			get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	
	var wanted_rotation = Input.get_axis("turn_left", "turn_right")
	rotation_degrees += wanted_rotation * 2

func copy() -> void:
	more.emit()
