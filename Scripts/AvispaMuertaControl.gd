extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Cuerpo.apply_central_impulse(Vector2(rand_range(-75,75),0))
	$Cuerpo.angular_velocity = rand_range(-20,20)
	
	$Explosion1.emitting = true

func generar(spr):
	match spr:
		0:
			$Cuerpo/Sprites/N1E1.visible = true
		1:
			$Cuerpo/Sprites/N1E2.visible = true
		2:
			$Cuerpo/Sprites/N1E3.visible = true

func _on_Timer_timeout():
	call_deferred("free")
