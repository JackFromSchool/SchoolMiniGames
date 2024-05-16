extends Control

signal willie_start
signal watson_and_garcia_start
signal marquart_start
signal misc_characters_start

func _on_to_calculus_pressed():
	willie_start.emit()

func _on_to_student_pressed():
	misc_characters_start.emit()

func _on_to_comp_sci_pressed():
	watson_and_garcia_start.emit()

func _on_to_music_pressed():
	marquart_start.emit()
