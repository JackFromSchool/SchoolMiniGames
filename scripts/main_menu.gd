extends Control

signal move_to_load_select

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_text_start_pressed():
	get_parent().get_node("SaveSystem").save_game(0)

func _on_text_load_pressed():
	move_to_load_select.emit()

func _on_text_quit_pressed():
	get_tree().quit()
