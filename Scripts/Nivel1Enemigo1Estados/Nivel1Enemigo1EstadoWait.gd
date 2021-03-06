extends Node

var fsm: StateMachine

var posicionJugador = Vector2()
var posicionActual = Vector2()
var posicionObjetivo = Vector2()
func enter():
	posicionObjetivo = fsm.padre.position
	
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 3.0
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)

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
		posicionJugador.y = instanciaJugador.position.y
		posicionActual.y = fsm.padre.position.y
		
		posicionObjetivo += (posicionJugador - posicionActual) * 0.1
		
		fsm.padre.position.y = posicionObjetivo.y
	return delta

func _on_timer_timeout():
	exit("Charge")

#
#func physics_process(delta):
#	return delta
#
#func input(event):
#	return event
#
#func unhandled_input(event):
#	return event
#
#func unhandled_key_input(event):
#	return event
#
#func notification(what, flag = false):
#	return [what, flag]
