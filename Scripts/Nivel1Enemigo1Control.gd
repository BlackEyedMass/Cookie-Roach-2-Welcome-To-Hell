extends "res://Scripts/Enemigo.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Nivel1Enemigo1_area_entered(area):
	if area.is_in_group("bosses"):
		morir(false)
