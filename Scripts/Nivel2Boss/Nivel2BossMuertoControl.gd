extends Node2D

signal derrotado

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var controlador = find_parent("Control")
# warning-ignore:return_value_discarded
	connect("derrotado",controlador,"_on_jefeNivel2_derrotado")
	
	var controladorNivel2 = find_parent("Nivel2")
# warning-ignore:return_value_discarded
	connect("derrotado",controladorNivel2,"_on_jefeNivel2_derrotado")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "anim_nivel_2_jefe_muerte":
		$AnimationPlayer.play("anim_nivel_2_jefe_muerte_idle")
		remove_from_group("enemigos")
		emit_signal("derrotado")
