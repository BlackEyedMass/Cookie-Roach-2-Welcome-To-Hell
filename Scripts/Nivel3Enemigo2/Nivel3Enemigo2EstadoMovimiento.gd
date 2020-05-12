extends Node

var fsm: StateMachine

var nuevaPosicion = Vector2.ZERO
var movimiento = Vector2.ZERO
var multiplicador = 20


func enter():
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = rand_range(0.25,0.75)
	timer.connect("timeout",self,"_on_timer_timeout")
	
	add_child(timer)
	nuevaPosicion.x = rand_range(-1,1)
	nuevaPosicion.y = rand_range(-1,1)
	
	movimiento = nuevaPosicion * multiplicador

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
	if (fsm.padre.position.y == 310 || fsm.padre.position.y == 50):
		movimiento.y *= -1
	
	fsm.padre.position += movimiento.normalized() * 3
	
	fsm.padre.position.y = clamp(fsm.padre.position.y,50,310)

func _on_timer_timeout():
	exit("Idle")
