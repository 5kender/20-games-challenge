extends CharacterBody2D

@export var _speed = 50
var _dir
var _initial_pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_initial_pos = position
	
	_replace_ball()

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())

func _replace_ball() -> void:
	position = _initial_pos
	
	_dir = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized()
	velocity = _dir * _speed

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("reset_ball"):
		_replace_ball()


func _on_area_1_body_entered(body: Node2D) -> void:
	%ScoreP2.text = str(int(%ScoreP2.text) + 1)
	_replace_ball()


func _on_area_2_body_entered(body: Node2D) -> void:
	%ScoreP1.text = str(int(%ScoreP1.text) + 1)
	_replace_ball()
