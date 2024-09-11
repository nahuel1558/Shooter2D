extends Node2D

export (PackedScene) var enemy_spawner_scene
var enemy_spawner
export (float) var spawn_interval = 2.5
var time_passed = 0
var score = 0

func _ready():
	spawn_enemy()
	
func _process(delta):
	time_passed += delta
	if time_passed >= spawn_interval:
		time_passed = 0
		spawn_enemy()

func spawn_enemy():
	enemy_spawner = enemy_spawner_scene.instance()
	$Enemies.add_child(enemy_spawner)

