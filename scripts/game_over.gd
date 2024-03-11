extends Control

@export var game_stats: GameStats

@onready var score_value: Label = %ScoreValue
@onready var highscore_value: Label = %HighscoreValue

var save_path = SAVE_PATH

const SAVE_PATH = "user://save.cfg"

func _ready() -> void:
	load_highscore()
	
	if game_stats.score > game_stats.highscore:
		game_stats.highscore = game_stats.score
		save_highscore()
		
	score_value.text = str(game_stats.score)
	highscore_value.text = str(game_stats.highscore)
	

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("start"):
		game_stats.score = 0
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	

func load_highscore() -> void:
	var config = ConfigFile.new()
	var error = config.load(save_path)
	
	if error != OK: return
	
	game_stats.highscore = config.get_value("game", "highscore")
	

func save_highscore() -> void:
	var config = ConfigFile.new()
	config.set_value("game", "highscore", game_stats.highscore)
	config.save(save_path)
	
