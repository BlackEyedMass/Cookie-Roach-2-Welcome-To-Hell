extends Area2D

export(PackedScene) var proyectil
export(PackedScene) var jugadorMuerto

#Variables Movimiento
var posicionMouse = Vector2()
var posicionRelativaMouse = Vector2()
var movimiento = Vector2()

var puedeDisparar = false
var invencible = false

var modoDios = false

export(int) var escudos
export(float) var velocidadDisparo
export(float) var cadenciaDisparo
export(float) var damage

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("anim_jugador_normal")
	
	$VisualizadorEscudos.crear(escudos)
	$TiempoEntreDisparos.start(cadenciaDisparo)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if modoDios:
		movimiento = Vector2(0,360)

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _input(event):
	
	#Convierte la posicion relativa del mouse en coordenadas que el personaje puede usar
	if event is InputEventMouseMotion:
		posicionRelativaMouse = event.relative
		posicionMouse += posicionRelativaMouse

func _process(_delta):
	
	if modoDios:
		escudos = 3
		damage = 5
		cadenciaDisparo = 0.1
		velocidadDisparo = 20
	
	#Limita el area de juego y mueve al jugador
	posicionMouse.x = clamp(posicionMouse.x,50,580)
	posicionMouse.y = clamp(posicionMouse.y,50,310)
	movimiento += (posicionMouse - position) * 0.1
	
	position = movimiento
	
	#Controla los disparos del jugador
	if (Input.is_mouse_button_pressed(BUTTON_LEFT) and puedeDisparar):
		var instanciaProyectil = proyectil.instance()
		get_parent().add_child(instanciaProyectil)
		instanciaProyectil.start(position,velocidadDisparo,damage)
		puedeDisparar = false
		
		$AnimationPlayer.play("anim_jugador_disparando")
		
		$TiempoEntreDisparos.start(cadenciaDisparo)

func _on_TiempoEntreDisparos_timeout():
	puedeDisparar = true
	
	$AnimationPlayer.play("anim_jugador_normal")

#Controla las colisiones
func _on_Jugador_area_entered(area):
	if area.is_in_group("enemigos") and !invencible:
		if escudos > 0:
			$SonidoPerderVida.play()
			
			escudos -= 1
			
			$VisualizadorEscudos.crear(escudos)
			
			#Hace al personaje invencible y cambia su color para simbolizarlo
			invencible = true
			$Sprite.modulate = Color(1,1,1,0.5)
			$TiempoInvencibilidad.start()
			
		elif escudos <= 0:
			call_deferred('free')

func nuevoPowerUp(tipo):
	match tipo:
		0:
			if escudos < 3:
				escudos += 1
		1:
			if velocidadDisparo < 10:
				velocidadDisparo += 0.5
		2:
			if cadenciaDisparo > 0.2:
				cadenciaDisparo -= 0.1
		3:
			if damage < 5:
				damage += 1

#Esta función se encarga de terminar la invencibilidad temporal del jugador
func _on_TiempoInvencibilidad_timeout():
	invencible = false
	$Sprite.modulate = Color(1,1,1,1)

func _exit_tree():
	find_parent("Control").terminarJuego()
	
	var muerto = jugadorMuerto.instance()
	muerto.position = position
	get_parent().call_deferred("add_child",muerto)
