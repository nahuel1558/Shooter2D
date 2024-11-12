extends "res://Folders/PowerUps/Scripts PowerUps/PowerUpBase.gd"
var powerup_speed = 100

func activate_powerup():
	if player:
		player.speed += powerup_speed
		yield(get_tree().create_timer(duration), "timeout")
		player.speed -= powerup_speed
		is_active = false
