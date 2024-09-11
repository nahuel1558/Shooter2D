extends Area2D

var speed = 100
export (int) var health = 10 
var player

func _ready():
	player = get_tree().root.get_node("Main/Player")
	add_to_group("enemies")

func _process(delta):
	if player:
			var direction = (player.position - position).normalized()
			position += direction * speed * delta
			
	
func _on_EnemyBasic_area_entered(area):
	if area.is_in_group("bullet"):
		take_damage_enemy(area.damage_bullet)
		
func take_damage_enemy(damage_bullet):
	health -= damage_bullet
	if health <= 0:
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
