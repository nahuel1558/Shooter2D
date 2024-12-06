extends Area2D

export var bullet_scene: PackedScene 
var health = 3
var speed = 300
var repel_force = 500.0
var repel_radius = 50.0
var screen_size
var invulnerable = false
var speed_bullet_player = 700
var damage_bullet_player = 1

func _ready():
	screen_size = get_viewport_rect().size
	add_to_group("player")
	connect("body_entered", self, "_on_Player_body_entered")
	position = Vector2(OS.window_size.x / 2, OS.window_size.y / 2)

func _process(delta):
	handle_movement(delta)
	handle_rotation()
	if Input.is_action_just_pressed("shoot"):
		shoot()

func handle_movement(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed * delta
	position += velocity
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func handle_rotation():
	var mouse_position = get_global_mouse_position()
	var direction = (mouse_position - position).angle()
	rotation = direction

func shoot():
	var bullet  = bullet_scene.instance()
	bullet.position = position
	bullet.rotation = rotation
	bullet.speed = speed_bullet_player
	bullet.damage_bullet = damage_bullet_player
	get_parent().add_child(bullet)
	var bullet_direction = (get_global_mouse_position() - position).normalized()
	bullet.set_velocity(bullet_direction * bullet.speed)

func take_damage_player(damage):
	if not invulnerable:
		health -= damage
		if health <= 0:
			die()
		else:
			invulnerable = true
			$InvulnerableTimer.start(2)
			repel_enemies()

func repel_enemies():
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		var distance = position.distance_to(enemy.position)
		if distance <= repel_radius:
			var repel_direction = (enemy.position - position).normalized()
			var repel_strength = (1 - (distance / repel_radius)) * repel_force
			enemy.position += repel_direction * repel_strength * get_physics_process_delta_time()

func die():
	var main = get_tree().get_root().get_node("Main")
	main.load_game_over()
	queue_free()


func _on_InvulnerableTimer_timeout():
	invulnerable = false

func increase_health(health_powerup):
	health += health_powerup
