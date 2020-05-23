extends Node

#Carga la pantalla de Game Over
export(PackedScene) var pantallaGameOver
export(PackedScene) var bossAdvertencia

#Array con todos los niveles del juego
var listaNiveles = [
	"SplashScreen",#0
	"PantallaTitulo",#1
	"SeleccionNivel",#2
	"TestWorld",#3
	"Nivel1",#4
	"Nivel2", #5
	"Nivel3", #6
	"NivelBossFinal", #7
	"BossFinalCinematica", #8
	"BossFinalFase2", #9
	"PantallaFinal", #10
	"IntroNivel" #11
]

#Variable que guarda el número en la lista del nivel actual
var nivelActual
var nivelActualEscena

var nivel1Superado = false
var nivel2Superado = false
var nivel3Superado = false

var numeroMuertesNivelFinal

var secuenciaFinalActivada = false

func _ready():
	numeroMuertesNivelFinal = 0
	
	OS.window_fullscreen = true
	randomize()
	#Al iniciar el juego carga el primer nivel en la lista
	cambiarNivel(0)

func _input(event):
	
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	
#	#(DEBUG) Botón que libera el mouse automáticamente
#	if event.is_action_pressed("ui_end"):
#		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
#
#	if event.is_action_pressed("ui_cancel"):
#		cambiarNivel(2)

#Función encargada de instanciar la pantalla de Game Over cuando el juego termina
func terminarJuego():
	var nuevaPantallaGameOver = pantallaGameOver.instance()
	call_deferred('add_child',nuevaPantallaGameOver)

# warning-ignore:function_conflicts_variable
func advertenciaBoss():
	var nuevaAdvertencia = bossAdvertencia.instance()
	add_child(nuevaAdvertencia)

#Función encargada de cambiar el nivel actual
func cambiarNivel(nivel):
	
	#Cambia el nivel actual por el nivel recibido
	nivelActual = nivel
	
	#Borrar nivel anterior
	var nivelesCargados = $Nivel.get_child_count()
	
	#Este bucle elimina todos los hijos del nodo Nivel
	if nivelesCargados > 0:
		for n in $Nivel.get_children():
			$Nivel.remove_child(n)
			n.call_deferred('free')
	
	#Cargar nuevo nivel
	var rutaNuevoNivel = "res://Rooms/" + listaNiveles[nivel] + ".tscn"
	var nuevoNivel = load(rutaNuevoNivel)
	var instanciaNuevoNivel = nuevoNivel.instance()
	$Nivel.add_child(instanciaNuevoNivel)
	
	nivelActualEscena = instanciaNuevoNivel

func _on_jefeNivel1_derrotado():
	nivel1Superado = true

func _on_jefeNivel2_derrotado():
	nivel2Superado = true

func _on_jefeNivel3_derrotado():
	nivel3Superado = true

func on_BossFinal_jugador_derrotado():
	numeroMuertesNivelFinal += 1
	
	if numeroMuertesNivelFinal >= 1:
		secuenciaFinalActivada = true

func _on_iniciar_secuencia_final():
	var timerCambio = Timer.new()
	timerCambio.autostart = true
	timerCambio.one_shot = true
	timerCambio.wait_time = 5
	timerCambio.connect("timeout",self,"_on_timerCambio_timeout")
	add_child(timerCambio)
	$KnowYourPlace.play()

func _on_timerCambio_timeout():
	cambiarNivel(8)

func on_BossFinal_derrotado():
	cambiarNivel(10)

