extends CharacterBody2D


@export var jump_velocity = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("up"):
		velocity.y = jump_velocity
	
	velocity.x = 0

	move_and_slide()
