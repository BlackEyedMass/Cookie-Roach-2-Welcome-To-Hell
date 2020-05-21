extends Node2D


var control

# Called when the node enters the scene tree for the first time.
func _ready():
	control = get_parent().get_node("./..")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
