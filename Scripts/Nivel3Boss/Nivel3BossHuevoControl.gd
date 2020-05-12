extends Area2D


var limite = 550

export(PackedScene) var cria

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 1
	
	if position.x <= limite:
		_eclosionar()

func _eclosionar():
	var nuevaCria = cria.instance()
	nuevaCria.position = position
	get_parent().add_child(nuevaCria)
	call_deferred('free')
