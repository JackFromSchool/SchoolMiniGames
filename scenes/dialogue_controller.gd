extends Node2D

@export
var dialogue_path: String
@export
var player_name: String

class DialogueLine:
	var text: String
	var character_name: String
	var character_expression: String

var characters: Dictionary = {}
var lines: Array[DialogueLine] = []
var current_line = -1
var current_character: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open(dialogue_path, FileAccess.READ)
	
	while not file.eof_reached():
		var line = file.get_line()
		if line.strip_edges(false, true) == "[characters]":
			while true:
				var subline = file.get_line()
				if subline.strip_edges(false, true) == "[end]":
					break
				else:
					characters[subline] = get_node(subline)
		
		if line.strip_edges(false, true) == "[dialogue]":
			while true:
				var subline = file.get_line()
				if subline.strip_edges(false, true) == "[end]":
					break
				else:
					var dialogue: DialogueLine = DialogueLine.new()
					
					for name in characters.keys():
						if subline.contains(name):
							dialogue.character_name = name
					if dialogue.character_name == "":
						dialogue.character_name = "Self"
					
					var expression = subline.substr(subline.find("[")+1, subline.find("]")-subline.find("[")-1)
					if expression != subline:
						dialogue.character_expression = expression
					
					subline = subline.get_slice(":", 1)
					subline = subline.replace("%name%", player_name)
					
					dialogue.text = subline
					
					lines.append(dialogue)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		progress()


func progress():
	current_line += 1
	
	if current_line >= len(lines):
		return false
	
	$TextBox.text = lines[current_line].text
	
	if lines[current_line].character_name != "Self":
		current_character = characters[lines[current_line].character_name]
		$Name.text = lines[current_line].character_name
	else:
		$Name.text = player_name
	
	if lines[current_line].character_expression != "":
		current_character.play(lines[current_line].character_expression)
	
	return true

func start():
	pass
