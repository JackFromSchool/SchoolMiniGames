extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_save_1_button_pressed():
	get_parent().get_node("save_system").load_game(1)


func _on_save_2_button_pressed():
	get_parent().get_node("save_system").load_game(2)


func _on_save_3_button_pressed():
	get_parent().get_node("save_system").load_game(3)


func _on_save_4_button_pressed():
	get_parent().get_node("save_system").load_game(4)


func _on_save_5_button_pressed():
	get_parent().get_node("save_system").load_game(5)


func _on_save_6_button_pressed():
	get_parent().get_node("save_system").load_game(6)
