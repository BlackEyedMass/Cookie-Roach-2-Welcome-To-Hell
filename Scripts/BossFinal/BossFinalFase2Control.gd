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
func _process(delta):
	$ParallaxBackground/Capa1.position.x -= 0.20
	if $ParallaxBackground/Capa1.position.x <= -1280:
		$ParallaxBackground/Capa1.position.x = 0
	
	$ParallaxBackground/Capa2.position.x -= 0.30
	if $ParallaxBackground/Capa2.position.x <= -1280:
		$ParallaxBackground/Capa2.position.x = 0

func on_BossFinal_derrotado():
	$AnimationPlayer.play("anim_desvanecer_a_blanco")

func _on_AnimationPlayer_animation_finished(anim_name):
	
	control.cambiarNivel(10)
