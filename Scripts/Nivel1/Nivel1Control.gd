extends Node2D


var control


# Called when the node enters the scene tree for the first time.
func _ready():
	var timerBoss = Timer.new()
	timerBoss.autostart = true
	timerBoss.wait_time = 1
	timerBoss.one_shot = true
	timerBoss.connect("timeout",self,"_on_timerBoss_timeout")
	add_child(timerBoss)
	
	control = get_parent().get_node("./..")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_timerBoss_timeout():
	$Nivel1CreadorEnemigos.activo = false
	
	control.advertenciaBoss()
	
