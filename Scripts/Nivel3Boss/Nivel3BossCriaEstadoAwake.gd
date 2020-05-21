extends Node

var fsm: StateMachine

func enter():
	fsm.padre.get_node("AnimationPlayer").play("anim_nivel_3_jefe_cria_awake")
	
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 1
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
		fsm.padre.look_at(instanciaJugador.global_position)
		fsm.padre.rotation_degrees = fsm.padre.rotation_degrees + 180

func _on_timer_timeout():
	exit("Attack")
