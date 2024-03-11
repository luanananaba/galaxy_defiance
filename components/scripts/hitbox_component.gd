extends Area2D
class_name HitboxComponent
# Give the component a class name so it can be instanced as a custom node.

# Export the damage amount this hitbox deals.
@export var damage = 1.0

# Create a signal for when the hitbox hits a hurtbox.
signal hit_hurtbox(_hurtbox)

func _ready():
	# Connect on area entered to our hurtbox entered function.
	area_entered.connect(_on_hurtbox_entered)
	

func _on_hurtbox_entered(_hurtbox: HurtboxComponent):
	# Make sure the area we are overlapping is a hurtbox.
	if not _hurtbox is HurtboxComponent: return
	
	# Make sure the hurtbox isn't invincible.
	if _hurtbox.is_invincible: return
	
	# Signal out that we hit a hurtbox
	# (this is useful for destroying projectiles when they hit something).
	hit_hurtbox.emit(_hurtbox)
	
	# Have the hurtbox signal out that it was hit.
	_hurtbox.hurt.emit(self)
	
