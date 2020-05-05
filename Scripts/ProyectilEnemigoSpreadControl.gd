extends "res://Scripts/Enemigo.gd"

var direccion = Vector2()
var velocidad = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func start(dirx,diry):
	direccion.x = dirx
	direccion.y = diry

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movimiento = direccion * velocidad
	global_position += movimiento
	
	rotate(-0.1)
