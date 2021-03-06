extends Node2D

var control

export(PackedScene) var boss

# Called when the node enters the scene tree for the first time.
func _ready():
	var timerBoss = Timer.new()
	timerBoss.autostart = true
	timerBoss.wait_time = 30
	timerBoss.one_shot = true
	timerBoss.connect("timeout",self,"_on_timerBoss_timeout")
	add_child(timerBoss)
	
	control = get_parent().get_node("./..")
	
	$Jugador.set_process(false)
	$Jugador.position = Vector2(-100,-100)
	
	$AnimacionInicio/AnimationPlayer.play("anim_iniciar_nivel")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxBackground/Capa1.position.x -= 0.20
	if $ParallaxBackground/Capa1.position.x <= -1280:
		$ParallaxBackground/Capa1.position.x = 0
	
	$ParallaxBackground/Capa2.position.x -= 0.30
	if $ParallaxBackground/Capa2.position.x <= -1280:
		$ParallaxBackground/Capa2.position.x = 0
	
	var jugador = find_node("Jugador")
	
	if jugador == null:
		$Musica.playing = false
		$MusicaJefe.playing = false

func _on_timerBoss_timeout():
	$NivelBossFinalCreadorEnemigos.activo = false
	
	control.advertenciaBoss()
	
	var timerSpawnBoss = Timer.new()
	timerSpawnBoss.autostart = true
	timerSpawnBoss.wait_time = 2.5
	timerSpawnBoss.one_shot = true
	timerSpawnBoss.connect("timeout",self,"_on_timerBossSpawn_timeout")
	add_child(timerSpawnBoss)
	
	$Musica.playing = false

func _on_timerBossSpawn_timeout():
	var instanciaBoss = boss.instance()
	add_child(instanciaBoss)
	instanciaBoss.position = Vector2(670,180)
	
	$MusicaJefe.playing = true

func _on_AnimationPlayer_animation_finished(anim_name):
	$Jugador.set_process(true)
