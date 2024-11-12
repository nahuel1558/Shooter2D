extends "res://Folders/Enemies/Scripts Enemies/EnemyBasic.gd"

func _ready():
	speed = 60
	health = 3
	damage = 2

func _on_EnemyStrong_area_entered(area):
	if area.is_in_group("player"):
		area.take_damage_player(damage)
