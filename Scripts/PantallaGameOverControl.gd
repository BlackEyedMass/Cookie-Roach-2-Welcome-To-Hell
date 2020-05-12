extends Control

#Variable que guarda al padre de este nodo
var controlador

signal iniciar_secuencia_final

# Called when the node enters the scene tree for the first time.
func _ready():
	controlador = get_parent()
	
	connect("iniciar_secuencia_final",controlador,"_on_iniciar_secuencia_final")
	
	if !controlador.nivelActualEscena.is_in_group("jugable"):
		call_deferred('free')
	elif controlador.secuenciaFinalActivada:
		call_deferred('free')
		emit_signal("iniciar_secuencia_final")
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


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
