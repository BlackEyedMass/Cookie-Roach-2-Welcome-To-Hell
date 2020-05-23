extends Control

var bucles

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 0.25
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)
	bucles = 0
	
	$SonidoAlarma.play()

func _on_timer_timeout():
	if visible:
		visible = false
	else:
		visible = true
		$SonidoAlarma.play()
	
	bucles += 1
	
	if bucles >= 8:
		call_deferred('free')
