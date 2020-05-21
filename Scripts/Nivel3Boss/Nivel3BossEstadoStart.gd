extends Node

var fsm: StateMachine

var limite = 600

func enter():
	fsm.padre.get_node("AnimationPlayer").play("anim_nivel_3_jefe_start")
	fsm.padre.position = Vector2(690,180)

func exit(next_state):
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	fsm.padre.position.x -= 1
	
	if fsm.padre.position.x <= limite:
		exit("Attack1Setup")
	
	return delta
