extends "res://Scripts/Enemigo.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal perder_vida

var activado = false

# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 4


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 1
	
	if salud != 4 and !activado:
		emit_signal("perder_vida")
		activado = true