extends Node2D

export var game_time = 0 
onready var timer = $Timer
onready var enemy_spawner = $EnemySpawner 

func _ready():
	timer.start()

func _on_Timer_timeout():
	game_time += 1
	enemy_spawner.update_time(game_time)

func get_map_size() -> Vector2:
	return get_viewport_rect().size
