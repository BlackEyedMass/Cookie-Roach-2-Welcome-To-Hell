extends Node2D

var control

export(PackedScene) var jugador
export(PackedScene) var boss


# Called when the node enters the scene tree for the first time.
func _ready():
	var nuevoJugador = jugador.instance()
	nuevoJugador.modoDios = true
	add_child(nuevoJugador)
	
	var nuevoBoss = boss.instance()
	nuevoBoss.position = Vector2(600,180)
	add_child(nuevoBoss)
	
	control = get_parent().get_node("./..")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_BossFinal_derrotado():
	var timerCambio = Timer.new()
	timerCambio.autostart = true
	timerCambio.wait_time = 3
	timerCambio.connect("timeout",self,"_on_timerCambio_timeout")
	call_deferred("add_child",timerCambio)

func _on_timerCambio_timeout():
	control.cambiarNivel(10)
