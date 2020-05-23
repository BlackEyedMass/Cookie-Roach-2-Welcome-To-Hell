extends Node

var fsm: StateMachine

export(PackedScene) var ataque

func enter():
	fsm.padre.get_node("AnimationPlayer").play("anim_nivel_1_avispa_jefe_disparando")
	fsm.padre.get_node("SonidoDisparoAmplio").play()
	fire()

func exit(next_state):
	fsm.change_to(next_state)

func fire():
	var nuevoAtaque = ataque.instance()
	add_child(nuevoAtaque)
	nuevoAtaque.start(-225,-135,12,fsm.padre.position.x,fsm.padre.position.y)
	
	exit("Attack1")
	
