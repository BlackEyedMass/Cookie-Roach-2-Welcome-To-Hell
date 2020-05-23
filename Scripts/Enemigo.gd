extends Area2D

#Variable salud que todos los enemigos del juego comparten

var salud

export(PackedScene) var powerUp

var puedeDropear = false

var sonidoPerderSalud

var timerPerderSalud

func _ready():
	add_to_group("enemigos",true)
	if powerUp != null:
		puedeDropear = true
	
	sonidoPerderSalud = AudioStreamPlayer.new()
	sonidoPerderSalud.stream = preload("res://Sounds/Efectos/sfx_exp_short_hard1.wav")
	sonidoPerderSalud.bus = "Efectos"
	add_child(sonidoPerderSalud)
	
	timerPerderSalud = Timer.new()
	timerPerderSalud.wait_time = 0.10
	timerPerderSalud.one_shot = true
	timerPerderSalud.connect("timeout",self,"_on_timerPerderSalud_timeout")
	add_child(timerPerderSalud)

func _process(_delta):
	
	#Cuando los enemigos salen del borde izquierdo de la pantalla se destruyen automaticamente
	if position.x < -100:
		if is_in_group("bosses"):
			return
		else:
			morir(true)

#Esta funcion se encarga de reducir la salud si se recibe daño, y destruir al enemigo si llega a 0
func perderSalud(dmg):
	if position.x > 640:
		return
	salud -= dmg
	if (salud <= 0):
		morir(false)
	
	visible = false
	sonidoPerderSalud.play()
	timerPerderSalud.start()

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

func _on_timerPerderSalud_timeout():
	visible = true
