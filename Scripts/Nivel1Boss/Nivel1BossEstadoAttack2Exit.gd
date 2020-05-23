extends Node

var fsm: StateMachine

func enter():
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 0.2
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)

func exit(next_state):
	var contadores = get_child_count()
	
	if contadores > 0:
		for n in get_children():
			remove_child(n)
			n.call_deferred('free')
	
	fsm.change_to(next_state)

func _on_timer_timeout():
	exit("Start")
