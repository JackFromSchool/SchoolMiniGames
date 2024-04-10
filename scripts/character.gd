extends Node
class_name Character

@export var games: Array[PackedScene]

var encounters = []

var met_character = false

signal gameover(win: bool)

func on_start():
	encounters.resize(games.size())
	encounters.fill(0)
 
func load_state(state):
	if not state["Encounters"] == null:
		encounters = state["Encounters"]

	if not state["MetCharacter"] == null:
		met_character = state["MetCharacter"]
