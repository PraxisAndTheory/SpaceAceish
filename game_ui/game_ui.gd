extends Control

@onready var health_bar = $ColorRect/MC/HB/HealthBar
@onready var score_label = $ColorRect/MC/HB/ScoreLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_player_hit.connect(on_player_hit)
	SignalManager.on_player_health_bonus.connect(on_player_health_bonus)
	SignalManager.on_score_updated.connect(on_score_updated)

func on_player_hit(v: int) -> void:
	health_bar.take_damage(v)

func on_score_updated(v: int) -> void:
	score_label.text = "%06d" % v

func on_player_health_bonus(v: int):
	health_bar.incr_value(v)

func _on_health_bar_died():
	SignalManager.on_player_died.emit()
