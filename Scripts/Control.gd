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
	"Nivel3" #6
]

#Variable que guarda el número en la lista del nivel actual
var nivelActual

var nivel1Superado = false
var nivel2Superado = false

func _ready():
	randomize()
	#Al iniciar el juego carga el primer nivel en la lista
	cambiarNivel(6)

func _input(event):
	#(DEBUG) Botón que libera el mouse automáticamente
	if event.is_action_pressed("ui_end"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

#Función encargada de instanciar la pantalla de Game Over cuando el juego termina
func terminarJuego():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var nuevaPantallaGameOver = pantallaGameOver.instance()
	add_child(nuevaPantallaGameOver)

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
	

func _on_jefeNivel1_derrotado():
	nivel1Superado = true

func _on_jefeNivel2_derrotado():
	nivel2Superado = true
