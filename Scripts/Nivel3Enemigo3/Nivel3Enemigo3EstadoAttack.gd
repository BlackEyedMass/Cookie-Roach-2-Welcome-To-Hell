extends Node

var fsm: StateMachine

export(PackedScene) var tela

func enter():
	fsm.padre.get_node("AnimationPlayer").play("anim_nivel_3_enemigo_3_attack")

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
		
		var posicionJugador = (instanciaJugador.global_position - fsm.padre.global_position).normalized()
		
		var movimiento = posicionJugador * 13
		fsm.padre.global_position += movimiento
		
		if distanciaAJugador.length() <= 75:
			_crearTela()
			fsm.padre.call_deferred('free')
	
	return delta

func _crearTela():
	var nuevaTela = tela.instance()
	nuevaTela.position = fsm.padre.position
	fsm.padre.get_parent().add_child(nuevaTela)
