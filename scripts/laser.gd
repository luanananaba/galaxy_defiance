extends Node2D

@onready var visible_on_screen_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier
@onready var hitbox_component: HitboxComponent = $HitboxComponent as HitboxComponent
@onready var scale_component: ScaleComponent = $Components/ScaleComponent as ScaleComponent
@onready var flash_component: FlashComponent = $Components/FlashComponent as FlashComponent

func _ready() -> void:
	scale_component.tween_scale()
	flash_component.flash()
	visible_on_screen_notifier.screen_exited.connect(queue_free)
	hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))
	
