extends Node

var fsm : StateMachine

var limiteSuperior = 50
var limiteInferior = 310

var velocidad = 2

var posicionJugador = Vector2.ZERO
var posicionActual = Vector2.ZERO

export(PackedScene) var proyectil

func _ready():
	pass

func enter():
	var timerCambio = Timer.new()
	timerCambio.autostart = true
	timerCambio.wait_time = rand_range(2,2.5)
	timerCambio.connect("timeout",self,"_on_timerCambio_timeout")
	add_child(timerCambio)
	
	var jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		posicionJugador.y = instanciaJugador.position.y
		posicionActual.y = fsm.padre.position.y
		
		if (posicionActual.y > posicionJugador.y):
			velocidad *= -1
		elif (posicionActual.y < posicionJugador.y):
			velocidad *= 1
	
	_disparar()

func exit(next_state):
	var contadores = get_child_count()
	
	if contadores > 0:
		for n in get_children():
			if n.is_in_group("enemigos"):
				continue
			remove_child(n)
			n.call_deferred('free')
	
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	
	fsm.padre.position.y += velocidad
	
	if (fsm.padre.position.y <= limiteSuperior || fsm.padre.position.y >= limiteInferior):
		velocidad *= -1
	
	return delta

func _on_timerCambio_timeout():
	var numeroAleatorio = randi() % 2      # Returns random integer between 0 and 1
	match numeroAleatorio:
		0:
			exit("Moving2")
		1:
			exit("Moving3Idle")

func _disparar():
	var nuevoProyectil = proyectil.instance()
	add_child(nuevoProyectil)
