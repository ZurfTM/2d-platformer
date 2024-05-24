extends Control

func _ready():
	var playButton = $Button
	playButton.connect("pressed", self, "_on_PlayButton_pressed")

func _on_PlayButton_pressed():
	# Load the game scene
	var gameScene = preload("res://scenes/world.tscn".tscn")
	
	get_tree().change_scene(gameScene)
