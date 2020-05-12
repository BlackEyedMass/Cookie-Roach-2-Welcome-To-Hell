extends "res://Scripts/Enemigo.gd"

export(PackedScene) var proyectil

# Called when the node enters the scene tree for the first time.
func _ready():
	salud = 2
	
	var timerDisparos = Timer.new()
	timerDisparos.autostart = true
	timerDisparos.wait_time = 2
	timerDisparos.connect("timeout",self,"_on_timerDisparos_timeout")
	add_child(timerDisparos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 1

func _on_timerDisparos_timeout():
	var nuevoProyectil = proyectil.instance()
	nuevoProyectil.position = position
	get_parent().add_child(nuevoProyectil)
