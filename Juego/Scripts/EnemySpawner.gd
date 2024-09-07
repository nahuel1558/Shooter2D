extends Node2D

export (PackedScene) var enemy_basic_scene
export (PackedScene) var enemy_ranged_scene
export (PackedScene) var enemy_strong_scene
export (PackedScene) var enemy_ranged_strong_scene

export (float) var spawn_interval = 2.0
var time_passed = 0
var elapsed_time = 0

func _process(delta):
	time_passed += delta
	elapsed_time += delta

	if time_passed >= spawn_interval:
		time_passed = 0
		spawn_enemy()

func spawn_enemy():
	var enemy
	if elapsed_time < 20: 
		enemy = enemy_basic_scene.instance()
	elif elapsed_time < 40:  
		if randi() % 2 == 0:
			enemy = enemy_basic_scene.instance()
		else:
			enemy = enemy_ranged_scene.instance()
	else:
		if randi() % 2 == 0:
			enemy = enemy_strong_scene.instance()
		else:
			enemy = enemy_ranged_strong_scene.instance()

	enemy.position = Vector2(randi() % int(get_viewport_rect().size.x), -10)
	add_child(enemy)
