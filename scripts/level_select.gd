extends Control



func _on_to_calculus_pressed():
	while $Path2D/William.progress_ratio < 1 :
		$Path2D/William.progress_ratio += .001


func _on_to_student_pressed():
	pass # Replace with function body.


func _on_to_comp_sci_pressed():
	pass # Replace with function body.


func _on_to_music_pressed():
	pass # Replace with function body.
