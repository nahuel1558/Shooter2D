extends Control

onready var score_label = $Score
onready var time_label = $Time

func _ready():
	set_pause_mode(PAUSE_MODE_PROCESS)
	self.visible = false 

func show_menu():
	self.visible = true
	get_tree().set_input_as_handled()


func set_data_label(score, time):
	score_label.text = "Puntuación: %d" % score
	time_label.text = "Tiempo: %s" % time

func _on_Retry_pressed():
	var main = get_tree().get_root().get_node("Main")
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_MainMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Folders/Menu/Scenes Menu/MainMenu.tscn")

func _on_Quit_pressed():
	get_tree().quit()
