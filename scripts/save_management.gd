extends Node
const file_format = "res://saves/game_data_{Number}.json"

var player_name = "Player"

var character_dict = [];

@export var character_list = []

func _ready():
	pass
	
func check_file(file_number: int):
	var file_location = file_format.format({"Number" : file_number})
	
	if FileAccess.file_exists(file_location):
		return true

	return false

func save_game(file_number: int):
	
	var save_game = FileAccess.open(file_format.format({"Number" : file_number}), FileAccess.WRITE)
	var save_dict = {}
	
	save_dict["Name"] = player_name
	
	for char_name in character_list:
		var char_dict = {
			"MetCharacter" : !get_parent().get_node(char_name).MetCharacter,
			"Encounters" : get_parent().get_node(char_name).Encounters
		}
		save_dict[char_name] = char_dict
	
	var JsonString = JSON.stringify(save_dict)
	save_game.store_line(JsonString)
	
	return

func load_game(file_number: int):
	
	var file_location = file_format.format({"Number" : file_number})
	
	if not FileAccess.file_exists(file_location):
		return false # Error! No save file found here.
	
	var SaveState = FileAccess.open(file_location, FileAccess.READ)
	var JsonObject = JSON.new()
	JsonObject.parse(SaveState.get_as_text())
	return load_values(JsonObject.get_data())
	
func load_values(game_state):
	if not game_state["Name"] == null:
		player_name = game_state["Name"]
		
	for char_name in character_list:
		if not get_parent().get_node(char_name) == null:
			get_parent().get_node(char_name).load_state(game_state[char_name])

	return true
