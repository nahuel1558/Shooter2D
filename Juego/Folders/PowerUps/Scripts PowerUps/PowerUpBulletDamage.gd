extends "res://Folders/PowerUps/Scripts PowerUps/PowerUpBase.gd"
var damage_increase = 1

func activate_powerup():
	if player:
		player.damage_bullet_player += damage_increase
		yield(get_tree().create_timer(duration), "timeout")
		player.damage_bullet_player -= damage_increase
