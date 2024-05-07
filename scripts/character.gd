extends Node

signal done(win: bool)

@export_category("Games")
@export
var games: Array[PackedScene]
@export
var boss: PackedScene

@export_category("Game Flow Modifiers")
@export
var gamesToBoss: int
@export
# Speed added to games after each interval of gamesToSpeedUp
var speedIncrement: float
@export
# Number of games that must be played before a speed increase. Default speed modifier is one.
var gamesToSpeedUp: int


var lives: int
var gamesPlayed: int
var speedIncrementCount: int
var game_i
var boss_i

func start():
	lives = 4
	gamesPlayed = 0
	gamesToSpeedUp = 3
	gamesToBoss = 10
	speedIncrement = 0.5
	speedIncrementCount = 0
	
	var game = games.pick_random()
	game_i = game.instantiate()
	game_i.name = "Current"
	game_i.gameover.connect(_on_gameover)
	add_child(game_i)
	game_i.start(1.0/(1+speedIncrement*(gamesPlayed%gamesToSpeedUp)))

func _on_gameover(win: bool):
	game_i.queue_free()

	gamesPlayed += 1
	
	if not win:
		lives -= 1
	
	if lives > 0:
		if gamesPlayed == gamesToBoss:
			boss_i = boss.instantiate()
			boss_i.gameover.connect(_on_boss_gameover)
			add_child(boss_i)
			boss_i.start(1.0)
			return
		
		var game = games.pick_random()
		game_i = game.instantiate()
		game_i.name = "Current"
		game_i.gameover.connect(_on_gameover)
		add_child(game_i)
		
		if gamesPlayed % gamesToSpeedUp == 0:
			speedIncrementCount += 1
	
		game_i.start(1.0/(1+speedIncrement*(speedIncrementCount)))
	else:
		done.emit(false)

func _on_boss_gameover(win: bool):
	boss_i.queue_free()
	
	done.emit(win)
