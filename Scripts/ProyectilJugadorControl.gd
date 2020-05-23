extends Area2D

var velocidad
var damage

export(PackedScene)var explosion

func start(pos,vel,dmg):
	position = pos
	velocidad = vel
	damage = dmg

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.x += velocidad
	rotate(0.1)
	
	if (global_position.x > 700):
		destruir()


func destruir():
	var nuevaExplosion = explosion.instance()
	nuevaExplosion.position = position
	get_parent().call_deferred("add_child",nuevaExplosion)
	
	queue_free()
	



func _on_ProyectilJugador_area_entered(area):
	if area.is_in_group("enemigos"):
		area.perderSalud(damage)
		destruir()
