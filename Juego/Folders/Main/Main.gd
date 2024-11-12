extends Node2D

onready var enemy_spawner = $Map/EnemySpawner
onready var user_interface = $UserInterface
onready var player = $Player
onready var map = $Map
onready var powerup_spawner = $Map/PowerUpSpawner
var spawn_interval = 2.0
var time_passed = 0
var score = 0

func _ready():
	var map_size = map.get_map_size()
	powerup_spawner.set_spawn_area(map_size, player)
	enemy_spawner.set_spawn_area(map_size, player)
	enemy_spawner.update_time(0)

func _process(delta):
	var total_game_time = user_interface.timer_seconds + (user_interface.timer_minutes * 60)
	enemy_spawner.update_time(total_game_time)
	time_passed += delta
	if time_passed >= spawn_interval:
		time_passed = 0
		enemy_spawner.handle_enemy_spawning()
	update_ui()

func update_score():
	score = user_interface.kills_count
	user_interface.add_kill()

func update_ui():
	user_interface.update_hearts(player.health)
	user_interface.update_timer_label()
