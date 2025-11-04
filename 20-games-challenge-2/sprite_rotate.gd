extends Sprite2D

@export var speed_rotate = -20

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(speed_rotate * delta)
