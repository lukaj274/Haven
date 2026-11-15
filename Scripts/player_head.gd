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
	var incoming_velocity := -transform.y * (speed + bonus_speed)
	velocity = incoming_velocity
	move_and_slide()

	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		var collider := collision.get_collider()

		if collider is CharacterBody2D:
			print("Collided with another CharacterBody2D: ", collider.name)
			get_tree().change_scene_to_file("res://Scenes/menu.tscn")
			return
		elif collider is TileMapLayer:
			print("Collided with a wall")
			var normal := collision.get_normal()
			var bounce_dir := incoming_velocity.bounce(normal).normalized()
			var tilt_rad := deg_to_rad(randf_range(15.0, 35.0)) * (1.0 if randf() > 0.5 else -1.0)
			var final_dir := bounce_dir.rotated(tilt_rad)
			# If the tilt pointed back into the wall, flip the tilt the other way
			if final_dir.dot(normal) < 0.25:
				final_dir = bounce_dir.rotated(-tilt_rad)
			if final_dir.dot(normal) < 0.25:
				final_dir = normal.rotated(tilt_rad)
			rotation = final_dir.angle() + PI / 2
			position += normal * 25.0
			bonus_speed = 250.0
			break

	var wanted_rotation = Input.get_axis("turn_left", "turn_right")
	rotation_degrees += wanted_rotation * 2.6

func copy() -> void:
	more.emit()
