extends Area2D

## @signal beeing_eat
#
# This signal is fired when some body enters the food area
signal beeing_eat

## @function _ready 
# 
# This function is called when the food enters the scene. Here we setup the signals for the food
func _ready():
	if connect("body_entered", self, "_on_body_entered") != OK:
		printerr("Couldn't connect body_entered signal for Food instance")

## @function _on_body_entered
# 
# This function is a callback for when a body enters the food area
#
# @param body The body that enters the area for the food
func _on_body_entered(body):
	call_deferred("emit_signal", "beeing_eat")
