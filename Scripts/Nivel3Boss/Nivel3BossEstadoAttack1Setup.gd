extends Node

var fsm: StateMachine

func enter():
	fsm.padre.get_node("AnimationPlayer").play("anim_nivel_3_jefe_attack_1_setup")

func exit(next_state):
	fsm.change_to(next_state)
