extends "res://Scripts/Enemigo.gd"

var direccion = Vector2()
var velocidad = 5

var distanciaAJugador = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 1
	
	var jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		
		distanciaAJugador = (instanciaJugador.global_position - global_position).normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movimiento = distanciaAJugador * velocidad
	global_position += movimiento
	
	rotate(-0.1)
