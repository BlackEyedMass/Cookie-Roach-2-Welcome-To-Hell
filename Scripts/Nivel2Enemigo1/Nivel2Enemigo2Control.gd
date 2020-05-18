extends "res://Scripts/Enemigo.gd"


var jugador

var atacando = false

var velocidadHorizontal
var velocidadVertical

var limiteSuperior = 50
var limiteInferior = 310

export(PackedScene) var cuerpo

# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 4
	velocidadHorizontal = 1
	velocidadVertical = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		$Rotables.look_at(instanciaJugador.global_position)
		$Rotables.rotation_degrees = $Rotables.rotation_degrees + 180
		
		var distanciaAJugador = instanciaJugador.global_position - global_position
		
		if distanciaAJugador.length() <= 150 and !atacando:
			atacando = true
			ataque()
	
	position.x -= velocidadHorizontal
	
	if (position.y > limiteInferior || position.y < limiteSuperior):
		velocidadVertical *= -1
	
	position.y += velocidadVertical

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
	get_parent().call_deferred("add_child",nuevoCuerpo)
