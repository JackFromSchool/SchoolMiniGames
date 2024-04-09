extends Node
class_name Character

@export var Games: Array[PackedScene]

var Encounters = []

var MetCharacter = false

signal gameover(win: bool)

func on_start():
	Encounters.resize(Games.size())
	Encounters.fill(0)
 
func Load(State):
	if not State["Encounters"] == null:
		Encounters = State["Encounters"]

	if not State["MetCharacter"] == null:
		MetCharacter = State["MetCharacter"]
