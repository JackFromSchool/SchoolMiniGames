extends Control

signal save_created

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_save(save_num: int):
	if not get_parent().get_node("SaveSystem").new_save(save_num):
		pass
	else:
		save_created.emit()

func _on_save_1_button_pressed():
	load_save(1)

func _on_save_2_button_pressed():
	load_save(2)

func _on_save_3_button_pressed():
	load_save(3)

func _on_save_4_button_pressed():
	load_save(4)

func _on_save_5_button_pressed():
	load_save(5)

func _on_save_6_button_pressed():
	load_save(6)
	

