extends CharacterBody2D

@export var segment: CharacterBody2D
@export var speed: float
@export var menu: PackedScene

var bonus_speed: float = 0.0

signal more

func _ready() -> void:
	menu = get_parent().menu

func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	bonus_speed = move_toward(bonus_speed, 0.0, 400.0 * _delta)
	velocity = -transform.y * (speed + bonus_speed)
	move_and_slide()

	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		var collider := collision.get_collider()

		if collider is CharacterBody2D:
			print("Collided with another CharacterBody2D: ", collider.name)
			get_tree().change_scene_to_file("res://Scenes/menu.tscn")
			return
		elif collider is StaticBody2D:
			print("Collided with a wall")
			var normal := collision.get_normal()
			velocity = velocity.bounce(normal)
			rotation = velocity.angle() + PI / 2
			# Add a 15°–35° random tilt left or right so it never bounces at 90°
			var tilt = randf_range(15.0, 35.0) * (1.0 if randf() > 0.5 else -1.0)
			rotation_degrees += tilt
			position += normal * 25.0
			bonus_speed = 250.0

	var wanted_rotation = Input.get_axis("turn_left", "turn_right")
	rotation_degrees += wanted_rotation * 2.6

func copy() -> void:
	more.emit()
