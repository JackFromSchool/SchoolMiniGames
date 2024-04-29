extends Minigame

func _ready():
	get_node("Area2D").set_monitoring(true)
	start(1.0)
	
func start(speed_modifier: float):
	var game_time = 5
	get_node("PencilTimer").start(game_time)
	


