extends Node2D

## The food scene resouce
onready var food_scene: Resource = preload("res://scenes/Food.tscn")
## The ui reference
onready var ui: Control = $UI
## The vehicle reference
onready var vehicle: KinematicBody2D = $Vehicle

## The food counter
var food_count: int = 0
## The bounds to spawn a new food
var food_bounds: Vector2 = Vector2(0, 0)
## The food instance reference for the food spawned
var food_instance: Area2D = null

## @function _ready 
# 
# This function is called when the food enters the scene. Here we setup the bounds for spawn the food
# and sets the vehicle speed.
func _ready():
	food_bounds = get_viewport_rect().size
	vehicle.set_speed(90)

## @function _physics_process
#
# This function is called for each physics process in the engine
# @param delta The time elapsed between two engine frames 
func _physics_process(delta):
	state_machine()

## @function _on_food_eat
#
# This function is a callback for setting the variables when the food is eat.
func _on_food_eat():
	remove_child(food_instance)
	food_instance.queue_free()
	food_instance = null
	
	food_count += 1
	ui.set_food_count(food_count)

## @function spawn_food
# 
# This function spawns a food in a random position in the ambient 
func spawn_food() -> void:
	randomize()
	var food_sprite_size = 64 ## The current sprite size of the food
	
	var pos_x: float = rand_range(food_sprite_size, food_bounds.x - food_sprite_size)
	var pos_y: float = rand_range(food_sprite_size, food_bounds.y - food_sprite_size)
	
	food_instance = food_scene.instance() ## spawns the food
	add_child(food_instance) ## adds to the scene
	
	if food_instance.connect("beeing_eat", self, "_on_food_eat") != OK:
		printerr("Couldn't connect food beeing_eat signal to function _on_food_eat in Main script")
		
	food_instance.global_position = Vector2(pos_x, pos_y)

## @function seek_food
# 
# This function sets the current food position for the vehicle
func seek_food() -> void: 
	if food_instance == null:
		return
		
	vehicle.set_food_position(food_instance.global_position)

## @function state_machine 
# 
# This function sets the state machine for the ambient. The food is spawned if
# isn't exists, then the vehicle tries to eat it.
func state_machine() -> void:
	### SPAWN NEED FOOD FOR VEHICLE
	if food_instance == null:
		spawn_food()
	else:
		seek_food()
	
