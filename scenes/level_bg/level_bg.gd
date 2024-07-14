extends ParallaxBackground


@onready var parallax_layer = $ParallaxLayer
@onready var parallax_layer_2 = $ParallaxLayer2
@onready var parallax_layer_3 = $ParallaxLayer3

const SPEED: float = 200.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	parallax_layer.motion_offset.y += SPEED * delta * 0.2
	parallax_layer_2.motion_offset.y += SPEED * delta * 0.3
	parallax_layer_3.motion_offset.y += SPEED * delta * 0.33

func set_running(running: bool) -> void:
	set_process(running)
