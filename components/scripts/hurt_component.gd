extends Node
class_name HurtComponent
# Give the component a class name so it can be instanced as a custom node.

# Grab the stats so we can alter the health.
@export var stats_component: StatsComponent

# Grab a hurtbox so we know when we have taken a hit.
@export var hurtbox_component: HurtboxComponent

func _ready() -> void:
	# Connect the hurt signal on the hurtbox component to an anonymous function
	# that removes health equal to the damage from the hitbox.
	hurtbox_component.hurt.connect(func(_hitbox_component: HitboxComponent):
		stats_component.health -= _hitbox_component.damage)
	
