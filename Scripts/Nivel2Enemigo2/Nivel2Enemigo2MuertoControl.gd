extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Cuerpo.apply_central_impulse(Vector2(rand_range(-75,75),0))
	$Cuerpo.angular_velocity = rand_range(-20,20)


func _on_Timer_timeout():
	call_deferred("free")

