extends Node2D

export(PackedScene) var proyectil

var posicionA
var posicionB
var posicionC

var repeticiones

var anguloInicial
var anguloFinal

func _ready():
	#start(-255,-125,9,560,180)
	pass

func start(ani,anf,reps,posx,posy):
	
	position = Vector2(posx,posy)
	
	rotation_degrees = ani
	
	while rotation_degrees < anf:
		posicionA = global_position
		posicionB = $Position2D.global_position
	
		posicionC = (posicionB - posicionA).normalized()
		
		var nuevoProyectil = proyectil.instance()
		nuevoProyectil.start(posicionC.x,posicionC.y)
		add_child(nuevoProyectil)
		
		rotation_degrees += reps
	
	#call_deferred('free')


