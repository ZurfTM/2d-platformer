extends ProgressBar

@export var player: NodePath

func _ready():
	if player:
		var player_instance = get_node(player)
		if player_instance:
			player_instance.connect("health_changed", Callable (self, "_on_health_changed"))
			_on_health_changed()

func _on_health_changed():
	var player_instance = get_node(player)
	if player_instance:
		value = float(player_instance.current_hp) / float(player_instance.max_hp) * 100
