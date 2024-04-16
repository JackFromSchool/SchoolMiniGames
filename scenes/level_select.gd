extends Control



func _on_ToCalculus_pressed():
	while $Path2D/William.progress_ratio < 1 :
		$Path2D/William.progress_ratio += .001


func _on_ToStudent_pressed():
	pass # Replace with function body.


func _on_ToCompsci_pressed():
	pass # Replace with function body.


func _on_ToMusic_pressed():
	pass # Replace with function body.
