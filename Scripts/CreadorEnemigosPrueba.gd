extends Node2D

#Carga al enemigo
export(PackedScene) var enemigo

#Los enemigos no podrán aparecer ni más arriba ni más abajo de estos límites
var limiteSuperior = 50
var limiteInferior = 310

#El Timer está corriendo constantemente, esta función se llama cada vez que llega a 0
func _on_Bucle_timeout():
	#Crea un float entre 0.0 y 1.0
	var numeroAleatorio = randf()
	
	#Si el número aleatorio es mayor que 0.5 (50%), se crea un nuevo enemigo en una posición vertical aleatoria
	if (numeroAleatorio > 0.5):
		var nuevoEnemigo = enemigo.instance()
		get_parent().add_child(nuevoEnemigo)
		nuevoEnemigo.position = Vector2(650,rand_range(limiteSuperior,limiteInferior))
