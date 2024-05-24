extends CharacterBody2D

class_name Player

@export var game: Game

@export var speed = 300
@export var gravity = 30
@export var jump_force = 650
@export var max_hp = 30

@onready var ap = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var respawn_point = get_node("RespawnPoint")
@onready var current_hp: int = max_hp


var start_point: Vector2

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_force
	
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	velocity.x = speed * horizontal_direction
	
	if horizontal_direction != 0:
		switch_direction(horizontal_direction)
		sprite.flip_h = (horizontal_direction== -1)
		
		
		
	
	move_and_slide()	
	update_animations(horizontal_direction)
	ReplayManager.add_new_point(global_position)
	
func update_animations(horizontal_direction):
	if is_on_floor():
		#if horizontal_direction == 0:
		if is_zero_approx(velocity.x):
			ap.play("idle")
		else:
			ap.play("run")
	else:
		if velocity.y < 0:
			ap.play("jump")
		elif velocity.y > 0:
			ap.play("fall")


func switch_direction(horizontal_direction):
	sprite.flip_h = (horizontal_direction == -1)
	sprite.position.x = horizontal_direction * 4
	


func _ready():
	start_point = global_position
	current_hp = max_hp

signal health_changed(current_hp, max_hp)


func take_damage(amount: int) -> void:
	current_hp -= amount
	#current_hp = max(current_hp, 0)
	print("Damage", current_hp)
	#emit_signal("health_changed", current_hp, max_hp)
	health_changed.emit(current_hp, max_hp)
	if current_hp <= 0:
		die()

func heal(amount: int) -> void:
	current_hp += amount
	current_hp = min(current_hp, max_hp)
	emit_signal("health_changed", current_hp, max_hp)

func die() -> void:
	print("This entity has died.")
	ReplayManager.clear_positions()
	current_hp = max_hp
	global_position = start_point
	
	game.timer.reset()





var death_threshold = -500

func some_function():
	respawn_point.position = Vector2(-386, -460)
