extends Node
const FileFormat = "res://saves/game-data{Number}.json"

var PlayerName = "Player"

var CharacterDict = [];

@export var CharacterList = [
	"CharTestNode",
]

func _ready():
	pass
	
func CreateSaveData(FileNumber):
	
	var SaveGame = FileAccess.open(FileFormat.format({"Number" : FileNumber}), FileAccess.WRITE)
	var save_dict = {}
	
	save_dict["Name"] = PlayerName
	
	for CharName in CharacterList:
		var CharDict = {
			"MetCharacter" : !get_parent().get_node(CharName).MetCharacter,
			"Encounters" : get_parent().get_node(CharName).Encounters
		}
		save_dict[CharName] = CharDict
	
	var JsonString = JSON.stringify(save_dict)
	SaveGame.store_line(JsonString)
	
	return

func LoadGame(FileNumber):
	
	var FileLocation = FileFormat.format({"Number" : FileNumber})
	
	if not FileAccess.file_exists(FileLocation):
		return false # Error! No save file found here.
	
	var SaveState = FileAccess.open(FileLocation, FileAccess.READ)
	var JsonObject = JSON.new()
	JsonObject.parse(SaveState.get_as_text())
	return LoadValues(JsonObject.get_data())
	
func LoadValues(GameState):
	if not GameState["Name"] == null:
		PlayerName = GameState["Name"]
		
	for CharName in CharacterList:
		if not get_parent().get_node(CharName) == null:
			get_parent().get_node(CharName).Load(GameState[CharName])

	return true
