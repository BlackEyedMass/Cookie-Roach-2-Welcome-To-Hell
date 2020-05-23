extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 0.5
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)

func _input(event):
	if event is InputEventMouseButton:
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			var control = find_parent("Control")
			control.cambiarNivel(2)

func _on_timer_timeout():
	if $Label.visible:
		$Label.visible = false
	else:
		$Label.visible = true
