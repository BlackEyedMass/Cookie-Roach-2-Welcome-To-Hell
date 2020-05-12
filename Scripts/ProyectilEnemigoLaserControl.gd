extends "res://Scripts/Enemigo.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("anim_laser")
	
	salud = 99

func _process(delta):
	var padre = get_parent().fsm.padre
	
	position = padre.position
