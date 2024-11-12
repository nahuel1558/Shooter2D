extends "res://Folders/Bullets/Scripts Bullets/Bullet.gd"

func _ready():
	speed = 200
	damage_bullet = 1
	add_to_group("enemy_bullets")

func _on_BulletEnemy_area_entered(area):
	if area.is_in_group("player"):
		area.take_damage_player(damage_bullet)
		queue_free()
