extends Area2D

signal beeing_eat

func _ready():
	if connect("body_entered", self, "_on_body_entered") != OK:
		printerr("Couldn't connect body_entered signal for Food instance")

func _on_body_entered(body: Node):
	emit_signal("beeing_eat")
