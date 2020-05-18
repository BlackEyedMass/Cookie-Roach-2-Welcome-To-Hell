extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if get_parent().is_in_group("enemigos"):
		return
	else:
		$ParticulaSangre.emitting = true
