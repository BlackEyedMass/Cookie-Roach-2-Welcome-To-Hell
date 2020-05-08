extends "res://Scripts/Enemigo.gd"


var jugador

var atacando = false

var velocidad

# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 4
	velocidad = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		look_at(instanciaJugador.global_position)
		rotation_degrees = rotation_degrees + 180
		
		var distanciaAJugador = instanciaJugador.global_position - global_position
		
		if distanciaAJugador.length() <= 150 and !atacando:
			atacando = true
			ataque()
	position.x -= velocidad

func ataque():
	$TiempoEntreAtaques.start(1)
	$AnimacionAtaque.play("anim_lengua_ataque_1")


func _on_TiempoEntreAtaques_timeout():
	atacando = false

func _on_Lengua_lengua_destruida():
	morir(false)
