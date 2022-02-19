extends Control

onready var food_count_label = $MarginContainer/HBoxContainer/FoodCount

func _ready():
	pass

func set_food_count(value: int) -> void:
	food_count_label.text = str(value)
