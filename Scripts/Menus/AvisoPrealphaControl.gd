extends Node2D

export(PackedScene) var proyectil
export(PackedScene) var logoDestruido

func _on_AnimationPlayer_animation_finished(_anim_name):
	if _anim_name == "anim_splash_screen_1":
		var nuevoProyectil = proyectil.instance()
		nuevoProyectil.position = Vector2(-20,180)
		add_child(nuevoProyectil)
	elif _anim_name == "anim_splash_screen_2":
		$AnimationPlayer.play("anim_splash_screen_3")
	elif _anim_name == "anim_splash_screen_3":
		var control = find_parent("Control")
		control.cambiarNivel(1)

func _on_LogoJuliansoft_area_entered(area):
	$LogoJuliansoft.queue_free()
	
	var nuevoLogo = logoDestruido.instance()
	nuevoLogo.position = Vector2(320,180)
	call_deferred("add_child",nuevoLogo)
	
	$Label.visible = false
	$Timer.start()

func _on_Timer_timeout():
	var logoAnterior = find_node("LogoJuliansoftDestruido")
	if logoAnterior != null:
		logoAnterior.queue_free()
	
	$AnimationPlayer.play("anim_splash_screen_2")
