extends Area2D

enum tipo {
POWERUP_ESCUDO,
POWERUP_VELDISPARO,
POWERUP_CADDISPARO,
POWERUP_DAMAGE
}

export(Texture) var texturaEscudo
export(Texture) var texturaVelocidadDisparo
export(Texture) var texturaCadenciaDisparo
export(Texture) var texturaDamage

var tipoAleatorio

# Called when the node enters the scene tree for the first time.
func _ready():
	tipoAleatorio = randi() % tipo.size()
	generar(tipoAleatorio)

func _process(_delta):
	position.x -= 1

func _on_PowerUp_area_entered(area):
	if area.is_in_group("jugador"):
		area.nuevoPowerUp(tipoAleatorio)
		call_deferred('free')

func generar(indice):
	match indice:
		tipo.POWERUP_ESCUDO:
			$Sprite.texture = texturaEscudo
		tipo.POWERUP_VELDISPARO:
			$Sprite.texture = texturaVelocidadDisparo
		tipo.POWERUP_CADDISPARO:
			$Sprite.texture = texturaCadenciaDisparo
		tipo.POWERUP_DAMAGE:
			$Sprite.texture = texturaDamage


