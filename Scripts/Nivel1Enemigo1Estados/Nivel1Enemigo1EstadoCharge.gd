extends Node

var fsm: StateMachine

func enter():
	pass

func exit(next_state):
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	fsm.padre.position.x -= 20
	return delta
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
