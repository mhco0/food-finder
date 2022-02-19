extends KinematicBody2D

export var speed: int = 0
var food_pos = Vector2(0, 0)

func _ready():
	pass

func _physics_process(delta):
	go_eat_food(delta)

func set_speed(value: int) -> void:
	speed = value

func set_food_position(food_position: Vector2) -> void:
	food_pos = food_position

func go_eat_food(delta) -> void:
	look_at(food_pos)
	self.global_position = self.global_position.move_toward(food_pos, delta * speed)
	
