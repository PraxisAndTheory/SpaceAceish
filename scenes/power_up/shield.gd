extends Area2D

@export var start_health: int = 5

@onready var collision_shape_2d = $CollisionShape2D
@onready var sound = $Sound
@onready var animation_player = $AnimationPlayer
@onready var timer = $Timer

var _health: int = start_health

# Called when the node enters the scene tree for the first time.
func _ready():
	disable_shield()

func disable_shield() -> void:
	timer.stop()
	hide()
	collision_shape_2d.call_deferred("set", "disabled", true)

func enable_shield() -> void:
	_health = start_health
	show()
	collision_shape_2d.call_deferred("set", "disabled", false)
	timer.start()
	SoundManager.play_power_up_sound(GameData.POWERUP_TYPE.SHIELD, sound)

func hit() -> void:
	animation_player.play("hit")
	_health -= 1
	if _health <= 0:
		disable_shield()

func _on_timer_timeout():
	disable_shield()


func _on_area_entered(_area):
	hit()
