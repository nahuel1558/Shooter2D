extends Area2D

export (int) var speed = 200 
export (int) var damage = 10
var velocity = Vector2()

func _ready():
	add_to_group("enemy_bullets")

func _process(delta):
	position += velocity * delta
	if position.x < -10 or position.x > get_viewport_rect().size.x + 10 or position.y < -10 or position.y > get_viewport_rect().size.y + 10:
		queue_free()

func set_velocity(new_velocity):
	velocity = new_velocity

func _on_BulletEnemy_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(damage)
		queue_free()

