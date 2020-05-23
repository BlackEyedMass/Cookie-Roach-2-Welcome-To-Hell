extends "res://Scripts/Enemigo.gd"


var saludBase = 25

export(PackedScene)var cuerpo

signal muerto

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("bosses",false)
	
	var jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		var damageJugador = instanciaJugador.damage
		var cadenciaDisparoJugador = instanciaJugador.cadenciaDisparo
		
		salud = round((saludBase * damageJugador) * (1 + cadenciaDisparoJugador))
	
	var controladorNivel = find_parent("Nivel3")
	if controladorNivel != null:
		connect("muerto",controladorNivel,"on_Nivel3Boss_muerto")


func _exit_tree():
	var nuevoCuerpo = cuerpo.instance()
	nuevoCuerpo.position = position
	get_parent().call_deferred("add_child",nuevoCuerpo)
	emit_signal("muerto")
