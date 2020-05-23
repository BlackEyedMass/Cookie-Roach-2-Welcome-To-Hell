extends "res://Scripts/Enemigo.gd"


export(PackedScene)var cuerpo


# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _exit_tree():
	var nuevoCuerpo = cuerpo.instance()
	nuevoCuerpo.position = position
	get_parent().call_deferred("add_child",nuevoCuerpo)
