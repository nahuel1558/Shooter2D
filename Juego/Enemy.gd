extends Area2D

export (int) var speed = 100
export (int) var health = 10 
var player

func _ready():
	player = get_tree().root.get_node("Main/Player")
	var screen_size = get_viewport_rect().size
	var side = randi() % 4  # 0: arriba, 1: derecha, 2: abajo, 3: izquierda

	match side:
		0:
			position = Vector2(randf() * screen_size.x, -10)  # Arriba
		1:
			position = Vector2(screen_size.x + 10, randf() * screen_size.y)  # Derecha
		2:
			position = Vector2(randf() * screen_size.x, screen_size.y + 10)  # Abajo
		3:
			position = Vector2(-10, randf() * screen_size.y)  # Izquierda

func _process(delta):
	if player:
			var direction = (player.position - position).normalized()
			position += direction * speed * delta

	var screen_size = get_viewport_rect().size
	if position.x < -10 or position.x > screen_size.x + 10 or position.y < -10 or position.y > screen_size.y + 10:
			queue_free()

func _on_Bullet_body_entered(body):
	if body.is_in_group("bullets"):
		take_damage(body.damage)

func take_damage(damage):
	health -= damage
	if health <= 0:
		queue_free()
