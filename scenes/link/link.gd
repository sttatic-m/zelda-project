class_name Player extends CharacterBody2D


@export var move_speed: float = 100.0
var _input_direction: Vector2

func _process(_delta: float) -> void:
	var horizontal_dir: float = Input.get_axis("move_left", "move_right")
	var vertical_dir: float = Input.get_axis("move_up", "move_down")
	_input_direction = Vector2(horizontal_dir, vertical_dir).normalized()

func _physics_process(delta: float) -> void:
	velocity = _input_direction * move_speed
	
	move_and_slide()
