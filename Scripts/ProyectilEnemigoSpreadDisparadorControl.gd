extends Node2D

export(PackedScene) var proyectil

var posicionA
var posicionB
var posicionC

var repeticiones

var anguloInicial
var anguloFinal

func _ready():
	start(-225,-135,12)

func start(ani,anf,reps):
	
	rotation_degrees = ani
	
	while rotation_degrees < anf:
		posicionA = global_position
		posicionB = $Position2D.global_position
	
		posicionC = (posicionB - posicionA).normalized()
		print(posicionC)
		
		var nuevoProyectil = proyectil.instance()
		nuevoProyectil.start(posicionC.x,posicionC.y)
		add_child(nuevoProyectil)
		
		rotation_degrees += reps


