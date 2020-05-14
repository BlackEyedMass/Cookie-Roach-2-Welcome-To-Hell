extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	var control = find_parent("Control")
	
	if control.nivel1Superado:
		$BotonNivel1.disabled = true
	
	if control.nivel2Superado:
		$BotonNivel2.disabled = true
	
	if control.nivel3Superado:
		$BotonNivel3.disabled = true
	
	if $BotonNivel1.disabled and $BotonNivel2.disabled and $BotonNivel3.disabled:
		$BotonNivel4.disabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_BotonNivel1_pressed():
	var control = find_parent("Control")
	Global.cambiarNivelSeleccionado(1)
	control.cambiarNivel(11)


func _on_BotonNivel2_pressed():
	var control = find_parent("Control")
	Global.cambiarNivelSeleccionado(2)
	control.cambiarNivel(11)


func _on_BotonNivel3_pressed():
	var control = find_parent("Control")
	Global.cambiarNivelSeleccionado(3)
	control.cambiarNivel(11)


func _on_BotonNivel4_pressed():
	var control = find_parent("Control")
	control.cambiarNivel(7)
