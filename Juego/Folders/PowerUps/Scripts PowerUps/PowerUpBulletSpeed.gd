extends "res://Folders/PowerUps/Scripts PowerUps/PowerUpBase.gd"
var speed_increase = 100

func activate_powerup():
	if player:
		player.speed_bullet_player += speed_increase
		yield(get_tree().create_timer(duration), "timeout")
		player.speed_bullet_player -= speed_increase
