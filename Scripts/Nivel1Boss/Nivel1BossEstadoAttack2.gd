extends Node

var fsm: StateMachine

var velocidad = 20

func enter():
	pass

func exit(next_state):
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	fsm.padre.position.x -= velocidad
	
	if fsm.padre.position.x <= -30:
		velocidad *= -1
		exit("Attack2Setup")
	
	if fsm.padre.position.x >= 680:
		velocidad *= -1
		exit("Attack2Exit")
	
	return delta
