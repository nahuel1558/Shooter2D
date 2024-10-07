#Script que extiende de Bullet.gd, hereda toda su funcionalidades.
extends "res://Scripts/Bullet.gd"

# Metodo que se ejecuta automaticamente cuendo el nodo este cargado y esta listo en la escena.
func _ready():
	
	# Sobrescribo la velocidad ya definida en Bullet.gd.
	speed = 200
	
	# Sobrescribo el daño ya definido en Bullet.gd.
	damage_bullet = 10
	
	 # Añade BulletEnemy al grupo "enemy_bullets".
	add_to_group("enemy_bullets")

# Metodo que se ejecuta cuando BulletEnemy entra en otra area.
# Si entro en el area "player" llama a la funcion take_damage y le pasa el daño de BulletEnemy.
# Luego elimina BulletEnemy.
func _on_BulletEnemy_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(damage_bullet)
		queue_free()
