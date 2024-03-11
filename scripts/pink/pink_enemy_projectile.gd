extends Node2D

@onready var hitbox_component: = $Anchor/HitboxComponent as HitboxComponent
@onready var visible_on_screen_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier
@onready var scale_component: = $Components/ScaleComponent as ScaleComponent

func _ready() -> void:
	scale_component.tween_scale()
	hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))
	visible_on_screen_notifier.screen_exited.connect(queue_free)
	
