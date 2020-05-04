extends Node

var fsm: StateMachine

var centroPantalla
var posicionActual  = Vector2()
var posicionObjetivo = Vector2()
var movimiento = Vector2()

func enter():
	movimiento = fsm.padre.position
	centroPantalla = get_viewport().get_visible_rect().size.y / 2
	

func exit(next_state):
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	posicionObjetivo.y = centroPantalla
	posicionActual.y = fsm.padre.position.y
	movimiento += (posicionObjetivo - posicionActual) * 0.1
	
	fsm.padre.position.y = movimiento.y
	
	return delta
