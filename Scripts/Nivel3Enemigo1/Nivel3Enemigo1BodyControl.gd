extends RigidBody2D

var movimiento = Vector2()

var distanciaAJugador = Vector2()

var velocidad = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	var jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		
		distanciaAJugador = (instanciaJugador.global_position - global_position).normalized()
		
	movimiento = distanciaAJugador * -velocidad
	apply_impulse(Vector2.ZERO,movimiento)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
