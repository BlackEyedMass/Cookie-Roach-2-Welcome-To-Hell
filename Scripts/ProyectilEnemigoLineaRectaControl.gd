extends "res://Scripts/Enemigo.gd"

var velocidad

func _ready():
	salud = 1

func start(pos,vel):
	position = pos
	velocidad = vel

func _process(_delta):
	if velocidad == null:
		destruir()
	else:
		position.x -= velocidad
		rotate(-0.1)
	
	if (global_position.x < -20):
		destruir()

func destruir():
	queue_free()

func _on_ProyectilEnemigoLineaRecta_area_entered(area):
	if area.is_in_group("jugador"):
		destruir()
