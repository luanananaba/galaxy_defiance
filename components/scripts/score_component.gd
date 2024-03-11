extends Node
class_name ScoreComponent
# Give the component a class name so it can be instanced as a custom node.

# Export the game stats so we can manipulate the game score.
@export var game_stats: GameStats

# Export the amount the score should be adjusted.
@export var adjust_amount = 1

# This is the function that we call to activate this component. By default it will.
# Use the adjust_amount when called but we could optionally pass in a different amount.
func adjust_score(_amount: int = adjust_amount):
	game_stats.score += _amount
	
