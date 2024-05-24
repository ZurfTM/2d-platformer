extends Sprite2D


func _ready():
	pass


func _physics_process(delta):
	global_position = ReplayManager.fetch_new_point()
