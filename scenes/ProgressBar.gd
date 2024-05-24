extends ProgressBar



func _on_health_changed(current_hp: int, max_hp: int) -> void:
	self.max_value = max_hp
	self.value = current_hp

func _ready():
	# Assuming the player node has a name 'Player' and it is at the root of the scene tree
	var player = get_tree().get_root().find_node("Player", true, false)
	player.connect("health_changed", self, "_on_health_changed")
