extends Area2D

var speed = 100
var health = 1
var damage = 1
var player

func _ready():
	player = get_tree().root.get_node("Main/Player")
	add_to_group("enemies")

func _process(delta):
	if is_instance_valid(player):
		var direction = (player.position - position).normalized()
		position += direction * speed * delta

func _on_EnemyBasic_area_entered(area):
	if area.is_in_group("player"):
		area.take_damage_player(damage)

func take_damage_enemy(damage_bullet):
	health -= damage_bullet
	is_alive()

func is_alive():
	if health <= 0:
		get_tree().root.get_node("Main").update_score()
		queue_free()
		get_tree().root.get_node("Main/Map/EnemySpawner").active_enemies -= 1
