extends Node
class_name MoveInputComponent

@export var move_component: MoveComponent
@export var move_stats: MoveStats

func _input(_event: InputEvent) -> void:
	var input_axis = Input.get_axis("move_left", "move_right")
	move_component.velocity = Vector2(input_axis * move_stats.speed, 0)
	
