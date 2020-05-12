extends "res://Scripts/Enemigo.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 5

func _on_Timer_timeout():
	call_deferred("free")
