extends Area2D

export (int) var speed = 200 
export (int) var damage = 10
var velocity = Vector2()

func _ready():
	add_to_group("enemy_bullets")
	set_velocity(Vector2(cos(rotation), sin(rotation)) * speed)
	
func _process(delta):
	position += velocity * delta

func set_velocity(new_velocity):
	velocity = new_velocity

func _on_BulletEnemy_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(damage)
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
