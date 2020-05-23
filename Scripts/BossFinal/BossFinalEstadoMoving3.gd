extends Node

var fsm: StateMachine

var nuevaPosicion = Vector2.ZERO
var movimiento = Vector2.ZERO
var multiplicador = 20

export(PackedScene) var proyectil

func enter():
	fsm.padre.get_node("AnimationPlayer").play("anim_nivel_4_jefe_disparando_1")
	
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = rand_range(0.25,0.75)
	timer.connect("timeout",self,"_on_timer_timeout")
	
	var timerDisparos = Timer.new()
	timerDisparos.autostart = true
	timerDisparos.wait_time = 0.5
	timerDisparos.connect("timeout",self,"_on_timerDisparos_timeout")
	add_child(timerDisparos)
	
	add_child(timer)
	nuevaPosicion.y = rand_range(-1,1)
	
	movimiento = nuevaPosicion * multiplicador
	
	_disparar()

func exit(next_state):
	var contadores = get_child_count()
	
	if contadores > 0:
		for n in get_children():
			remove_child(n)
			n.call_deferred('free')
	
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	if (fsm.padre.position.y == 310 || fsm.padre.position.y == 50):
		movimiento.y *= -1
	
	fsm.padre.position += movimiento.normalized() * 3
	
	fsm.padre.position.y = clamp(fsm.padre.position.y,50,310)
	
func _on_timer_timeout():
	var numeroAleatorio = randi() % 3      # Returns random integer between 0 and 2
	match numeroAleatorio:
		0:
			exit("Moving1")
		1:
			exit("Moving3Idle")
		2:
			exit("Moving2")

func _on_timerDisparos_timeout():
	_disparar()

func _disparar():
	var nuevoProyectil = proyectil.instance()
	nuevoProyectil.position = fsm.padre.position
	fsm.padre.get_parent().add_child(nuevoProyectil)
	
	fsm.padre.get_node("SonidoLaser1").play()
