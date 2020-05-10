extends "res://Scripts/Enemigo.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 99

func _process(delta):
	if salud != 99:
		salud = 99
