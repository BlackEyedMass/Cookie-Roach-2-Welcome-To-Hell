extends Node

var fsm: StateMachine

var posicionJugador = Vector2()
var posicionActual = Vector2()
var posicionObjetivo = Vector2()
func enter():
	fsm.animador.play("anim_nivel_1_avispa_jefe_normal")
	
	fsm.padre.get_node("SonidoAlerta").play()
	
	posicionObjetivo = fsm.padre.position
	
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 1.0
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
		posicionJugador.y = instanciaJugador.position.y
		posicionActual.y = fsm.padre.position.y
		
		posicionObjetivo += (posicionJugador - posicionActual) * 0.1
		
		fsm.padre.position.y = posicionObjetivo.y
	return delta

func _on_timer_timeout():
	exit("Attack2")
