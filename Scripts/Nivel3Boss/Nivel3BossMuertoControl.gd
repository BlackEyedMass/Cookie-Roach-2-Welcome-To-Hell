extends Node2D

signal derrotado

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var controlador = find_parent("Control")
# warning-ignore:return_value_discarded
	connect("derrotado",controlador,"_on_jefeNivel3_derrotado")
	
	var controladorNivel3 = find_parent("Nivel3")
# warning-ignore:return_value_discarded
	connect("derrotado",controladorNivel3,"_on_jefeNivel3_derrotado")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _exit_tree():
	emit_signal("derrotado")
