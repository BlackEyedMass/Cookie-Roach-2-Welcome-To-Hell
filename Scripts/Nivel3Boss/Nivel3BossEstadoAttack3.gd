extends Node

var fsm: StateMachine

export(PackedScene) var huevo

func enter():
	var nuevoHuevo = huevo.instance()
	nuevoHuevo.position = fsm.padre.position
	fsm.padre.get_parent().add_child(nuevoHuevo)
	
	exit("Attack1Movement")

func exit(next_state):
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	
	
	return delta
