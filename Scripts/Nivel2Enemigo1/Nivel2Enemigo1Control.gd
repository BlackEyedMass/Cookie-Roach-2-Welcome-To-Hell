extends "res://Scripts/Enemigo.gd"


var jugador

var atacando = false

var velocidad

export(PackedScene)var cuerpo

# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 4
	velocidad = 1
	
	$Nivel2Enemigo1Cuerpo.rotation_degrees = rand_range(0.0,360.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		$Rotable.look_at(instanciaJugador.global_position)
		$Rotable.rotation_degrees = $Rotable.rotation_degrees + 180
		
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

func _exit_tree():
	var nuevoCuerpo = cuerpo.instance()
	nuevoCuerpo.position = position
	nuevoCuerpo.rotation_degrees = $Nivel2Enemigo1Cuerpo.rotation_degrees
	get_parent().call_deferred("add_child",nuevoCuerpo)
