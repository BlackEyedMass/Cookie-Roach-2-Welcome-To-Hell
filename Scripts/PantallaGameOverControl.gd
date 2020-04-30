extends Control

#Variable que guarda al padre de este nodo
var controlador

# Called when the node enters the scene tree for the first time.
func _ready():
	controlador = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#Esta función se encarga de liberar el mouse y reiniciar el nivel si se hace click
func _input(event):
	if event is InputEventMouseButton:
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			var nivelActual = controlador.nivelActual
			controlador.cambiarNivel(nivelActual)
			queue_free()
