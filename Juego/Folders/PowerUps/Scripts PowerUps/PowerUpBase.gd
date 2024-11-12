extends Node2D

export (int) var duration = 10
export (int) var value = 1
var is_active = false
var player
var bullet
onready var play_sound = $AudioStreamPlayer2D

func _ready():
	player = get_tree().root.get_node("Main/Player")
	add_to_group("powerup")

func activate_powerup():
	pass

func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		activate_powerup()
		play_sound.play()
		queue_free()
