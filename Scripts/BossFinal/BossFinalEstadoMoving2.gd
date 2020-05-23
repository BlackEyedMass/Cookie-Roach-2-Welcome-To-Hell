extends Node

var fsm: StateMachine

var posicionJugador = Vector2()
var posicionActual = Vector2()
var posicionObjetivo = Vector2()

var velocidadDisparo = 4

export(PackedScene) var proyectil

func enter():
	fsm.padre.get_node("AnimationPlayer").play("anim_nivel_4_jefe_disparando_1")
	
	var timerCambio = Timer.new()
	timerCambio.autostart = true
	timerCambio.wait_time = rand_range(1,2)
	timerCambio.connect("timeout",self,"_on_timerCambio_timeout")
	add_child(timerCambio)
	
	var timerDisparos = Timer.new()
	timerDisparos.autostart = true
	timerDisparos.wait_time = 0.5
	timerDisparos.connect("timeout",self,"_on_timerDisparos_timeout")
	add_child(timerDisparos)
	
	posicionObjetivo = fsm.padre.position
	
	_disparar()

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
	var jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		posicionJugador.y = instanciaJugador.position.y
		posicionActual.y = fsm.padre.position.y
		
		posicionObjetivo += (posicionJugador - posicionActual) * 0.1
		
		fsm.padre.position.y = posicionObjetivo.y
	return delta

func _on_timerCambio_timeout():
	var numeroAleatorio = randi() % 2      # Returns random integer between 0 and 1
	match numeroAleatorio:
		0:
			exit("Moving1")
		1:
			exit("Moving3Idle")

func _on_timerDisparos_timeout():
	_disparar()

func _disparar():
	var nuevoProyectil = proyectil.instance()
	nuevoProyectil.position = fsm.padre.position
	fsm.padre.get_parent().add_child(nuevoProyectil)
	nuevoProyectil.start(fsm.padre.position,velocidadDisparo)
	
	fsm.padre.get_node("SonidoLaser2").play()
