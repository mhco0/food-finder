extends KinematicBody2D

## A variable to set the vehicle speed
export var speed: int = 0

## A variable for the current position of the food in the ambient
var food_pos: Vector2 = Vector2(0, 0)

func _ready():
	pass

## @function _physics_process
#
# This function is called for each physics process in the engine
# @param delta The time elapsed between two engine frames 
func _physics_process(delta):
	go_eat_food(delta)

## @function set_speed
# 
# This function sets the current speed for the vehicle
# @param value The new speed value
func set_speed(value: int) -> void:
	speed = value

## @function set_food_position
# 
# This function sets the current food position in the ambient
# @param food_position The new food position
func set_food_position(food_position: Vector2) -> void:
	food_pos = food_position

## @function go_eat_food
# 
# This function sets the vehicle position to the current food position in the ambient
# using the current speed times @p delta. The vehicle will look to the food before goes to it.
# @param delta The time elapsed between two engine frames 
func go_eat_food(delta) -> void:
	look_at(food_pos)
	self.global_position = self.global_position.move_toward(food_pos, delta * speed)
	
