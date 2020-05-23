extends Node

var fsm: StateMachine

export(PackedScene) var proyectil

func enter():
	fsm.padre.get_node("AnimationPlayer").stop(false)
	
	var nuevoProyectil = proyectil.instance()
	nuevoProyectil.position = fsm.padre.position
	fsm.padre.get_parent().add_child(nuevoProyectil)
	
	fsm.padre.get_node("SonidoDisparos").play()
	
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = rand_range(0.5,1.0)
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)

func exit(next_state):
	var contadores = get_child_count()
	
	if contadores > 0:
		for n in get_children():
			remove_child(n)
			n.call_deferred('free')
	
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	var jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		fsm.padre.look_at(instanciaJugador.global_position)
		fsm.padre.rotation_degrees = fsm.padre.rotation_degrees + 180
	
	return delta

func _on_timer_timeout():
	exit("Attack1Movement")
