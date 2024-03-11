extends Node2D

@export var green_enemy_scene: PackedScene
@export var yellow_enemy_scene: PackedScene
@export var pink_enemy_scene: PackedScene
@export var game_stats: GameStats

@onready var green_enemy_spawn_timer: Timer = $GreenEnemySpawnTimer
@onready var yellow_enemy_spawn_timer: Timer = $YellowEnemySpawnTimer
@onready var pink_enemy_spawn_timer: Timer = $PinkEnemySpawnTimer
@onready var spawner_component: = $Components/SpawnerComponent as SpawnerComponent

var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")
var margin = 8

func _ready() -> void:
	green_enemy_spawn_timer.timeout.connect(
		handle_spawn.bind(green_enemy_scene, green_enemy_spawn_timer)
	)
	
	yellow_enemy_spawn_timer.timeout.connect(
		handle_spawn.bind(yellow_enemy_scene, yellow_enemy_spawn_timer, 5.0)
	)
	
	pink_enemy_spawn_timer.timeout.connect(
		handle_spawn.bind(pink_enemy_scene, pink_enemy_spawn_timer, 10.0)
	)
	
	game_stats.score_changed.connect(func(new_score: int):
		if new_score > 10:
			yellow_enemy_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT
		
		if new_score > 30:
			pink_enemy_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT)
	

func handle_spawn(_enemy_scene: PackedScene, _timer: Timer, _time_offset: float = 1.0) -> void:
	spawner_component.scene = _enemy_scene
	spawner_component.spawn(Vector2(randf_range(margin, screen_width - margin), -16))
	
	var spawn_rate = _time_offset / (0.5 + (game_stats.score * 0.01))
	
	_timer.start(spawn_rate + randf_range(0.25, 0.5))
	
