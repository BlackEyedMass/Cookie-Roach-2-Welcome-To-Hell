extends "res://Scripts/Enemigo.gd"

var jugador

var atacando = false

var velocidad

export(PackedScene)var proyectil
export(PackedScene)var cuerpo

# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 4
	velocidad = 1.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
		$TiempoEntreAtaques.stop()
	else:
		var instanciaJugador = jugador[0]
		$Arma.look_at(instanciaJugador.global_position)
		$Arma.rotation_degrees = $Arma.rotation_degrees + 180
		
	position.x -= velocidad

func _on_TiempoEntreAtaques_timeout():
	var nuevoProyectil = proyectil.instance()
	nuevoProyectil.position = position
	get_parent().add_child(nuevoProyectil)
	
	$SonidoDisparo.play()

func _exit_tree():
	var nuevoCuerpo = cuerpo.instance()
	nuevoCuerpo.position = position
	get_parent().call_deferred("add_child",nuevoCuerpo)
