extends CharacterBody2D

var speed = 200
var max_speed = 350
var grass_speed = 100
var speed_rotation = 4
var dir = 0
var score = 0

var in_road = true

@onready var screen_size: Vector2 = get_viewport_rect().size
@onready var score_text = %Score

var _anim_player: AnimationPlayer

func _ready() -> void:
	_anim_player = $"Sprites/AnimationPlayer"
	

func _physics_process(delta):
	dir = Input.get_axis("left", "right")
	
	var forward_direction = Input.get_axis("up", "down")
	
	if forward_direction != 0:
		velocity += transform.x * forward_direction * speed * delta * 4
		var _max_speed = max_speed
		if not in_road:
			_max_speed = grass_speed
		velocity = velocity.limit_length(_max_speed)
		_anim_player.play("walk")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed * delta * 1.7)
		_anim_player.play("RESET")
		
	rotation += dir * speed_rotation * delta
	move_and_slide()
	
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)

func _on_area_inner_grass_body_entered(body: Node2D) -> void:
	in_road = false

func _on_area_inner_grass_body_exited(body: Node2D) -> void:
	in_road = true

func _on_area_outer_grass_body_entered(body: Node2D) -> void:
	in_road = false

func _on_area_outer_grass_body_exited(body: Node2D) -> void:
	in_road = true

func _on_line_body_entered(body: Node2D) -> void:
	score += 1
	score_text.text = str(score)
