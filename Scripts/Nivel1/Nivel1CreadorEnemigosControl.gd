extends Node2D

var activo = true

export(PackedScene) var enemigo1
export(PackedScene) var enemigo2
export(PackedScene) var enemigo3

var limiteSuperior = 50
var limiteInferior = 310

var cantidadEnemigos2

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = rand_range(2,5)
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)
	
	cantidadEnemigos2 = 0

func _on_timer_timeout():
	
	if !activo:
		return
	
	var numeroAleatorio = rand_range(0,10)
	
	if (numeroAleatorio > 1.0 and numeroAleatorio < 6.0):
		var instanciaEnemigo1 = enemigo1.instance()
		get_parent().add_child(instanciaEnemigo1)
		instanciaEnemigo1.position = Vector2(650,rand_range(limiteSuperior,limiteInferior))
	elif (numeroAleatorio > 6.0 and numeroAleatorio < 9.0):
		if cantidadEnemigos2 > 2:
			return
		
		var instanciaEnemigo2 = enemigo2.instance()
		get_parent().add_child(instanciaEnemigo2)
		instanciaEnemigo2.position = Vector2(650,rand_range(limiteSuperior,limiteInferior))
		
		cantidadEnemigos2 += 1
	elif (numeroAleatorio > 9.0):
		var instanciaEnemigo3 = enemigo3.instance()
		get_parent().add_child(instanciaEnemigo3)
		instanciaEnemigo3.position = Vector2(650,rand_range(limiteSuperior,limiteInferior))

func _on_enemigo2_muerto():
	cantidadEnemigos2 -= 1
