extends Area2D

export (int) var speed = 400
export (int) var damage_bullet = 10
var velocity = Vector2()

func _ready():
	set_velocity(Vector2(cos(rotation), sin(rotation)) * speed)

func _process(delta):
	position += velocity * delta

func set_velocity(new_velocity):
	velocity = new_velocity

func _on_Bullet_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage_enemy(damage_bullet)
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
