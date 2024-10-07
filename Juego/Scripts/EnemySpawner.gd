extends Node2D

export (PackedScene) var enemy_basic_scene
export (PackedScene) var enemy_ranged_scene
export (PackedScene) var enemy_strong_scene
export (PackedScene) var enemy_ranged_strong_scene
var max_enemies = 25
var active_enemies = 0

export (float) var spawn_interval = 2.0
var time_passed = 0
var elapsed_time = 0

func _process(delta):
	time_passed += delta
	elapsed_time += delta

	if time_passed >= spawn_interval and active_enemies < max_enemies:
		time_passed = 0
		handle_enemy_spawning(elapsed_time)

func handle_enemy_spawning(elapsed_time):
	if elapsed_time < 180: 
		spawn_enemy_basic()
	elif elapsed_time < 300:
		spawn_mixed_basic_enemies()
	else:
		spawn_mixed_strong_enemies()

func spawn_enemy_basic():
	var spawn_count = min(lerp(4, 15, elapsed_time / 180.0), max_enemies - active_enemies)  # Gradual desde 4 a 15 enemigos
	for i in range(int(spawn_count)):
		var enemy = enemy_basic_scene.instance()
		set_enemy_position(enemy)
		add_child(enemy)
		enemy.connect("queue_free", self, "_on_enemy_freed")
		active_enemies += 1

func spawn_mixed_basic_enemies():
	var spawn_count = min(lerp(5, 10, (elapsed_time - 180) / 120.0), max_enemies - active_enemies)  # Gradual de 5 a 10 enemigos
	for i in range(int(spawn_count)):
		var enemy
		if randi() % 2 == 0:
			enemy = enemy_basic_scene.instance()
		else:
			enemy = enemy_ranged_scene.instance()
		set_enemy_position(enemy)
		add_child(enemy)
		enemy.connect("queue_free", self, "_on_enemy_freed")
		active_enemies += 1

		
func spawn_mixed_strong_enemies():
	var spawn_count = min(lerp(5, 12, (elapsed_time - 300) / 120.0), max_enemies - active_enemies)  # Gradual de 5 a 12 enemigos
	for i in range(int(spawn_count)):
		var enemy
		if randi() % 2 == 0:
			enemy = enemy_strong_scene.instance()
		else:
			enemy = enemy_ranged_strong_scene.instance()
		set_enemy_position(enemy)
		add_child(enemy)
		enemy.connect("queue_free", self, "_on_enemy_freed")
		active_enemies += 1

func set_enemy_position(enemy):
	var viewport_size = get_viewport_rect().size
	var side = randi() % 4
	match side:
		0:enemy.position = Vector2(randi() % int(viewport_size.x), -10)
		1: enemy.position = Vector2(randi() % int(viewport_size.x), viewport_size.y + 10)
		2: enemy.position = Vector2(-10, randi() % int(viewport_size.y))
		3: enemy.position = Vector2(viewport_size.x + 10, randi() % int(viewport_size.y))

func _on_enemy_freed():
	active_enemies -= 1
