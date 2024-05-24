extends Area2D

# Damage amount
var damage_amount = 10


func _on_body_entered(body):
	print(body)
	if body.has_method("take_damage"):
		body.take_damage(damage_amount)
	
