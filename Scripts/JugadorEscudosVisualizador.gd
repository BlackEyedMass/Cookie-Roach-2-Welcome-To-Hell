extends Node2D


export(Texture) var spriteEscudos

var numeroEscudos

var bucles = 0

var activo = false

func crear(num):
	if activo:
		Destruir()
	
	activo = true
	
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 0.25
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)
	
	match num:
		0:
			pass
		1:
			var node1 = Sprite.new()
			node1.texture = spriteEscudos
			node1.position = Vector2(0,-25)
			add_child(node1)
		2:
			var node1 = Sprite.new()
			node1.texture = spriteEscudos
			node1.position = Vector2(-5,-25)
			add_child(node1)
			
			var node2 = Sprite.new()
			node2.texture = spriteEscudos
			node2.position = Vector2(5,-25)
			add_child(node2)
		3:
			var node1 = Sprite.new()
			node1.texture = spriteEscudos
			node1.position = Vector2(0,-25)
			add_child(node1)
			
			var node2 = Sprite.new()
			node2.texture = spriteEscudos
			node2.position = Vector2(10,-25)
			add_child(node2)
			
			var node3 = Sprite.new()
			node3.texture = spriteEscudos
			node3.position = Vector2(-10,-25)
			add_child(node3)
	

func _on_timer_timeout():
	if visible:
		visible = false
	else:
		visible = true
	
	bucles += 1
	
	if bucles >= 8:
		Destruir()

func Destruir():
	for n in get_children():
		remove_child(n)
		n.call_deferred('free')
	bucles = 0
	activo = false
