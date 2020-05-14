extends Node2D

var siguienteNivel
var control

# Called when the node enters the scene tree for the first time.
func _ready():
	control = find_parent("Control")
	iniciar(Global.nivelSeleccionado)
	
	$AnimationPlayer.play("anim_intro_nivel")

func iniciar(nivel):
	
	match nivel:
		1:
			$IconoBoss.frame = 0
			$IconoBossBlanco.frame = 0
			siguienteNivel = 4
			
		2:
			$IconoBoss.frame = 1
			$IconoBossBlanco.frame = 1
			siguienteNivel = 5
			
		3:
			$IconoBoss.frame = 2
			$IconoBossBlanco.frame = 2
			siguienteNivel = 6
			

func _on_AnimationPlayer_animation_finished(_anim_name):
	control.cambiarNivel(siguienteNivel)
