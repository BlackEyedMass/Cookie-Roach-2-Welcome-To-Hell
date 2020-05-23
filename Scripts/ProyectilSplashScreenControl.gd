extends Area2D

export(PackedScene) var particulas

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += 5
	rotate(0.1)


func _on_ProyectilSplashScreen_area_entered(area):
	call_deferred("queue_free")

func _exit_tree():
	var nuevasParticulas = particulas.instance()
	nuevasParticulas.position = position
	get_parent().add_child(nuevasParticulas)
