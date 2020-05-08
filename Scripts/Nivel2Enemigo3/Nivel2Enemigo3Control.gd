extends "res://Scripts/Enemigo.gd"

var jugador

var atacando = false

var velocidad

export(PackedScene)var proyectil

# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 4
	velocidad = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
		$TiempoEntreAtaques.stop()
	else:
		var instanciaJugador = jugador[0]
		look_at(instanciaJugador.global_position)
		rotation_degrees = rotation_degrees + 180
		
	position.x -= velocidad

func _on_TiempoEntreAtaques_timeout():
	var nuevoProyectil = proyectil.instance()
	nuevoProyectil.position = position
	get_parent().add_child(nuevoProyectil)


