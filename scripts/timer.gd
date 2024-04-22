extends Node2D

signal done

func start(time: float):
	$Explosion.visible = false
	$PencilSharpener.visible = true
	$Timer.wait_time = time
	$Timer.start()
	
	$PencilSharpener/ShavingParticles.emitting = true

func _process(delta):
	$Box/Pencil.position.y = 450 - (1 - ($Timer.time_left / $Timer.wait_time))*975
	
	if position.y <= -330 && $PencilSharpener/ShavingParticles.emitting:
		$PencilSharpener/ShavingParticles.emitting = false

func _on_timer_timeout():
	done.emit()
	$PencilSharpener.visible = false
	$Explosion.visible = true
	$PencilSharpener/ShavingParticles.emitting = false
