extends Node2D

onready var enemy_spawner = $Map/EnemySpawner
onready var user_interface = $UserInterface
onready var player = $Player
onready var map = $Map
onready var powerup_spawner = $Map/PowerUpSpawner
onready var gameover_menu = $GameOverMenu
var spawn_interval = 2.0
var time_passed = 0
var score = 0
var is_paused = false

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
	
func load_game_over():
	get_tree().paused = true
	var game_over_scene = load("res://Folders/Menu/Scenes Menu/GameOverMenu.tscn").instance()
	get_tree().current_scene.add_child(game_over_scene)
	var score = user_interface.get_final_score()
	var time = user_interface.get_time_elapsed()
	game_over_scene.show_menu()
	game_over_scene.set_data_label(score, time)


func update_score():
	score = user_interface.kills_count
	user_interface.add_kill()

func update_ui():
	if is_instance_valid(player):
		user_interface.update_hearts(player.health)
	user_interface.update_timer_label()
