extends Node2D

var activo = true

export(PackedScene) var enemigo1
export(PackedScene) var enemigo2
export(PackedScene) var enemigo3

var limiteSuperior = 50
var limiteInferior = 310

var cantidadEnemigos2

var tiempoTimer

var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	actualizarTimer()
	
	timer = Timer.new()
	timer.autostart = true
	timer.one_shot = true
	timer.wait_time = tiempoTimer
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)
	
	cantidadEnemigos2 = 0

func _on_timer_timeout():
	
	if !activo:
		return
	
	var numeroAleatorio = rand_range(0,10)
	
	if (numeroAleatorio > 1.0 and numeroAleatorio < 5.0):
		var instanciaEnemigo1 = enemigo1.instance()
		get_parent().add_child(instanciaEnemigo1)
		instanciaEnemigo1.position = Vector2(650,rand_range(limiteSuperior,limiteInferior))
	elif (numeroAleatorio > 5.0 and numeroAleatorio < 8.0):
		if cantidadEnemigos2 > 2:
			return
		var instanciaEnemigo2 = enemigo2.instance()
		get_parent().add_child(instanciaEnemigo2)
		instanciaEnemigo2.position = Vector2(650,rand_range(limiteSuperior,limiteInferior))
		
		cantidadEnemigos2 += 1
	elif (numeroAleatorio > 8.0):
		var instanciaEnemigo3 = enemigo3.instance()
		get_parent().add_child(instanciaEnemigo3)
		instanciaEnemigo3.position = Vector2(650,rand_range(limiteSuperior,limiteInferior))
	
	actualizarTimer()
	timer.start()

func _on_enemigo2_muerto():
	cantidadEnemigos2 -= 1

func actualizarTimer():
	tiempoTimer = rand_range(2,3)
