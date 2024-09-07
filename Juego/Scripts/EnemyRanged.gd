extends Area2D

export (int) var speed = 80
export (int) var health = 5
export (PackedScene) var bullet_enemy_scene
var player

func _ready():
	player = get_tree().root.get_node("Main/Player")
	add_to_group("enemies")
	yield(get_tree().create_timer(5.0), "timeout")
	shoot()

func _process(delta):
	if player:
		var direction = (player.position - position).normalized()
		position += direction * speed * delta

func shoot():
	var bullet = bullet_enemy_scene.instance()
	bullet.position = position
	bullet.rotation = rotation
	get_parent().add_child(bullet)
	if player:
		var bullet_direction = (player.position - position).normalized()
		bullet.set_velocity(bullet_direction * bullet.speed)
	
func _on_EnemyRanged_area_entered(area):
	if area.is_in_group("bullet"):
		take_damage_enemy(area.damage_bullet)
		
func take_damage_enemy(damage_bullet):
	health -= damage_bullet
	is_alive()
		
func is_alive():
	if health <= 0:
		queue_free()
