extends Control


var food_cout = 0
onready var food_count_label = $MarginContainer/HBoxContainer/FoodCount

func _ready():
	pass

func set_food_count(value: int) -> void:
	self.food_cout = value
	food_count_label.text = str(self.food_cout)
