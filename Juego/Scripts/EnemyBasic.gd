extends Area2D

# Variables que definen las propiedades básicas de EnemyBasic.
var speed = 100
var health = 10
var damage = 10
# Esto es para guardar la referencia de Player.
var player

# Metodo que se ejecuta automaticamente cuando el nodo este cargado y esta listo en la escena.
func _ready():
	
	# Obtiene la referencia de Player.
	player = get_tree().root.get_node("Main/Player")
	
	# Añade EnemtBasic al grupo "enemies".
	add_to_group("enemies")

# Esta funcion se ejecuta en cada frame. 
# La variable delta es el tiempo que paso desde el ultimo frame.
func _process(delta):
	
	# Verifica que Player exista.
	if player:
			# Calcula la dirección hacia el jugador
			var direction = (player.position - position).normalized()
			# Actualiza la posición del enemigo, moviéndolo hacia el jugador según su velocidad.
			position += direction * speed * delta

# Metodo que se ejecuta cuando EnemyBasic entra en otra area.
# Se detecta si EnemyBasic fue impactado por Bullet.
func _on_EnemyBasic_area_entered(area):
	if area.is_in_group("bullet"):
		take_damage_enemy(area.damage_bullet)

# Metodo para aplicar el daño de Bullet hacia EnemyBasic.
func take_damage_enemy(damage_bullet):
	health -= damage_bullet
	is_alive()

# Metodo que verifica si la vida de EnemyBasic es igual o menor a cero lo elimina.
func is_alive():
	if health <= 0:
		queue_free()
		# Reduce el contador de enemigos activos.
		get_tree().root.get_node("Main/EnemySpawner").active_enemies -= 1

# Metodo que detecta si EnemyBasic se salio del area visible de la pantalla y lo elimina.
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
