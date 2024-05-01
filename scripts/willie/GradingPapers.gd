extends Minigame

var papers_graded: int = 0
var current_paper: int = 2

func _ready():
	start(10.0)

func start(speed_modifier: float):
	$PencilTimer.start(speed_modifier)
	var images: Array[CompressedTexture2D] = []
	var pf: Array[String] = []
	
	for i in range(3):
		if randi_range(0, 1) == 0:
			var path = "res://assets/sprites/willie/papers/failing/fail_"+str(randi_range(0, 10))+".png"
			images.push_front(load(path))
			pf.push_front("fail")
		else:
			var path = "res://assets/sprites/willie/papers/passing/pass_"+str(randi_range(0, 10))+".png"
			images.push_front(load(path))
			pf.push_front("pass")
	
	var i: int = 0
	for image: CompressedTexture2D in images:
		var sprite = Sprite2D.new()
		sprite.texture = image
		sprite.set_meta("type", pf.pop_front())
		sprite.name = str(i)
		sprite.transform = $PaperSpawn.transform
		add_child(sprite)
		i += 1

func _process(delta):
	if current_paper == -1:
		gameover.emit(true)
	# Fail Side
	if Input.is_action_just_pressed("left"):
		var paper = get_node(str(current_paper))
		if paper.get_meta("type") == "pass":
			wrong_grade()
		current_paper -= 1
		paper.position = $FailSpot.position
		paper.rotation = randf_range(-PI/6, PI/6)
		paper.z_index = 10 - current_paper
	
	# Pass Side
	if Input.is_action_just_pressed("right"):
		var paper = get_node(str(current_paper))
		if paper.get_meta("type") == "fail":
			wrong_grade()
		current_paper -= 1
		paper.position = $PassSpot.position
		paper.rotation = randf_range(-PI/6, PI/6)
		paper.z_index = 10 - current_paper

func wrong_grade():
	$Lose.visible = true
	var timer = Timer.new()
	timer.wait_time = 1
	timer.start()
	await timer.timeout
	gameover.emit(false)
	

func _on_pencil_timer_done():
	gameover.emit(false)
