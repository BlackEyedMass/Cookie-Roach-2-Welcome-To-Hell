extends Node

var fsm: StateMachine

var posicionJugador = Vector2.ZERO

func enter():
	fsm.padre.get_node("AnimationPlayer").play("anim_nivel_3_jefe_attack_2")
	
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 2
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)
	
	var jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		var distanciaAJugador = instanciaJugador.global_position - fsm.padre.global_position
		
		posicionJugador = (instanciaJugador.global_position - fsm.padre.global_position).normalized()
		

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
	fsm.padre.global_position += posicionJugador * 15
	
	
	return delta

func _on_timer_timeout():
	exit("Start")
