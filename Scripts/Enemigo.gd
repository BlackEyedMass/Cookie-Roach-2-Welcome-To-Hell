extends Area2D

#Variable salud que todos los enemigos del juego comparten

var salud

export(PackedScene) var powerUp

var puedeDropear = false

func _ready():
	add_to_group("enemigos",true)
	if powerUp != null:
		puedeDropear = true

func _process(_delta):
	
	#Cuando los enemigos salen del borde izquierdo de la pantalla se destruyen automaticamente
	if position.x < -100:
		morir(true)

#Esta funcion se encarga de reducir la salud si se recibe daño, y destruir al enemigo si llega a 0
func perderSalud(dmg):
	if position.x > 640:
		return
	salud -= dmg
	if (salud <= 0):
		morir(false)

#Esta funcion se encarga de destruir al enemigo, justdestroy se usará luego para añadir ordenes extra a la muerte
func morir(justdestroy):
	if justdestroy:
		call_deferred('free')
	else:
		if puedeDropear:
			var nuevoPowerUp = powerUp.instance()
			nuevoPowerUp.position = position
			get_parent().call_deferred('add_child',nuevoPowerUp)
				
		call_deferred('free')
