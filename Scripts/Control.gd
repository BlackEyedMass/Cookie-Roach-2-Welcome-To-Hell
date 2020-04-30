extends Node

#Carga la pantalla de Game Over
export(PackedScene) var pantallaGameOver

#Array con todos los niveles del juego
var listaNiveles = [ 
	"TestWorld"
]

#Variable que guarda el número en la lista del nivel actual
var nivelActual

func _ready():
	randomize()
	#Al iniciar el juego carga el primer nivel en la lista
	cambiarNivel(0)

func _input(event):
	#(DEBUG) Botón que libera el mouse automáticamente
	if event.is_action_pressed("ui_end"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

#Función encargada de instanciar la pantalla de Game Over cuando el juego termina
func terminarJuego():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var nuevaPantallaGameOver = pantallaGameOver.instance()
	add_child(nuevaPantallaGameOver)

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
	

