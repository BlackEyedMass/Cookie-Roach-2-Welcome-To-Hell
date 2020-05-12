extends Node

var fsm: StateMachine

func enter():
	pass

func exit(next_state):
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	var jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		var distanciaAJugador = instanciaJugador.global_position - fsm.padre.global_position
		
		if distanciaAJugador.length() <= 150:
			exit("Awake")


func _on_Nivel3Enemigo3_perder_vida():
	exit("Awake")
