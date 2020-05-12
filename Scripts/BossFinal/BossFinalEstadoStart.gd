extends Node

var fsm: StateMachine

var limite = 600

func enter():
	pass

func exit(next_state):
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	fsm.padre.position.x -= 1
	
	if fsm.padre.position.x <= limite:
		var numeroAleatorio = randi() % 3      # Returns random integer between 0 and 2
		match numeroAleatorio:
			0:
				exit("Moving1")
			1:
				exit("Moving2")
			2:
				exit("Moving3Idle")
	
	return delta
