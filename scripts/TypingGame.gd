extends Minigame

@export 
var text = "System.out.println(\"hello world\");"
var uncompleted_text = ""
var completed_text = ""
var curr_pos = 0

func _ready():
	pass

func start(speed_modifier: float):
	var game_time = text.length()*(speed_modifier)*.75
	print("game time:")
	print(game_time)
	get_node("PencilTimer").done.connect(_on_done)
	get_node("PencilTimer").start(game_time)
	
	get_node("GameText").text = "[shake rate=10 level=20][color=RED]" + text
	get_node("TitleInstruction").text = "[shake rate=25 level=25][color=YELLOW]TYPE FAST"
	curr_pos = 0
	uncompleted_text = text

func _process(delta):
	if completed_text == text:
		gameover.emit(true)

func _on_done():
	gameover.emit(false)

func _input(event):
	if (curr_pos < text.length()) && (event is InputEventKey):
		
		if(char(event.unicode).capitalize() == text[curr_pos].capitalize()):
			curr_pos = curr_pos + 1
			$BlipSound.play()
			increment_text()

func increment_text():
	completed_text = completed_text + uncompleted_text.substr(0,1)
	uncompleted_text = uncompleted_text.substr(1)
	
	get_node("GameText").text = "[shake rate=10 level=20][color=GREEN]" + completed_text + "[color=RED]" + uncompleted_text
