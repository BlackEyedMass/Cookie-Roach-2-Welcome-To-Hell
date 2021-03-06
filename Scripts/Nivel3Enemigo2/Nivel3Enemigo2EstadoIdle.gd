extends Node

var fsm: StateMachine

func enter():
	fsm.padre.get_node("AnimationPlayer").stop(false)
	
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
	
	return delta

func _on_timer_timeout():
	exit("Movimiento")
