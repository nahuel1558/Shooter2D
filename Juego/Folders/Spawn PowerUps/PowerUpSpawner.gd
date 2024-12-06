extends Node2D

export (Array, PackedScene) var power_up_scenes
export var spawn_interval = 10 
var map_size
var player

func _ready():
	$Timer.wait_time = spawn_interval
	$Timer.stop()

func _on_Timer_timeout():
	spawn_random_powerup()
	
func set_spawn_area(size, player_ref):
	map_size = size
	player = player_ref
	$Timer.start()
	
func spawn_random_powerup():
	var powerup_scene = power_up_scenes[randi() % power_up_scenes.size()]
	var powerup_instance = powerup_scene.instance()
	set_powerup_position(powerup_instance)
	add_child(powerup_instance)
	powerup_instance.connect("area_entered", self, "_on_powerup_collected")

func set_powerup_position(powerup):
	while true:
		powerup.position = Vector2(randf() * map_size.x, randf() * map_size.y)
		if player and powerup.position.distance_to(player.position) > 150:
			break

func _on_powerup_collected(area, powerup_instance):
	if area.is_in_group("player"):
		area.apply_effect(player)
		powerup_instance.queue_free()
