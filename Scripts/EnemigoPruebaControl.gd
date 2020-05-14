extends "res://Scripts/Enemigo.gd"

export(PackedScene) var cadaver

export(int) var velocidad


# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.x -= velocidad


func _on_EnemigoPrueba_area_entered(area):
	if area.is_in_group("bosses"):
		morir(false)

func _exit_tree():
	var nuevoCadaver = cadaver.instance()
	nuevoCadaver.generar(1)
	nuevoCadaver.position = position
	get_parent().call_deferred("add_child",nuevoCadaver)
