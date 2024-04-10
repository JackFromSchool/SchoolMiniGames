extends Node

# Scene preloads
var menu = preload("res://scenes/menu.tscn")
var intro = preload("res://scenes/intro.tscn")
var level_select = preload("res://scenes/level_select.tscn")

func _ready():
	# Menu is always first
	var menu_i = menu.instantiate()
	menu_i.name = "Menu"
	add_child(menu_i)

func _process(delta):
	pass
	
func _on_save_loaded():
	get_node("Menu").queue_free()
	
	var level_select_i = level_select.instantiate()
	level_select_i.name = "LevelSelect"
	add_child(level_select_i)

func _on_intro_over():
	get_node("Intro").queue_free()
	
	var level_select_i = level_select.instantiate()
	level_select_i.name = "LevelSelect"
	add_child(level_select_i)

func _on_new_game():
	get_node("Menu").queue_free()
	
	var intro_i = intro.instantiate()
	intro_i.name = "Intro"
	intro_i.intro_over.connect(_on_intro_over())
	add_child(intro_i)

