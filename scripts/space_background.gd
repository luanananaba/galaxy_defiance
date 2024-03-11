extends ParallaxBackground

@onready var space_layer: ParallaxLayer = %SpaceLayer
@onready var far_stars_layer: ParallaxLayer = %FarStarsLayer
@onready var close_stars_layer: ParallaxLayer = %CloseStarsLayer

func _process(_delta: float) -> void:
	space_layer.motion_offset.y += 2 * _delta
	far_stars_layer.motion_offset.y += 5 * _delta
	close_stars_layer.motion_offset.y += 20 * _delta
	
