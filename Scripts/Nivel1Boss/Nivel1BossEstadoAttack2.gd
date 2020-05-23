extends Node

var fsm: StateMachine

var velocidad = 20

func enter():
	fsm.padre.get_node("SonidoCarga").play()
	
	fsm.padre.get_node("AnimationPlayer").play("anim_nivel_1_avispa_jefe_cargando")

func exit(next_state):
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	fsm.padre.position.x -= velocidad
	
	if fsm.padre.position.x <= -100:
		velocidad *= -1
		fsm.padre.get_node("Sprite").flip_h = true
		exit("Attack2Setup")
	
	if fsm.padre.position.x >= 700:
		velocidad *= -1
		fsm.padre.get_node("Sprite").flip_h = false
		exit("Attack2Exit")
	
	return delta
