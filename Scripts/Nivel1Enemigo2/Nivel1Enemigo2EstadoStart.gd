extends Node

var fsm: StateMachine

var limite = 620

func enter():
	pass

func exit(next_state):
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	fsm.padre.position.x -= 1
	
	if fsm.padre.position.x <= limite:
		exit("Attack")
	
	return delta
