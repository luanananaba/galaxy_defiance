extends Node2D

@onready var left_muzzle: Marker2D = $LeftMuzzle
@onready var right_muzzle: Marker2D = $RightMuzzle
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var animated_sprite: AnimatedSprite2D = $Anchor/AnimatedSprite
@onready var flame_animated_sprite: AnimatedSprite2D = %FlameAnimatedSprite
@onready var variable_pitch_audio: = $VariablePitchAudioStreamPlayer as VariablePitchAudioStreamPlayer
@onready var move_component: MoveComponent = $Components/MoveComponent as MoveComponent
@onready var scale_component: ScaleComponent = $Components/ScaleComponent as ScaleComponent
@onready var spawner_component: SpawnerComponent = $Components/SpawnerComponent as SpawnerComponent

func _ready() -> void:
	fire_rate_timer.timeout.connect(fire_lasers)
	

func _process(_delta: float) -> void:
	animate_the_ship()
	

func fire_lasers() -> void:
	variable_pitch_audio.play_with_variance()
	
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)
	scale_component.tween_scale()
	

func animate_the_ship() -> void:
	if move_component.velocity.x < 0:
		animated_sprite.play("bank_left")
		flame_animated_sprite.play("bank_left")
	elif move_component.velocity.x > 0:
		animated_sprite.play("bank_right")
		flame_animated_sprite.play("bank_right")
	else:
		animated_sprite.play("center")
		flame_animated_sprite.play("center")
	
