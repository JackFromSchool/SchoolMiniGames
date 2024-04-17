extends Node

# Scene preloads
var main_menu = preload("res://scenes/main_menu.tscn")
var load_selct = preload("res://scenes/load_select.tscn")
var intro = preload("res://scenes/intro.tscn")
var level_select = preload("res://scenes/level_select.tscn")

func _ready():
	# Menu is always first
	var main_menu_i = main_menu.instantiate()
	main_menu_i.name = "MainMenu"
	main_menu_i.move_to_load_select.connect(_on_move_to_load_select)
	add_child(main_menu_i)

func _process(delta):
	pass

func _on_move_to_load_select():
	get_node("MainMenu").queue_free()
	
	var load_select_i = load_selct.instantiate()
	load_select_i.name = "LoadSelect"
	load_select_i.save_loaded.connect(_on_save_loaded)
	add_child(load_select_i)
	

func _on_save_loaded():
	get_node("LoadSelect").queue_free()
	
	var level_select_i = level_select.instantiate()
	level_select_i.name = "LevelSelect"
	level_select_i.marquart_start.connect(_on_marquart_start)
	level_select_i.watson_and_garcia_start.connect(_on_watson_and_garcia_start)
	level_select_i.misc_characters_start.connect(_on_misc_characters_start)
	level_select_i.willie_start.connect(_on_willie_start)
	add_child(level_select_i)

func _on_intro_over():
	get_node("Intro").queue_free()
	
	var level_select_i = level_select.instantiate()
	level_select_i.name = "LevelSelect"
	level_select_i.marquart_start.connect(_on_marquart_start)
	level_select_i.watson_and_garcia_start.connect(_on_watson_and_garcia_start)
	level_select_i.misc_characters_start.connect(_on_misc_characters_start)
	level_select_i.willie_start.connect(_on_willie_start)
	add_child(level_select_i)

func _on_new_game():
	get_node("Menu").queue_free()
	
	var intro_i = intro.instantiate()
	intro_i.name = "Intro"
	intro_i.intro_over.connect(_on_intro_over)
	add_child(intro_i)

func _on_marquart_start():
	get_node("LevelSelect").queue_free()
	$Marquart/Character.start()

func _on_watson_and_garcia_start():
	get_node("LevelSelect").queue_free()
	$WatsonAndGarcia/Character.start()

func _on_misc_characters_start():
	get_node("LevelSelect").queue_free()
	$MiscCharacters/Character.start()

func _on_willie_start():
	get_node("LevelSelect").queue_free()
	$Willie/Character.start()
