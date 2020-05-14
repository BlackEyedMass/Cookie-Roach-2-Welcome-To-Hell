extends Node

var fsm: StateMachine

export(PackedScene) var ataque

func enter():
	fsm.animador.play("anim_nivel_1_avispa_jefe_disparando")
	fire()

func exit(next_state):
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	
	return delta

func fire():
	var nuevoAtaque = ataque.instance()
	add_child(nuevoAtaque)
	nuevoAtaque.start(-225,-135,12,fsm.padre.position.x,fsm.padre.position.y)
	exit("Attack1")
	
