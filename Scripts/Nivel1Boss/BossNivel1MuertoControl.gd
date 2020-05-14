extends Node2D

signal derrotado

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var controlador = find_parent("Control")
# warning-ignore:return_value_discarded
	connect("derrotado",controlador,"_on_jefeNivel1_derrotado")
	
	var controladorNivel1 = find_parent("Nivel1")
# warning-ignore:return_value_discarded
	connect("derrotado",controladorNivel1,"_on_jefeNivel1_derrotado")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _exit_tree():
	emit_signal("derrotado")
