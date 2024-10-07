extends Area2D

# export hace que las variables sean visibles y se puedan modificar desde el editor.
# Variables que definen las propiedades básicas de Bullet.
export (int) var speed = 800
export (int) var damage_bullet = 10
# Es una Vector2D para controlar la direccion y velocidad de Bullet.
var velocity = Vector2()

# Metodo que se ejecuta automaticamente cuendo el nodo este cargado y esta listo en la escena.
func _ready():
	# Establece la direccion inicial de Bullet.
	set_velocity(Vector2(cos(rotation), sin(rotation)) * speed)

# Esta funcion se ejecuta en cada frame. 
# La variable delta es el tiempo que paso desde el ultimo frame.
func _process(delta):
	position += velocity * delta

# Metodo que me permite ajustar la velocidad por si Bullet sale de diferentes direcciones.
func set_velocity(new_velocity):
	velocity = new_velocity

# Metodo que se ejecuta cuando Bullet entra en otra area.
# Si entro en el area "enemies" llama a la funcion take_damage_enemy y le pasa el daño de Bullet.
# Luego elimina Bullet.
func _on_Bullet_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage_enemy(damage_bullet)
		queue_free()

# Metodo que detecta si Bullet se salio del area visible de la pantalla y elimina Bullet.
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
