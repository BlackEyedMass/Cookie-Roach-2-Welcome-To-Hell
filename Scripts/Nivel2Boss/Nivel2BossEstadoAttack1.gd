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
		fsm.padre.get_node("Rotable").look_at(instanciaJugador.global_position)
		fsm.padre.get_node("Rotable").rotation_degrees = fsm.padre.get_node("Rotable").rotation_degrees + 180
		
		var distanciaAJugador = instanciaJugador.global_position - fsm.padre.global_position

func _on_timerDisparos_timeout():
	var nuevoProyectil1 = proyectil.instance()
	nuevoProyectil1.global_position = Vector2(616,100)
	get_parent().add_child(nuevoProyectil1)
	
	var nuevoProyectil2 = proyectil.instance()
	nuevoProyectil2.global_position = Vector2(616,260)
	get_parent().add_child(nuevoProyectil2)
	
	fsm.padre.get_node("SonidoDisparo").play()

func _on_timerAtaque_timeout():
	var numeroAleatorio = randf()
	
	if numeroAleatorio > 0.5:
		exit("Attack2")
	else:
		exit("Attack3Setup")
