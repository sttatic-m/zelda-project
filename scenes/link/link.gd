class_name Player extends CharacterBody2D

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var move_speed: float = 100.0
var _input_direction: Vector2

var idle_frame: int = 0

func _process(_delta: float) -> void:
	var horizontal_dir: float = Input.get_axis("move_left", "move_right")
	var vertical_dir: float = Input.get_axis("move_up", "move_down")
	_input_direction = Vector2(horizontal_dir, vertical_dir).normalized()
	
	if vertical_dir > 0.0:
		idle_frame = 0
	elif vertical_dir < 0.0:
		idle_frame = 2
	if horizontal_dir != 0 :
		idle_frame = 1
		if horizontal_dir < 0.0:
			anim_sprite.flip_h = true
		else:
			anim_sprite.flip_h = false

	if _input_direction.length() == 0.0:
		anim_sprite.animation = "idle"
		anim_sprite.frame = idle_frame
		anim_sprite.play()
	else:
		if vertical_dir > 0.0:
			anim_sprite.animation = "walk_down"
		elif vertical_dir < 0.0:
			anim_sprite.animation = "walk_up"
		else:
			anim_sprite.animation = "walk_side"
		anim_sprite.play()
	
func _physics_process(_delta: float) -> void:
	velocity = _input_direction * move_speed
	move_and_slide()
