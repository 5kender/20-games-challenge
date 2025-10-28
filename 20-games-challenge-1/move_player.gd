extends StaticBody2D

@export var _speed = 50
@export var _action_up: InputEventAction
@export var _action_down: InputEventAction
@export var _flip_y = false

var _sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_sprite = get_node("Sprite2D")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dir =  int(Input.is_action_pressed(_action_down.action)) - int(Input.is_action_pressed(_action_up.action))
	var move = dir * _speed * delta
	
	if dir > 0:
		_sprite.rotation_degrees = 90.0 if _flip_y else -90.0
	elif dir < 0:
		_sprite.rotation_degrees = -90.0 if _flip_y else 90.0
	
	move_and_collide(Vector2(0, move))
