extends Control

## A Reference for the food label
onready var food_count_label: Label = $MarginContainer/HBoxContainer/FoodCount

func _ready():
	pass

## @function set_food_count
#
# This function sets the label text with some @p value
# 
# @param value The value for the counter
func set_food_count(value: int) -> void:
	food_count_label.text = str(value)
