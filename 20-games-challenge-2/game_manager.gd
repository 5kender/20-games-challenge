extends Node

var score = 0
var highscore = 0

var score_node
var highscore_node
var player_node: CharacterBody2D
var cd_launcher_node

var player_init_pos


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_node = %Score
	highscore_node = %Highscore
	player_node = %Player
	player_init_pos = player_node.position
	cd_launcher_node = %CdLauncher
	
func _process(delta: float) -> void:
	if player_node.position.x < -30:
		_reset()

	
func _on_timer_timeout() -> void:
	score += 1
	if score > highscore:
		highscore = score
	_update_texts()

func _update_texts() -> void:
	score_node.text = str(score)
	highscore_node.text = str(highscore)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("reset"):
		_reset()

func _reset() -> void:
	score = 0
	_update_texts()
	
	player_node.position = player_init_pos
	player_node.velocity = Vector2.ZERO
	
	cd_launcher_node.rate = 0.05
	cd_launcher_node.multi = 1
	
	for child in cd_launcher_node.get_children():
		child.queue_free()
