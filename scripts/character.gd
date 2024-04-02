extends Node
class_name Character

@export
var Games: Array[PackedScene]
var Encounters = [0, 0, 0]
var MetCharacter = false

signal gameover(win: bool)

func on_start():
	pass

func Load(State):
	if not State["Encounters"] == null:
		Encounters = State["Encounters"]

	if not State["MetCharacter"] == null:
		MetCharacter = State["MetCharacter"]
