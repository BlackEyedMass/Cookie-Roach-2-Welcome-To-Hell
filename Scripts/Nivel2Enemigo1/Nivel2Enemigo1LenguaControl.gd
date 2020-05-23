extends "res://Scripts/Enemigo.gd"

signal lengua_destruida

# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 99

func _process(delta):
	if salud != 99:
		emitir()

func emitir():
	emit_signal("lengua_destruida")
