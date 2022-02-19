extends Node2D

onready var food_scene = preload("res://scenes/Food.tscn")
onready var ui = $UI
onready var vehicle = $Vehicle

var food_bounds = Vector2(0, 0)
var food_on_screen = false

func _ready():
	food_bounds = get_viewport_rect().size

func spawn_food():
	if not food_on_screen:
		randomize()
		
		var pos_x: float = rand_range(0, food_bounds.x)
		var pos_y: float = rand_range(0, food_bounds.y)
		
		var food_instance: Area2D = food_scene.instance()
		add_child(food_instance)
		
		food_instance.global_position = Vector2(pos_x, pos_y)
		
		food_on_screen = true
