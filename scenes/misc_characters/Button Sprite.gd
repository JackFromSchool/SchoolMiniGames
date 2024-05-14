extends Minigame

var screen_size # Size of the game window.
@onready var animated_button = $QTEbutton
@onready var animated_chair = $Chair
@onready var press = $Button
@onready var success = $Dodge

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(.5).timeout
	animated_chair.play()
	await get_tree().create_timer(.4).timeout
	animated_button.play()
	await get_tree().create_timer(.4).timeout
	press.show()
	await get_tree().create_timer(.3).timeout
	press.hide()
	
func _on_done():
	gameover.emit(false)
	
func _on_button_button_down():
	animated_button.hide()
	animated_chair.hide()
	press.hide()
	success.show()
	gameover.emit(true)
