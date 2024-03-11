extends Node
class_name MoveComponent

@export var actor: Node2D
@export var velocity: Vector2

func _process(_delta: float) -> void:
	actor.translate(velocity * _delta)
	
