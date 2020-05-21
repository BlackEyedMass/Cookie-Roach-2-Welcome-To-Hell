extends Node

var fsm: StateMachine

var nuevaPosicion = Vector2.ZERO
var movimiento = Vector2.ZERO
var multiplicador = 20

export(PackedScene) var proyectil

func enter():
	fsm.padre.get_node("AnimationPlayer").play("anim_nivel_3_jefe_attack_1")
	
	var nuevoProyectil = proyectil.instance()
	nuevoProyectil.position = fsm.padre.position
	fsm.padre.get_parent().add_child(nuevoProyectil)
	
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = rand_range(0.75,1.25)
	timer.connect("timeout",self,"_on_timer_timeout")
	
	add_child(timer)
	nuevaPosicion.y = rand_range(-1,1)
	
	movimiento = nuevaPosicion * multiplicador

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
	var jugador = (get_tree().get_nodes_in_group("jugador"))
	if jugador.size() == 0:
		return
	else:
		var instanciaJugador = jugador[0]
		fsm.padre.look_at(instanciaJugador.global_position)
		fsm.padre.rotation_degrees = fsm.padre.rotation_degrees + 180
	
	if (fsm.padre.position.y == 310 || fsm.padre.position.y == 50):
		movimiento.y *= -1
	
	fsm.padre.position += movimiento.normalized() * 3
	
	fsm.padre.position.y = clamp(fsm.padre.position.y,50,310)

func _on_timer_timeout():
	
	var numeroAleatorio = randf()
	if numeroAleatorio < 0.3:
		exit("Attack2Setup")
	elif numeroAleatorio > 0.3 and numeroAleatorio < 0.5:
		exit("Attack3Setup")
	else:
		exit("Attack1Idle")
