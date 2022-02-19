extends Node2D

onready var food_scene = preload("res://scenes/Food.tscn")
onready var ui = $UI
onready var vehicle = $Vehicle

var food_count: int = 0
var food_bounds = Vector2(0, 0)
var food_instance: Area2D = null

func _ready():
	food_bounds = get_viewport_rect().size
	vehicle.set_speed(90)

func _physics_process(delta):
	state_machine()

func _on_food_eat():
	remove_child(food_instance)
	food_instance.queue_free()
	food_instance = null
	
	food_count += 1
	ui.set_food_count(food_count)

func spawn_food() -> void:
	randomize()
	var food_sprite_size = 64
	
	var pos_x: float = rand_range(food_sprite_size, food_bounds.x - food_sprite_size)
	var pos_y: float = rand_range(food_sprite_size, food_bounds.y - food_sprite_size)
	
	food_instance = food_scene.instance()
	add_child(food_instance)
	
	if food_instance.connect("beeing_eat", self, "_on_food_eat") != OK:
		printerr("Couldn't connect food beeing_eat signal to function _on_food_eat in Main script")
		
	food_instance.global_position = Vector2(pos_x, pos_y)

func seek_food() -> void: 
	if food_instance == null:
		return
		
	vehicle.set_food_position(food_instance.global_position)

func state_machine() -> void:
	### SPAWN NEED FOOD FOR VEHICLE
	if food_instance == null:
		spawn_food()
	else:
		seek_food()
	
