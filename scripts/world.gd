extends Node2D

@export var game_stats: GameStats

@onready var player: Node2D = $Player
@onready var score_label: Label = $ScoreLabel

func _ready() -> void:
	randomize()
	
	update_score_label(game_stats.score)
	game_stats.score_changed.connect(update_score_label)
	
	player.tree_exiting.connect(func():
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://scenes/game_over.tscn"))
	

func update_score_label(_new_score: int) -> void:
	score_label.text = "Pontos: " + str(_new_score)
	
