extends "res://Scripts/Enemigo.gd"

signal lengua_destruida

# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 1

func _exit_tree():
	emit_signal("lengua_destruida")
