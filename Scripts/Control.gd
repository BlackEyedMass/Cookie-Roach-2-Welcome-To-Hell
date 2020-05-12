extends Node

#Carga la pantalla de Game Over
export(PackedScene) var pantallaGameOver
export(PackedScene) var advertenciaBoss

#Array con todos los niveles del juego
var listaNiveles = [
	"AvisoPrealpha",#0
	"PantallaTitulo",#1
	"SeleccionNivel",#2
	"TestWorld",#3
	"Nivel1",#4
	"Nivel2", #5
	"Nivel3", #6
	"NivelBossFinal", #7
	"BossFinalCinematica", #8
	"BossFinalFase2", #9
	"PantallaFinal" #10
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
	
	OS.set_window_maximized(true)
	randomize()
	#Al iniciar el juego carga el primer nivel en la lista
	cambiarNivel(7)

func _input(event):
	#(DEBUG) Botón que libera el mouse automáticamente
	if event.is_action_pressed("ui_end"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if event.is_action_pressed("ui_cancel"):
		cambiarNivel(2)

#Función encargada de instanciar la pantalla de Game Over cuando el juego termina
func terminarJuego():
	var nuevaPantallaGameOver = pantallaGameOver.instance()
	call_deferred('add_child',nuevaPantallaGameOver)


func advertenciaBoss():
	var nuevaAdvertencia = advertenciaBoss.instance()
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
	print("Numero de muertes nivel final: ",numeroMuertesNivelFinal)
	
	if numeroMuertesNivelFinal >= 1:
		secuenciaFinalActivada = true

func _on_iniciar_secuencia_final():
	var timerCambio = Timer.new()
	timerCambio.autostart = true
	timerCambio.one_shot = true
	timerCambio.wait_time = 5
	timerCambio.connect("timeout",self,"_on_timerCambio_timeout")
	add_child(timerCambio)

func _on_timerCambio_timeout():
	cambiarNivel(8)

func on_BossFinal_derrotado():
	cambiarNivel(10)
