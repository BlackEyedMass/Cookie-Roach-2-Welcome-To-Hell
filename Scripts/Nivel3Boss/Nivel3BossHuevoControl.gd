extends Area2D


var limite = 550

export(PackedScene) var cria

var eclosionado

# Called when the node enters the scene tree for the first time.
func _ready():
	eclosionado = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 1
	
	if position.x <= limite:
		_eclosionar()

func _eclosionar():
	if !eclosionado:
		var nuevaCria = cria.instance()
		nuevaCria.position = position
		get_parent().add_child(nuevaCria)
		$AnimationPlayer.play("anim_nivel_3_jefe_huevo_abierto")
		eclosionado = true
