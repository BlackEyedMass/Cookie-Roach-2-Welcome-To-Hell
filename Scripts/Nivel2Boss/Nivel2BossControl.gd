extends "res://Scripts/Enemigo.gd"


var saludBase = 25
var esperaEntreAtaques = 10

signal derrotado

# Called when the node enters the scene tree for the first time.
func _ready():
	var jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		var damageJugador = instanciaJugador.damage
		var cadenciaDisparoJugador = instanciaJugador.cadenciaDisparo
		
		salud = round((saludBase * damageJugador) * (1 + cadenciaDisparoJugador))
		
		var controlador = find_parent("Control")
		connect("derrotado",controlador,"_on_jefeNivel2_derrotado")
		
		var controladorNivel2 = find_parent("Nivel2")
		connect("derrotado",controladorNivel2,"_on_jefeNivel2_derrotado")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (salud < salud * 0.75):
		esperaEntreAtaques = 8
	elif (salud < salud * 0.5):
		esperaEntreAtaques = 6
	elif(salud < salud * 0.25):
		esperaEntreAtaques = 4

func _exit_tree():
	emit_signal("derrotado")
