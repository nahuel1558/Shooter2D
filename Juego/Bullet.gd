extends Area2D

export (int) var speed = 400
export (int) var damage = 10
var velocity = Vector2()

func _ready():
	set_velocity(Vector2(cos(rotation), sin(rotation)) * speed)
	add_to_group("bullets")

func _process(delta):
	position += velocity * delta
	
	if position.x < -10 or position.x > get_viewport_rect().size.x + 10 or position.y < -10 or position.y > get_viewport_rect().size.y + 10:
		queue_free()

func set_velocity(new_velocity):
	velocity = new_velocity
