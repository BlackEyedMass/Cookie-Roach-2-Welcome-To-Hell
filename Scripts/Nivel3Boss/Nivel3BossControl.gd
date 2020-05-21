extends "res://Scripts/Enemigo.gd"


var saludBase = 25

export(PackedScene)var cuerpo

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("bosses",false)
	
	var jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		var damageJugador = instanciaJugador.damage
		var cadenciaDisparoJugador = instanciaJugador.cadenciaDisparo
		
		salud = round((saludBase * damageJugador) * (1 + cadenciaDisparoJugador))


func _exit_tree():
	var nuevoCuerpo = cuerpo.instance()
	nuevoCuerpo.position = position
	get_parent().call_deferred("add_child",nuevoCuerpo)
