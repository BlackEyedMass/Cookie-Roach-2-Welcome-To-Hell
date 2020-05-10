extends Node

var fsm: StateMachine

var maxRepeticiones
var repeticiones

func enter():
	maxRepeticiones = randi() % 2 + 1 # Returns random integer between 1 and 2
	repeticiones = 0
	
	_reproducir_animacion()

func exit(next_state):
	fsm.change_to(next_state)

func _reproducir_animacion():
	var animador = fsm.padre.get_node("AnimationPlayer")
	animador.play("anim_bossnivel2_ataque_3_setup")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "anim_bossnivel2_ataque_3_setup":
		if repeticiones < maxRepeticiones:
			_reproducir_animacion()
			repeticiones += 1
		else:
			exit("Attack3")
