extends Area2D

var velocidad = 0

func _process(delta):
	position.x -= velocidad
	
	if get_parent().is_in_group("enemigos"):
		return
	else:
		$ParticulaSangre.emitting = true
		velocidad = 1
