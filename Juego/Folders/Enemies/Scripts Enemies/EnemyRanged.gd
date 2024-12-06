extends "res://Folders/Enemies/Scripts Enemies/EnemyBasic.gd"

export (PackedScene) var bullet_enemy_scene

func _ready():
	speed = 60
	health = 2
	shoot()
	yield(get_tree().create_timer(5.0), "timeout")

func shoot():
	var bullet = bullet_enemy_scene.instance()
	bullet.position = position
	bullet.rotation = rotation
	bullet.damage_bullet = 1.5
	get_parent().add_child(bullet)
	follow_player(bullet)

func follow_player(bullet):
	if is_instance_valid(player):
		var bullet_direction = (player.position - position).normalized()
		bullet.set_velocity(bullet_direction * bullet.speed)

func _on_EnemyRanged_area_entered(area):
	if area.is_in_group("player"):
		area.take_damage_player(damage)
