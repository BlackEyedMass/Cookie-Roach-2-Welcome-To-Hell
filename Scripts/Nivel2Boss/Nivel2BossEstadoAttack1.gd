extends Node

var fsm: StateMachine

export(PackedScene) var proyectil

var agresividad

func enter():
	agresividad = fsm.padre.esperaEntreAtaques
	
	var timerDisparos = Timer.new()
	timerDisparos.autostart = true
	timerDisparos.wait_time = 0.75
	timerDisparos.connect("timeout",self,"_on_timerDisparos_timeout")
	add_child(timerDisparos)
	
	var timerAtaque = Timer.new()
	timerAtaque.autostart = true
	timerAtaque.wait_time = agresividad
	timerAtaque.connect("timeout",self,"_on_timerAtaque_timeout")
	add_child(timerAtaque)

func exit(next_state):
	var contadores = get_child_count()
	
	if contadores > 0:
		for n in get_children():
			remove_child(n)
			n.call_deferred('free')
	
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	var jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		fsm.padre.look_at(instanciaJugador.global_position)
		fsm.padre.rotation_degrees = fsm.padre.rotation_degrees + 180
		
		var distanciaAJugador = instanciaJugador.global_position - fsm.padre.global_position

func _on_timerDisparos_timeout():
	var nuevoProyectil = proyectil.instance()
	nuevoProyectil.position = fsm.padre.position
	get_parent().add_child(nuevoProyectil)

func _on_timerAtaque_timeout():
	var numeroAleatorio = randf()
	
	if numeroAleatorio > 0.5:
		exit("Attack2")
	else:
		exit("Attack3Setup")
