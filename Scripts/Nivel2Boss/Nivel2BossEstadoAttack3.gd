extends Node

var fsm: StateMachine

export(PackedScene) var proyectil

func enter():
	var timerAtaque = Timer.new()
	timerAtaque.autostart = true
	timerAtaque.wait_time = 0.25
	timerAtaque.connect("timeout",self,"_on_timerAtaque_timeout")
	add_child(timerAtaque)
	
	var nuevoAtaque = proyectil.instance()
	get_parent().add_child(nuevoAtaque)
	
	var numProyectiles = round(rand_range(8,10))
	print("Numero Proyectiles: ",numProyectiles)
	nuevoAtaque.start(-225,-135,numProyectiles,fsm.padre.position.x,fsm.padre.position.y)

func exit(next_state):
	var contadores = get_child_count()
	
	if contadores > 0:
		for n in get_children():
			remove_child(n)
			n.call_deferred('free')
	
	fsm.change_to(next_state)

func _on_timerAtaque_timeout():
	var numeroAleatorio = randf()
	
	if numeroAleatorio > 0.5:
		exit("Attack1")
		fsm.padre.get_node("AnimationPlayer").play("anim_nivel_2_boss_ataque_3_salida")
	else:
		exit("Attack3Setup")
