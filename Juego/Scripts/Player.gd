extends KinematicBody2D

export (int) var health = 100
export (int) var speed = 300
export (PackedScene) var bullet_scene
var screen_size
# Variable booleana que indica si el jugador es invulnerable o no.
var invulnerable = false

# Metodo que se ejecuta automaticamente cuando el nodo este cargado y esta listo en la escena.
func _ready():
	screen_size = get_viewport_rect().size

# Esta funcion se ejecuta en cada frame. 
# La variable delta es el tiempo que paso desde el ultimo frame.
func _process(delta):
	# Llamo al metodo que controla el movimiento del jugador.
	handle_movement(delta)
	# Llamo al metodo que maneja la rotación de Player en función de la posición del mouse.
	handle_rotation()
	# Si se presiona el boton asignado a "shoot", llama al metodo "shoot()".
	if Input.is_action_just_pressed("shoot"):
		shoot()

# Metodo para manejar el movimiento de Player.
func handle_movement(delta):
	var velocity = Vector2()
	# Se comprueban las entradas del teclado para mover a Player en diferentes direcciones.
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1

	# Se normaliza la velocidad para evitar que sea mayor al moverse en diagonal.
	velocity = velocity.normalized() * speed
	# El metodo "move_and_slide" se usa para mover al jugador mientras se detectan colisiones.
	move_and_slide(velocity)

# Metodo para rotar a Player hacia la posición del mouse.
func handle_rotation():
	# Variable para guardar la posicion del mouse.
	var mouse_position = get_global_mouse_position()
	# Se calcula el angulo entre la posicion de Player y la posicion del mouse.
	var direction = (mouse_position - position).angle()
	# Se aplica direction para que Player apunte hacia el mouse.
	rotation = direction

# Metodo para que Player dispare.
func shoot():
	# Instancia una nueva Bullet apartir de la escena.
	var bullet = bullet_scene.instance()
	# Establece la posicion de Bullet en la misma posicion que Player.
	bullet.position = position
	# Establece la rotacion de Bullet en la misma rotacion que Player.
	bullet.rotation = rotation
	# La escena Bullet es añadida como hija del nodo padre Player.
	get_parent().add_child(bullet)
	
	# Se calcula la direccion de Bullet hacia el mouse.
	var bullet_direction = (get_global_mouse_position() - position).normalized()
	# Se establece la velocidad de Bullet, ajustada a su direccion.
	bullet.set_velocity(bullet_direction * bullet.speed)

func _on_Player_body_entered(body):
	if body.is_in_group("enemy_bullets"):
		take_damage(body.damage)
	elif body.is_in_group("enemies") and not invulnerable:
		take_damage(body.damage)
		repel_enemies()

func take_damage(damage):
	if not invulnerable:
		health -= damage
		if health <= 0:
			die()
		else:
			invulnerable = true
			$Timer.start(2)
func repel_enemies():
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		var distance = position.distance_to(enemy.position)
		if distance <= 50:
			var repel_direction = (enemy.position - position).normalized()
			enemy.position += repel_direction * 50

func die():
	var current_scene = get_tree().current_scene
	get_tree().reload_current_scene()
	
func _on_Timer_timeout():
	invulnerable = false
