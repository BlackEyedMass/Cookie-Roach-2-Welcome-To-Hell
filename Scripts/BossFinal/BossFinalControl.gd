extends "res://Scripts/Enemigo.gd"


var saludBase = 100

signal jugador_derrotado
signal derrotado

var puedeEmitir

# Called when the node enters the scene tree for the first time.
func _ready():
	puedeEmitir = true
	var jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		var damageJugador = instanciaJugador.damage
		var cadenciaDisparoJugador = instanciaJugador.cadenciaDisparo
		
		salud = round((saludBase * damageJugador) * (1 + cadenciaDisparoJugador))
	
	connect("jugador_derrotado",find_parent("Control"),"on_BossFinal_jugador_derrotado")
	
	if find_parent("BossFinalFase2") != null:
		connect("derrotado",find_parent("BossFinalFase2"),"on_BossFinal_derrotado")
	#connect("derrotado",find_parent("Control"),"on_BossFinal_derrotado")

func _process(delta):
	var jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0 and puedeEmitir:
		emit_signal("jugador_derrotado")
		puedeEmitir = false
	else:
		return

func _exit_tree():
	emit_signal("derrotado")
	
