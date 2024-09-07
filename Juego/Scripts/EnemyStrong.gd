extends Area2D

export (int) var speed = 50
export (int) var health = 20 
export (int) var damage = 20
var player

func _ready():
	player = get_tree().root.get_node("Main/Player")
	add_to_group("enemies")

func _process(delta):
	if player:
		var direction = (player.position - position).normalized()
		position += direction * speed * delta
		
func _on_EnemyStrong_body_entered(body):
	if body.is_in_group("bullet"):
		take_damage_enemy(body.damage_bullet)
		
func take_damage_enemy(damage_bullet):
	health -= damage_bullet
	if health <= 0:
		queue_free()
