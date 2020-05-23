extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Cuerpo.apply_central_impulse(Vector2(rand_range(-75,75),0))
	$Cuerpo.angular_velocity = rand_range(-20,20)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
