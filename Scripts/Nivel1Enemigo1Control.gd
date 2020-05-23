extends "res://Scripts/Enemigo.gd"

export(PackedScene) var cadaver

# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Nivel1Enemigo1_area_entered(area):
	if area.is_in_group("bosses"):
		morir(false)
	
	if area.is_in_group("proyectil_jugador"):
		pass

func _exit_tree():
	var nuevoCadaver = cadaver.instance()
	nuevoCadaver.generar(0)
	nuevoCadaver.position = position
	get_parent().call_deferred("add_child",nuevoCadaver)
