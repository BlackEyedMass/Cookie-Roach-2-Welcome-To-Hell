extends "res://Scripts/Enemigo.gd"


var saludBase = 25

# warning-ignore:unused_signal
signal derrotado

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
		
		var controlador = find_parent("Control")
		connect("derrotado",controlador,"_on_jefeNivel3_derrotado")

		var controladorNivel3 = find_parent("Nivel3")
		connect("derrotado",controladorNivel3,"_on_jefeNivel3_derrotado")

func _exit_tree():
	emit_signal("derrotado")
