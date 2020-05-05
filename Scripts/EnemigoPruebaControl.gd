extends "res://Scripts/Enemigo.gd"


export(int) var velocidad


# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.x -= velocidad
