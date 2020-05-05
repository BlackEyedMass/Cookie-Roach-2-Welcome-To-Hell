extends "res://Scripts/Enemigo.gd"

signal muerto

func _ready():
	salud = 3
	
	var creadorEnemigos = get_parent().find_node("Nivel1CreadorEnemigos")
	
	connect("muerto",creadorEnemigos,"_on_enemigo2_muerto")

func _exit_tree():
	emit_signal("muerto")
	print("RIP")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
