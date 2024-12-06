extends CanvasLayer

onready var score_label = $KillCountLabel
onready var timer_label = $TimerLabel
var timer_seconds = 0
var timer_minutes = 0
var kills_count = 0

func _ready():
	$GameTimer.connect("timeout", self, "_on_GameTimer_timeout")
	$GameTimer.start()
	_on_GameTimer_timeout()

func _on_GameTimer_timeout():
	timer_seconds += 1
	if timer_seconds >= 60:
		timer_seconds = 0
		timer_minutes += 1
	update_timer_label()

func update_timer_label():
	timer_label.text = String("%02d:%02d" % [timer_minutes, timer_seconds])

func update_hearts(health):
	for i in range(3):
		$LifeContainer.get_child(i).visible = i < health

func add_kill():
	kills_count += 1
	score_label.text = "Kills: " + str(kills_count)

func get_final_score() -> int:
	return kills_count

func get_time_elapsed() -> String:
	return "%02d:%02d" % [timer_minutes, timer_seconds]
