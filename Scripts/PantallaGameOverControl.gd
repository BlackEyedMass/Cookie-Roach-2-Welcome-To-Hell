extends Control

#Variable que guarda al padre de este nodo
var controlador

signal iniciar_secuencia_final

var enabled

var frases = [ 
	"Fin del juego",
	"Tan matao",
	"You died",
	"Wasted",
	"F",
	"Git gud",
	"Compráte manos, manco de mierda"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	enabled = false
	
	$AnimationPlayer.play("anim_pantalla_gameover")
	
	controlador = get_parent()
	
	connect("iniciar_secuencia_final",controlador,"_on_iniciar_secuencia_final")
	
	if !controlador.nivelActualEscena.is_in_group("jugable"):
		call_deferred('free')
	elif controlador.secuenciaFinalActivada:
		call_deferred('free')
		emit_signal("iniciar_secuencia_final")
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	var fraseAleatoria = randi() % frases.size() - 1
	$Mensaje.bbcode_text = "[center]" + frases[fraseAleatoria] + "[/center]"

func _on_Reintentar_pressed():
	var nivelActual = controlador.nivelActual
	controlador.cambiarNivel(nivelActual)
	queue_free()

func _on_SeleccionarNivel_pressed():
	controlador.cambiarNivel(2)
	queue_free()
