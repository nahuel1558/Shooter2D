# Extiende del script de EnemyBasic, heredando todos los metodos y propiedades.
extends "res://Scripts/EnemyBasic.gd"

# Exporta la escena de BulletEnemy para poder asignarla desde el editor.
export (PackedScene) var bullet_enemy_scene

# Metodo que se ejecuta automaticamente cuando el nodo este cargado y esta listo en la escena.
func _ready():
	#Sobrescribo atributos en EnemyBasic porque este es un Enemy distinto.
	speed = 60
	health = 20
	# Ejecuta el metodo shoot.
	shoot()
	# Hace una pausa en la ejecucion del codigo por 5 segundos.
	yield(get_tree().create_timer(5.0), "timeout")

# Metodo para que el enemigo dispare al jugador.
func shoot():
	#Instancia una nueva BulletEnemy apartir de la escena.
	var bullet = bullet_enemy_scene.instance()
	# Establece la posicion de BulletEnemy en la misma posicion que el EnemyRanged.
	bullet.position = position
	# Establece la rotacion de BulletEnemy en la misma rotacion que el EnemyRanged.
	bullet.rotation = rotation
	# Sobreescribo el daño de BulletEnemy. 
	bullet.damage = 15
	# La escena BulletEnemy es añadida como hija del nodo padre EnemyRanged.
	get_parent().add_child(bullet)
	follow_player(bullet)

func follow_player(bullet):
	if player:
		#Calcula la direccion hacia el jugador.
		var bullet_direction = (player.position - position).normalized()
		# Establece la velocidad de BulletEnemy, moviendose en direccion al jugador.
		bullet.set_velocity(bullet_direction * bullet.speed)

# Metodo que se ejecuta cuando EnemyRanged entra en otra area.
# Se detecta si EnemyRanged fue impactado por Bullet.
func _on_EnemyRanged_area_entered(area):
	if area.is_in_group("bullet"):
		take_damage_enemy(area.damage_bullet)
