extends Node2D

signal done

func _on_dialogue_controller_finished():
	done.emit()
	queue_free()
