extends Node2D

export (PackedScene) var enemy_scene
export (float) var spawn_interval = 2.0
var time_passed = 0
var score = 0

func _process(delta):
	time_passed += delta
	if time_passed >= spawn_interval:
		time_passed = 0
		spawn_enemy()

func spawn_enemy():
	var enemy = enemy_scene.instance()
	enemy.position = Vector2(randi() % int(get_viewport_rect().size.x), -10)
	enemy.connect("body_entered", self, "_on_enemy_body_entered")
	add_child(enemy)

func _on_enemy_body_entered(body):
	if body.name == "Bullet":
		score += 10
		$Label.text = "Score: %d" % score
