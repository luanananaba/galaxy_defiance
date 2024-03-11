extends Node2D
class_name Enemy

@onready var visible_on_screen_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier
@onready var hurtbox_component: = $HurtboxComponent as HurtboxComponent
@onready var hitbox_component: = $HitboxComponent as HitboxComponent
@onready var variable_pitch_audio: = $VariablePitchAudioStreamPlayer as VariablePitchAudioStreamPlayer
@onready var stats_component: = $Components/StatsComponent as StatsComponent
@onready var move_component: = $Components/MoveComponent as MoveComponent
@onready var scale_component: = $Components/ScaleComponent as ScaleComponent
@onready var flash_component: = $Components/FlashComponent as FlashComponent
@onready var shake_component: = $Components/ShakeComponent as ShakeComponent
@onready var destroyed_component: = $Components/DestroyedComponent as DestroyedComponent
@onready var score_component: = $Components/ScoreComponent as ScoreComponent

func _ready() -> void:
	stats_component.no_health.connect(func():
		score_component.adjust_score())
	
	visible_on_screen_notifier.screen_exited.connect(queue_free)
	hurtbox_component.hurt.connect(func(_hitbox: HitboxComponent):
		scale_component.tween_scale()
		flash_component.flash()
		shake_component.tween_shake()
		variable_pitch_audio.play_with_variance())
		
	stats_component.no_health.connect(queue_free)
	hitbox_component.hit_hurtbox.connect(destroyed_component.destroy.unbind(1))
	
