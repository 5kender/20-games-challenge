extends CharacterBody2D

var save_direction = Vector2.ZERO

@export var speed = 17000

func _physics_process(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if input_direction != Vector2.ZERO:
		save_direction = input_direction
	velocity = save_direction * speed * delta
	
	move_and_slide()
