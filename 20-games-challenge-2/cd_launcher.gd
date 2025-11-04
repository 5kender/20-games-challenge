extends Node2D

var x = 1200
var rate = 0.05
var multi = 1
var multi_incr = 0.0000005
var max_rate = 0.15

const cd = preload("res://cd.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if rate < max_rate:
		rate *= multi
	if randf() < rate:
		if rate < max_rate:
			multi += multi_incr
		_instantiate_cd()

func _instantiate_cd() -> void:
	var random_y = randf_range(0, 648)
	var cd_node: StaticBody2D = cd.instantiate()
	cd_node.position = Vector2(x, random_y)
	add_child(cd_node)
