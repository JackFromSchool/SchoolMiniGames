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

func start():
	lives = 4
	gamesPlayed = 0
	
	var game = games.pick_random()
	var game_i = game.instantiate()
	game_i.name = "Current"
	game_i.gameover.connect(_on_gameover)
	add_child(game_i)

func _on_gameover(win: bool):
	get_node("Current").queue_free()
	
	if not win:
		lives -= 1
		
	gamesPlayed += 1
	if gamesPlayed == gamesToBoss:
		var boss_i = boss.instantiate()
		boss_i.gameover.connect(_on_boss_gameover)
		add_child(boss_i)
		boss_i.start(1.0)
		return
		
	var game = games.pick_random()
	var game_i = game.instantiate()
	game_i.name = "Current"
	game_i.gameover.connect(_on_gameover)
	add_child(game_i)
	game_i.start(1.0 + speedIncrement*(gamesPlayed%gamesToSpeedUp))

func _on_boss_gameover(win: bool):
	get_node("Current").queue_free()
	
	done.emit(win)
