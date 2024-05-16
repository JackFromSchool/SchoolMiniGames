extends Minigame

@onready var v = $Valve

@onready var v2 = $Valve2

@onready var v3 = $Valve3

var game_time = 7
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("PencilTimer").done.connect(_on_done)
	get_node("PencilTimer").start(game_time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process (delta):
	if v.done == true && v2.done == true && v3.done == true:
		gameover.emit(true)

func _on_done():
	gameover.emit(false)
