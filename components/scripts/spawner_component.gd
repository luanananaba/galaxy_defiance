extends Node2D
class_name SpawnerComponent
# Give the component a class name so it can be instanced as a custom node.

# Export the dependencies for this component.
# The scene we want to spawn.
@export var scene: PackedScene

# Spawn an instance of the scene at a specific global position on a parent.
# By default the parent is the current "main" scene, but you can pass in
# an alternative parent if you so choose.
func spawn(
	_global_spawn_position: Vector2 = global_position, _parent: Node = get_tree().current_scene) -> Node:
	
	assert(scene is PackedScene, "Error: The scene export was never set on this spawner component.")
	
	# Instance the scene.
	var instance = scene.instantiate()
	
	# Add it as a child of the parent.
	_parent.add_child(instance)
	
	# Update the global position of the instance.
	# (This must be done after adding it as a child)
	instance.global_position = _global_spawn_position
	
	# Return the instance in case we want to perform any other operations
	# on it after instancing it.
	return instance
	
