extends Node2D


var frases = [ 
	"NOOOOOOOOOOOOOOOOOOOOOOOOOOOO",
	"MALDITO SEAS ESTADO DE ISRAEL",
	"COÑOOOOOOOOOOOOOOOO",
	"HIJUEPUTAAAAAAAAAAAAA"
]


# Called when the node enters the scene tree for the first time.
func _ready():
	$Cuerpo.apply_central_impulse(Vector2(rand_range(-75,75),0) * get_physics_process_delta_time())
	$Cuerpo.angular_velocity = rand_range(-20,20) * get_physics_process_delta_time()
	
	$Arma.apply_central_impulse(Vector2(rand_range(-75,75),0) * get_physics_process_delta_time())
	$Arma.angular_velocity = rand_range(-20,20) * get_physics_process_delta_time()
	
	var fraseAleatoria = randi() % frases.size() - 1
	$Mensaje.bbcode_text = "[shake rate=20 level=10]" + frases[fraseAleatoria] + "[/shake]"
	
	var gritoAleatorio = randi() % 10 + 1
	var grito = get_node("Gritos/Grito" + String(gritoAleatorio))
	grito.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
