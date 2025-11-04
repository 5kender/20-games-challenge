extends StaticBody2D

@export var speed = 600

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var move = -speed * delta
	translate(Vector2(move, 0))
	
	if position.x < -100:
		queue_free()
	
