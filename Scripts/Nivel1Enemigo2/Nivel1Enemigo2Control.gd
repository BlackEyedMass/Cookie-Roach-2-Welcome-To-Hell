extends "res://Scripts/Enemigo.gd"

export(PackedScene) var cadaver

signal muerto

func _ready():
	salud = 3
	
	var creadorEnemigos = get_parent().find_node("Nivel1CreadorEnemigos")
	
	connect("muerto",creadorEnemigos,"_on_enemigo2_muerto")

func _exit_tree():
	emit_signal("muerto")
	
	var nuevoCadaver = cadaver.instance()
	nuevoCadaver.generar(2)
	nuevoCadaver.position = position
	get_parent().call_deferred("add_child",nuevoCadaver)

func _on_Nivel1Enemigo2_area_entered(area):
	if area.is_in_group("bosses"):
		morir(false)
