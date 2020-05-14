extends Node

var fsm : StateMachine

var limiteSuperior = 50
var limiteInferior = 310

var velocidad = 2
var velocidadDisparo = 2

export(PackedScene) var proyectil

export(Vector2) var cadenciaDisparo

func _ready():
	pass # Replace with function body.

func enter():
	var timerDisparos = Timer.new()
	timerDisparos.autostart = true
	timerDisparos.wait_time = rand_range(cadenciaDisparo.x,cadenciaDisparo.y)
	timerDisparos.connect("timeout",self,"_on_timerDisparos_timeout")
	add_child(timerDisparos)

func exit(next_state):
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	
	fsm.padre.position.y += velocidad

	if (fsm.padre.position.y <= limiteSuperior || fsm.padre.position.y >= limiteInferior):
		velocidad *= -1
	
	return delta

func _on_timerDisparos_timeout():
	
	var sprite = fsm.padre.get_node("Sprite")
	
	sprite.frame = 2
	
	var nuevoProyectil = proyectil.instance()
	fsm.padre.get_parent().add_child(nuevoProyectil)
	nuevoProyectil.start(fsm.padre.position,velocidadDisparo)
