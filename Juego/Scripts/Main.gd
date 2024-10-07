extends Node2D

# Variable para definir el intervalo de spawn de enemigos.
export (float) var spawn_interval = 2.5
# Variable que sigue el tiempo trancurrido desde el ultimo spawn de enemigo.
var time_passed = 0
# Variable para guardar el score de Player.
var score = 0

# Metodo que se ejecuta automaticamente cuando el nodo este cargado y esta listo en la escena.
func _ready():
	# Metodo que llama al spawn de enemigos.
	spawn_enemy()

# Esta funcion se ejecuta en cada frame. 
# La variable delta es el tiempo que paso desde el ultimo frame.
func _process(delta):
	# Aumenta el tiempo transcurrido en base al tiempo entre frames.
	time_passed += delta
	# Verifico si el tiempo que paso es igual o mayor al tiempo de aparacion de enemigos.
	if time_passed >= spawn_interval:
		# Reinicio el tiempo que paso.
		time_passed = 0
		# Metodo que llama al spawn de enemigos.
		spawn_enemy()

# Metodo que menaja el spawn de enemigos.
func spawn_enemy():
	# Guardo la referencia del nodo EnemySpawner.
	var enemy_spawner = $EnemySpawner

