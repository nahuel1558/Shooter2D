extends "res://Folders/Enemies/Scripts Enemies/EnemyBasic.gd"

export (PackedScene) var bullet_enemy_scene

func _ready():
	speed = 60
	health = 4
	damage = 2.5
	yield(get_tree().create_timer(3.0), "timeout")
	shoot()

func shoot():
	var bullet = bullet_enemy_scene.instance()
	bullet.position = position
	bullet.rotation = rotation
	bullet.damage_bullet = 2.5
	bullet.speed = 500
	get_parent().add_child(bullet)
	follow_player(bullet)

func follow_player(bullet):
	if player:
		var bullet_direction = (player.position - position).normalized()
		bullet.set_velocity(bullet_direction * bullet.speed)

func _on_EnemyRangedStrong_area_entered(area):
	if area.is_in_group("player"):
		area.take_damage_player(damage)
