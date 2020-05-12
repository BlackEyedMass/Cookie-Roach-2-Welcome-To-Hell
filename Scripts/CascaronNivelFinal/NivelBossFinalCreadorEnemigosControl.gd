extends Node2D

var activo = true

export(PackedScene) var enemigo


var limiteSuperior = 50
var limiteInferior = 310

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 3
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)

func _on_timer_timeout():
	
	if !activo:
		return
	
	var nuevoEnemigo = enemigo.instance()
	get_parent().add_child(nuevoEnemigo)
	nuevoEnemigo.position = Vector2(650,rand_range(limiteSuperior,limiteInferior))
