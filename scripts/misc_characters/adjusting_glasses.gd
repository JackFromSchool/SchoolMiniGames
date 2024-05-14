extends Minigame

func _ready():
	get_node("Area2D").set_monitoring(true)
	start(1.0)
	
func start(speed_modifier: float):
	var game_time = 4
	get_node("PencilTimer").start(game_time * speed_modifier)
	get_node("PencilTimer").done.connect(_on_done)
	
func _on_done():
	gameover.emit(false)
	
func overgame():
	gameover.emit(true)
