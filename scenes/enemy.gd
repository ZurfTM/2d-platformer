extends CharacterBody2D

@onready var ap = $AnimationPlayer
const GRAV = 100
const UP = Vector2(0,-1)
var speed = -300
#var velocity = Vector2.ZERO

func _ready():
	ap.play("idle")

func _physics_process(_delta):
	velocity.y += GRAV
	if is_on_wall():
		speed *= -1.0
		if speed>=0:
			$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
	velocity.x = speed
	#motion = move_and_slide(motion, UP)
	velocity.y -= 1
