extends Area2D
signal touch

func _on_rigid_body_2d_body_entered(body):
	touch.emit()
	print("teehee")
	$CollisionShape2D.set_deferred("disabled", true)
	get_node("Sprite2D").speed = 0
