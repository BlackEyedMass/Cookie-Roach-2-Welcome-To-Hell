extends Area2D


var jugador

var atacando = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		$Cabeza.look_at(instanciaJugador.global_position)
		$Cabeza.rotation_degrees = $Cabeza.rotation_degrees + 180
		
		var distanciaAJugador = instanciaJugador.global_position - global_position
		
		if distanciaAJugador.length() <= 150 and !atacando:
			atacando = true
			ataque()
	

func ataque():
	$AnimacionAtaque.play("anim_lengua_ataque_1")

func _on_AnimacionAtaque_animation_finished(anim_name):
	if anim_name == "anim_lengua_ataque_1":
		atacando = false
