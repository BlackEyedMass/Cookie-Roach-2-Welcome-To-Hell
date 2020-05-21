extends Node2D

var control

export(PackedScene) var boss

# Called when the node enters the scene tree for the first time.
func _ready():
	var timerBoss = Timer.new()
	timerBoss.autostart = true
	timerBoss.wait_time = 45
	timerBoss.one_shot = true
	timerBoss.connect("timeout",self,"_on_timerBoss_timeout")
	add_child(timerBoss)
	
	control = get_parent().get_node("./..")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxBackground/Capa1.position.x -= 1
	if $ParallaxBackground/Capa1.position.x < -5120:
		$ParallaxBackground/Capa1.position.x = 0

func _on_timerBoss_timeout():
	$Nivel3CreadorEnemigos.activo = false
	
	control.advertenciaBoss()
	
	var timerSpawnBoss = Timer.new()
	timerSpawnBoss.autostart = true
	timerSpawnBoss.wait_time = 2.5
	timerSpawnBoss.one_shot = true
	timerSpawnBoss.connect("timeout",self,"_on_timerBossSpawn_timeout")
	add_child(timerSpawnBoss)

func _on_timerBossSpawn_timeout():
	var instanciaBoss = boss.instance()
	add_child(instanciaBoss)
	instanciaBoss.position = Vector2(670,180)

func _on_jefeNivel3_derrotado():
	var timerSalida = Timer.new()
	timerSalida.autostart = true
	timerSalida.wait_time = 6
	timerSalida.one_shot = true
	timerSalida.connect("timeout",self,"_on_timerSalida_timeout")
	call_deferred("add_child",timerSalida)
	
	$MusicaNivelCompletado.play()

func _on_timerSalida_timeout():
	control.cambiarNivel(2)
