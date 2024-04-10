extends Node2D

signal intro_over

func _on_dialogue_controller_finished():
	intro_over.emit()
	queue_free()
