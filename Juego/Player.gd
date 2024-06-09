extends KinematicBody2D


export (int) var speed = 300
export (PackedScene) var bullet_scene
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	handle_movement(delta)
	handle_rotation()
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
func handle_movement(delta):
	var velocity = Vector2()

	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1

	velocity = velocity.normalized() * speed
	move_and_slide(velocity)
	
	#if Input.is_action_just_pressed("ui_select"): 
	#	shoot()
	
func handle_rotation():
	var mouse_position = get_global_mouse_position()
	var direction = (mouse_position - position).angle()
	rotation = direction
	
func shoot():
	var bullet = bullet_scene.instance()
	bullet.position = position
	bullet.rotation = rotation
	get_parent().add_child(bullet)
	
	var bullet_direction = (get_global_mouse_position() - position).normalized()
	bullet.set_velocity(bullet_direction * bullet.speed)
	

	
