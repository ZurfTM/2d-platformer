extends Sprite2D


func _ready():
	pass


func _process(delta):
	global_position = ReplayManager.fetch_new_point()
