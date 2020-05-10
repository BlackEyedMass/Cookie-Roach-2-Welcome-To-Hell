extends Node

var fsm: StateMachine

func enter():
	var animador = fsm.padre.get_node("AnimationPlayer")
	animador.play("anim_bossnivel2_ataque_1")
	
	var timerAtaque = Timer.new()
	timerAtaque.autostart = true
	timerAtaque.wait_time = 1.5
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
	# Add handler code here

	
	return delta
	
func _on_timerAtaque_timeout():
	exit("Attack1")
