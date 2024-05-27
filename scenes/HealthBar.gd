extends ProgressBar

@export var player: Player

func _ready():
	if player:
		player.connect("health_changed", _on_health_changed)
		_on_health_changed(0, 0)

func _on_health_changed(_current_hp, _max_hp):
	value = float(player.current_hp) / float(player.max_hp) * 100
