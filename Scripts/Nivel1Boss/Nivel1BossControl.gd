extends "res://Scripts/Enemigo.gd"

export(PackedScene) var cadaver

var saludBase = 25
var esperaEntreAtaques = 9

signal muerto

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
	
	var controladorNivel = find_parent("Nivel1")
	if controladorNivel != null:
		connect("muerto",controladorNivel,"on_Nivel1Boss_muerto")

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(_delta):
	if (salud < salud * 0.75):
		esperaEntreAtaques = 7
	elif (salud < salud * 0.5):
		esperaEntreAtaques = 5
	elif(salud < salud * 0.25):
		esperaEntreAtaques = 3

func _exit_tree():
	var nuevoCadaver = cadaver.instance()
	nuevoCadaver.position = position
	get_parent().call_deferred("add_child",nuevoCadaver)
	emit_signal("muerto")
