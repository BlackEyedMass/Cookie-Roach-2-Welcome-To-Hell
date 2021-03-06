extends Node

var fsm: StateMachine

var direccion = Vector2()
var velocidad = 15

var movimiento = Vector2()

var distanciaAJugador = Vector2()

export(PackedScene) var rigidBody

func enter():
	fsm.padre.get_node("AnimationPlayer").play("anim_nivel_3_enemigo_1_pounce")
	
	var jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		
		distanciaAJugador = (instanciaJugador.global_position - fsm.padre.global_position).normalized()
		
	movimiento = distanciaAJugador * velocidad
	
	fsm.padre.get_node("SonidoAtaque").play()

func exit(next_state):
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	
	var movimiento = distanciaAJugador * velocidad
	fsm.padre.global_position += movimiento
	
	return delta
