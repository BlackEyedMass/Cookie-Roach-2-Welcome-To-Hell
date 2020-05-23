extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var siguienteNivel

var control

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	control = find_parent("Control")
	
	if control.nivel1Superado:
		$BotonNivel1.disabled = true
	
	if control.nivel2Superado:
		$BotonNivel2.disabled = true
	
	if control.nivel3Superado:
		$BotonNivel3.disabled = true
	
	if $BotonNivel1.disabled and $BotonNivel2.disabled and $BotonNivel3.disabled:
		$BotonNivel4.disabled = false

func reproducirAnimacion():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$AnimationPlayer.play("anim_nivel_seleccionado")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "anim_nivel_seleccionado":
		control.cambiarNivel(siguienteNivel)
	else:
		return


func _on_BotonNivel1_button_down():
	Global.cambiarNivelSeleccionado(1)
	siguienteNivel = 11
	reproducirAnimacion()


func _on_BotonNivel2_button_down():
	Global.cambiarNivelSeleccionado(2)
	siguienteNivel = 11
	reproducirAnimacion()


func _on_BotonNivel3_button_down():
	Global.cambiarNivelSeleccionado(3)
	siguienteNivel = 11
	reproducirAnimacion()


func _on_BotonNivel4_button_down():
	var control = find_parent("Control")
	siguienteNivel = 7
	reproducirAnimacion()

