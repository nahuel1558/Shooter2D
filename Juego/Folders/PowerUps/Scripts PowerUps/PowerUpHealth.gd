extends "res://Folders/PowerUps/Scripts PowerUps/PowerUpBase.gd"
var health_up = 1
func activate_powerup():
	if player.health < 3:
		player.health += health_up
