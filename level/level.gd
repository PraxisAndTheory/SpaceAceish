extends Node2D

@onready var sound = $Sound

# Called when the node enters the scene tree for the first time.
func _ready():
	ScoreManager.reset_score()
	SignalManager.on_player_died.connect(on_player_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_Q):
		GameManager.load_main_scene()

func on_player_died() -> void:
	sound.stop()
	for node in get_children():
		if is_instance_valid(node) and node.is_class("Node2D"):
			ObjectMaker.create_explosion(node.global_position, self)
			node.queue_free()
