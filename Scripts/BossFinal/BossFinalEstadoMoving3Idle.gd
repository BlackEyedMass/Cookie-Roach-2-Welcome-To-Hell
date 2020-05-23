extends Node

var fsm: StateMachine

export(PackedScene) var proyectil

func enter():
	var nuevoProyectil = proyectil.instance()
	nuevoProyectil.position = fsm.padre.position
	fsm.padre.get_parent().add_child(nuevoProyectil)
	
	var numProyectiles = round(rand_range(8,10))
	print("Numero Proyectiles: ",numProyectiles)
	nuevoProyectil.start(-225,-135,numProyectiles,fsm.padre.position.x,fsm.padre.position.y)
	
	fsm.padre.get_node("SonidoLaser3").play()
	
	var timerCambio = Timer.new()
	timerCambio.autostart = true
	timerCambio.wait_time = rand_range(0.5,0.75)
	timerCambio.connect("timeout",self,"_on_timerCambio_timeout")
	add_child(timerCambio)

func exit(next_state):
	var contadores = get_child_count()
	
	if contadores > 0:
		for n in get_children():
			remove_child(n)
			n.call_deferred('free')
	
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	
	return delta

func _on_timerCambio_timeout():
	var numeroAleatorio = randi() % 3      # Returns random integer between 0 and 2
	match numeroAleatorio:
		0:
			exit("Moving1")
		1:
			exit("Moving3")
		2:
			exit("Moving2")
