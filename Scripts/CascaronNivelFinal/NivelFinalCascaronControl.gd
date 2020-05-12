extends "res://Scripts/Enemigo.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 1
