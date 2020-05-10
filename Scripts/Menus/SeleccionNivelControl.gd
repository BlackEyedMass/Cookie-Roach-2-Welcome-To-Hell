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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_BotonNivel1_pressed():
	var control = find_parent("Control")
	control.cambiarNivel(4)

func _on_BotonNivel2_pressed():
	var control = find_parent("Control")
	control.cambiarNivel(5)
