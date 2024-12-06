extends Node2D

export (PackedScene) var enemy_basic_scene
export (PackedScene) var enemy_ranged_scene
export (PackedScene) var enemy_strong_scene
export (PackedScene) var enemy_ranged_strong_scene
var max_enemies = 25
var active_enemies = 0
var spawn_interval = 2.0
var time_passed = 0
var game_time = 0
export var safe_zone_radius = 150
var map_size
var player
var is_paused = false

func _process(delta):
	time_passed += delta
	if time_passed >= spawn_interval and active_enemies < max_enemies:
		time_passed = 0
		handle_enemy_spawning()

func set_spawn_area(size, player_ref):
	map_size = size
	player = player_ref

func update_time(new_time):
	game_time = new_time

func handle_enemy_spawning():
	if is_instance_valid(player):
		if game_time < 15:
			spawn_enemy(enemy_basic_scene)
		elif game_time < 30:
			spawn_enemy(enemy_ranged_scene)
		elif game_time < 45:
			spawn_enemy(enemy_strong_scene)
		else:
			spawn_enemy(enemy_ranged_strong_scene)
	else:
		print("Instance is non exist: ", player)

func spawn_enemy(enemy_scene):
	var enemy = enemy_scene.instance()
	set_enemy_position(enemy)
	add_child(enemy)
	enemy.connect("tree_exited", self, "_on_enemy_freed")
	active_enemies += 1

func set_enemy_position(enemy):
	while true:
		enemy.position = Vector2(
			rand_range(safe_zone_radius, map_size.x - safe_zone_radius),
			rand_range(safe_zone_radius, map_size.y - safe_zone_radius)
		)
		if player and player.is_inside_tree() and enemy.position.distance_to(player.position) > safe_zone_radius:
			break

func _on_enemy_freed():
	active_enemies = max(0, active_enemies - 1)

func pause_spawner():
	is_paused = true
