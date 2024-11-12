# Documentación de Código para el Proyecto en Godot del videojuego Triangulo Espacial.

Este archivo contiene la documentación de cada clase, método y variable utilizados en el código del proyecto, con descripciones y detalles importantes para su comprensión y mantenimiento.

## Clase: Bala (Bullet)
Script ubicado en `res://Folders/Bullets/Scripts Bullets/Bullet.gd`

### Variables

- **`speed`** (int): Define la velocidad de la bala en píxeles por segundo.
- **`damage_bullet`** (int): Indica el daño que la bala inflige al impactar un objetivo.
- **`velocity`** (Vector2): Almacena la velocidad en un vector de dos dimensiones, calculado en función de la rotación inicial.

### Métodos

- **`_ready()`**: Se ejecuta al iniciar el nodo y configura la velocidad inicial de la bala.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`_process(delta)`**: Actualiza la posición de la bala en cada fotograma.
  - **Parámetros**:
    - `delta` (float): Tiempo transcurrido desde el último fotograma.
  - **Retorno**: Ninguno

- **`set_velocity(new_velocity)`**: Establece una nueva velocidad para la bala.
  - **Parámetros**:
    - `new_velocity` (Vector2): La nueva velocidad a asignar a la bala.
  - **Retorno**: Ninguno

- **`_on_Bullet_area_entered(area)`**: Se ejecuta cuando la bala colisiona con otro objeto.
  - **Parámetros**:
    - `area` (Area2D): El área con la que colisiona la bala.
  - **Retorno**: Ninguno

- **`_on_VisibilityNotifier2D_screen_exited()`**: Destruye la bala cuando sale de la pantalla.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

---

## Clase: Bala Enemiga (BulletEnemy)
Script ubicado en `res://Folders/Bullets/Scripts Bullets/BulletEnemy.gd`

### Variables

- **`speed`** (int): Define la velocidad de la bala enemiga en píxeles por segundo, generalmente menor que la de la bala del jugador.
- **`damage_bullet`** (int): Define el daño que la bala enemiga inflige al jugador.

### Métodos

- **`_ready()`**: Configura los parámetros iniciales para la bala enemiga y la agrega al grupo `enemy_bullets`.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`_on_BulletEnemy_area_entered(area)`**: Se activa cuando la bala enemiga impacta al jugador.
  - **Parámetros**:
    - `area` (Area2D): El área con la que colisiona la bala enemiga.
  - **Retorno**: Ninguno

---

## Clase: Enemigo Básico (EnemyBasic)
Script ubicado en `res://EnemyScripts/EnemyBasic.gd`

### Variables

- **`speed`** (int): Define la velocidad del enemigo en píxeles por segundo.
- **`health`** (int): Indica la vida del enemigo; cuando llega a 0, el enemigo muere.
- **`damage`** (int): Cantidad de daño que el enemigo inflige al jugador al contacto.
- **`player`** (Node): Referencia al nodo jugador para poder dirigirse hacia él.

### Métodos

- **`_ready()`**: Inicializa el enemigo y obtiene una referencia al nodo `Player` en la escena principal.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`_process(delta)`**: Hace que el enemigo se mueva en direccion al jugador.
  - **Parámetros**:
    - `delta` (float): Tiempo transcurrido desde el último fotograma.
  - **Retorno**: Ninguno

- **`_on_EnemyBasic_area_entered(area)`**: Detecta colisiones del enemigo con el jugador y le aplica daño.
  - **Parámetros**:
    - `area` (Area2D): El área con la que colisiona el enemigo (en este caso, el jugador).
  - **Retorno**: Ninguno

- **`take_damage_enemy(damage_bullet)`**: Reduce la vida del enemigo en base al daño recibido.
  - **Parámetros**:
    - `damage_bullet` (int): Cantidad de daño recibido.
  - **Retorno**: Ninguno

- **`is_alive()`**: Verifica si el enemigo sigue vivo; si no, actualiza la puntuación y lo elimina.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

---

## Clase: EnemyRanged
Script ubicado en `res://Folders/Enemies/Scripts Enemies/EnemyBasic.gd`

### Variables Exportadas

- **`bullet_enemy_scene`** (PackedScene): Escena de la bala enemiga, exportada para asignar una bala personalizada desde el editor.

### Variables Locales

- **`speed`** (int): Velocidad del enemigo en píxeles por segundo. Este enemigo tiene una velocidad de 60.
- **`health`** (int): Vida del enemigo. Configurada a 2 para el EnemyRanged básico.
- **`damage`** (float): Daño infligido al jugador al colisionar (no especificado aquí, pero hereda el daño base).

### Métodos

- **`_ready()`**: Configura las propiedades iniciales del enemigo al instanciarse y dispara la primera bala tras una espera.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`shoot()`**: Instancia y dispara una bala enemiga hacia el jugador, estableciendo la posición y la rotación de la bala.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`follow_player(bullet)`**: Calcula la dirección de la bala hacia el jugador y ajusta su velocidad en esa dirección.
  - **Parámetros**:
    - `bullet` (Node): Nodo de la bala enemiga que se ajustará para seguir al jugador.
  - **Retorno**: Ninguno

- **`_on_EnemyRanged_area_entered(area)`**: Detecta la colisión del enemigo con el jugador y le inflige daño.
  - **Parámetros**:
    - `area` (Area2D): Área de colisión que impacta al enemigo (en este caso, el jugador).
  - **Retorno**: Ninguno

---

## Clase: EnemyRangedStrong
Script ubicado en `res://Folders/Enemies/Scripts Enemies/EnemyBasic.gd`

### Variables Exportadas

- **`bullet_enemy_scene`** (PackedScene): Escena de la bala enemiga fuerte, exportada para asignarla desde el editor.

### Variables Locales

- **`speed`** (int): Velocidad del enemigo en píxeles por segundo, establecida en 60.
- **`health`** (int): Vida del enemigo, configurada a 4 para un enemigo fuerte.
- **`damage`** (float): Daño infligido al jugador en una colisión directa, aquí es 2.5.

### Métodos

- **`_ready()`**: Configura las propiedades iniciales del enemigo y dispara una bala hacia el jugador después de 3 segundos.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`shoot()`**: Crea una bala enemiga fuerte, ajustando su velocidad, posición, y daño para atacar al jugador.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`follow_player(bullet)`**: Calcula y asigna la dirección de la bala para seguir al jugador.
  - **Parámetros**:
    - `bullet` (Node): Nodo de bala que ajustará su velocidad hacia el jugador.
  - **Retorno**: Ninguno

- **`_on_EnemyRangedStrong_area_entered(area)`**: Detecta la colisión del enemigo con el jugador e inflige daño.
  - **Parámetros**:
    - `area` (Area2D): Área de colisión del jugador con el enemigo.
  - **Retorno**: Ninguno

---

## Clase: EnemyStrong
Script ubicado en `res://Folders/Enemies/Scripts Enemies/EnemyBasic.gd`

### Variables Locales

- **`speed`** (int): Velocidad del enemigo en píxeles por segundo, establecida en 60.
- **`health`** (int): Vida del enemigo fuerte, establecida en 3.
- **`damage`** (float): Daño infligido al jugador al colisionar, configurado en 2.

### Métodos

- **`_ready()`**: Configura las propiedades iniciales del enemigo fuerte.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`_on_EnemyStrong_area_entered(area)`**: Detecta la colisión del enemigo fuerte con el jugador e inflige daño.
  - **Parámetros**:
    - `area` (Area2D): Área con la que colisiona el enemigo (normalmente, el jugador).
  - **Retorno**: Ninguno

---

## Clase: EnemySpawner
Script ubicado en `res://Folders/Enemies/Scripts Enemies/EnemySpawner.gd`

### Variables Exportadas

- **`enemy_basic_scene`** (PackedScene): Escena de enemigos básicos.
- **`enemy_ranged_scene`** (PackedScene): Escena de enemigos a distancia.
- **`enemy_strong_scene`** (PackedScene): Escena de enemigos fuertes.
- **`enemy_ranged_strong_scene`** (PackedScene): Escena de enemigos fuertes a distancia.
- **`safe_zone_radius`** (int): Define el radio de la zona segura alrededor del jugador donde no pueden aparecer enemigos.

### Variables Locales

- **`max_enemies`** (int): Número máximo de enemigos activos permitidos en el juego, por defecto es 25.
- **`active_enemies`** (int): Número actual de enemigos activos en la escena.
- **`spawn_interval`** (float): Intervalo de tiempo en segundos entre las apariciones de enemigos.
- **`time_passed`** (float): Tiempo transcurrido desde la última aparición de un enemigo.
- **`game_time`** (int): Tiempo total de juego en segundos, usado para ajustar la dificultad.
- **`map_size`** (Vector2): Tamaño del mapa de juego.
- **`player`** (Node2D): Referencia al nodo del jugador.

### Métodos

- **`_process(delta)`**: Controla la aparición de enemigos en intervalos regulares si no se supera el número máximo de enemigos activos.
  - **Parámetros**:
    - `delta` (float): Tiempo transcurrido desde el último frame.
  - **Retorno**: Ninguno

- **`set_spawn_area(size, player_ref)`**: Configura el tamaño del mapa y la referencia al jugador.
  - **Parámetros**:
    - `size` (Vector2): Tamaño del área donde pueden aparecer enemigos.
    - `player_ref` (Node2D): Referencia al nodo jugador.
  - **Retorno**: Ninguno

- **`update_time(new_time)`**: Actualiza el tiempo total de juego.
  - **Parámetros**:
    - `new_time` (int): Tiempo en segundos transcurrido en el juego.
  - **Retorno**: Ninguno

- **`handle_enemy_spawning()`**: Selecciona y genera un tipo de enemigo en función del tiempo de juego.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`spawn_enemy(enemy_scene)`**: Instancia un enemigo de la escena especificada, ajusta su posición, y lo añade a la escena.
  - **Parámetros**:
    - `enemy_scene` (PackedScene): Escena del enemigo a instanciar.
  - **Retorno**: Ninguno

- **`set_enemy_position(enemy)`**: Posiciona un enemigo en un lugar aleatorio dentro del mapa, evitando la zona segura alrededor del jugador.
  - **Parámetros**:
    - `enemy` (Node2D): Nodo de enemigo a posicionar.
  - **Retorno**: Ninguno

- **`_on_enemy_freed()`**: Reduce el contador de enemigos activos al eliminarse un enemigo.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

---

## Clase: GameController
Script ubicado en `res://GameController.gd`

### Variables Locales

- **`spawn_interval`** (float): Intervalo de tiempo entre actualizaciones de aparición de enemigos.
- **`time_passed`** (float): Tiempo transcurrido desde la última actualización de aparición.
- **`score`** (int): Puntaje actual del jugador.

### Variables `onready`

- **`enemy_spawner`**: Referencia al nodo `EnemySpawner` en el mapa.
- **`user_interface`**: Referencia a la interfaz de usuario.
- **`player`**: Referencia al nodo del jugador.
- **`map`**: Referencia al mapa del juego.
- **`powerup_spawner`**: Referencia al nodo de generación de potenciadores (`PowerUpSpawner`).

### Métodos

- **`_ready()`**: Configura el área de aparición para potenciadores y enemigos, inicializando el tiempo de juego.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`_process(delta)`**: Actualiza el tiempo total de juego, controla la aparición de enemigos, y actualiza la interfaz de usuario.
  - **Parámetros**:
    - `delta` (float): Tiempo transcurrido desde el último frame.
  - **Retorno**: Ninguno

- **`update_score()`**: Actualiza el puntaje en la interfaz de usuario.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`update_ui()`**: Actualiza la interfaz de usuario con la vida del jugador y el tiempo de juego.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

---

## Clase: UserInterface
Script ubicado en `res://UserInterface.gd`

### Métodos

- **`_on_Play_pressed()`**: Cambia a la escena principal del juego al presionar "Play".
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`_on_Quit_pressed()`**: Cierra el juego al presionar "Quit".
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

---

## Clase: Map
Script ubicado en `res://Map.gd`

### Variables Exportadas

- **`game_time`** (int): Tiempo total del juego.

### Variables `onready`

- **`timer`**: Referencia al nodo `Timer` para el manejo del tiempo de juego.
- **`enemy_spawner`**: Referencia al nodo de generación de enemigos (`EnemySpawner`).

### Métodos

- **`_ready()`**: Inicia el temporizador para el tiempo de juego.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`_on_Timer_timeout()`**: Incrementa el tiempo de juego en cada evento de temporizador y actualiza el generador de enemigos.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`get_map_size()`**: Devuelve el tamaño de la ventana de visualización como `Vector2`.
  - **Parámetros**: Ninguno
  - **Retorno**: `Vector2`

---

## Clase: Player
Script ubicado en `res://Player.gd`

### Variables Exportadas

- **`bullet_scene`** (PackedScene): Escena de la bala que dispara el jugador.

### Variables Locales

- **`health`** (int): Vida actual del jugador.
- **`speed`** (int): Velocidad de movimiento del jugador.
- **`repel_force`** (float): Fuerza de repulsión aplicada a los enemigos cercanos al recibir daño.
- **`repel_radius`** (float): Radio de efecto de la repulsión de enemigos.
- **`screen_size`** (Vector2): Tamaño de la pantalla del juego.
- **`invulnerable`** (bool): Determina si el jugador es invulnerable tras recibir daño.

### Métodos

- **`_ready()`**: Configura el tamaño de la pantalla y añade al jugador al grupo "player".
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`_process(delta)`**: Gestiona el movimiento, rotación, y disparo del jugador.
  - **Parámetros**:
    - `delta` (float): Tiempo transcurrido desde el último frame.
  - **Retorno**: Ninguno

- **`handle_movement(delta)`**: Gestiona el movimiento del jugador según las entradas de usuario.
  - **Parámetros**:
    - `delta` (float): Tiempo transcurrido desde el último frame.
  - **Retorno**: Ninguno

- **`handle_rotation()`**: Ajusta la rotación del jugador para que apunte hacia el cursor.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`shoot()`**: Instancia y dispara una bala desde la posición del jugador hacia el cursor.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`take_damage_player(damage)`**: Reduce la vida del jugador al recibir daño; activa invulnerabilidad temporal.
  - **Parámetros**:
    - `damage` (int): Daño recibido por el jugador.
  - **Retorno**: Ninguno

- **`repel_enemies()`**: Aplica una fuerza de repulsión a los enemigos cercanos cuando el jugador recibe daño.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`die()`**: Reinicia la escena actual cuando el jugador muere.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`_on_InvulnerableTimer_timeout()`**: Desactiva la invulnerabilidad del jugador al expirar el temporizador.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`increase_health(health_powerup)`**: Incrementa la vida del jugador al recoger un potenciador.
  - **Parámetros**:
    - `health_powerup` (int): Cantidad de vida incrementada.
  - **Retorno**: Ninguno

---

## Clase: PowerUpBase
Script ubicado en `res://Folders/PowerUps/Scripts PowerUps/PowerUpBase.gd`

### Variables Exportadas

- **`duration`** (int): Duración en segundos del efecto del power-up (predeterminado: 10).
- **`value`** (int): Valor del efecto (por ejemplo, incremento en daño o velocidad).
  
### Variables Locales

- **`is_active`** (bool): Indica si el power-up está activo actualmente.
- **`player`** (Node2D): Referencia al jugador.
- **`bullet`** (Node): Referencia a la bala del jugador.
- **`play_sound`** (AudioStreamPlayer2D): Reproductor de audio para el sonido al activar el power-up.

### Métodos

- **`_ready()`**: Se ejecuta al iniciar el nodo, configura la referencia al jugador y agrega el power-up al grupo `powerup`.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`activate_powerup()`**: Método abstracto para activar el efecto del power-up. Este método es implementado en las clases derivadas.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`_on_Area2D_area_entered(area)`**: Detecta colisiones del power-up con el jugador, activa el efecto, reproduce el sonido, y elimina el power-up.
  - **Parámetros**:
    - `area` (Area2D): El área de colisión del jugador.
  - **Retorno**: Ninguno

---

## Clase: PowerUpDamage
Script ubicado en `res://Folders/PowerUps/Scripts PowerUps/PowerUpDamage.gd`

### Variables Locales

- **`damage_increase`** (int): Incremento en el daño de las balas del jugador.
- **`original_damage`** (int): Almacena el daño original para restaurarlo una vez el efecto termine.

### Métodos

- **`activate_powerup()`**: Aumenta el daño de las balas del jugador durante la duración del power-up.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

---

## Clase: PowerUpSpeed
Script ubicado en `res://Folders/PowerUps/Scripts PowerUps/PowerUpSpeed.gd`

### Variables Locales

- **`speed_increase`** (int): Incremento en la velocidad de las balas del jugador.

### Métodos

- **`activate_powerup()`**: Aumenta la velocidad de las balas del jugador durante la duración del power-up.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

---

## Clase: PowerUpHealth
Script ubicado en `res://Folders/PowerUps/Scripts PowerUps/PowerUpHealth.gd`

### Variables Locales

- **`health_up`** (int): Incremento en la vida del jugador al recoger el power-up.

### Métodos

- **`activate_powerup()`**: Incrementa la vida del jugador en 1 hasta un máximo de 3.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

---

## Clase: PowerUpSpawner
Script ubicado en `res://PowerUpSpawner.gd`

### Variables Exportadas

- **`power_up_scenes`** (Array de PackedScene): Lista de escenas de power-ups que pueden aparecer aleatoriamente.
- **`spawn_interval`** (int): Intervalo de tiempo en segundos para generar un nuevo power-up.

### Variables Locales

- **`map_size`** (Vector2): Tamaño del área de aparición de los power-ups.
- **`player`** (Node2D): Referencia al jugador.

### Métodos

- **`_ready()`**: Configura el tiempo de espera para el temporizador de aparición de power-ups y lo detiene hasta que el área esté configurada.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`_on_Timer_timeout()`**: Llama a la función para generar un power-up aleatorio cuando el temporizador se agota.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`set_spawn_area(size, player_ref)`**: Configura el área de aparición de power-ups y la referencia al jugador.
  - **Parámetros**:
    - `size` (Vector2): Tamaño del área.
    - `player_ref` (Node2D): Referencia al nodo jugador.
  - **Retorno**: Ninguno

- **`spawn_random_powerup()`**: Selecciona y genera un power-up aleatorio dentro del área.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`set_powerup_position(powerup)`**: Posiciona el power-up dentro del mapa, manteniendo una distancia mínima del jugador.
  - **Parámetros**:
    - `powerup` (Node2D): Nodo del power-up a posicionar.
  - **Retorno**: Ninguno

- **`_on_powerup_collected(area)`**: Activa el efecto del power-up cuando el jugador lo recoge y elimina el power-up de la escena.
  - **Parámetros**:
    - `area` (Area2D): El área del jugador.
  - **Retorno**: Ninguno

---

## Clase: PowerUpPlayerSpeed
Script ubicado en `res://Folders/PowerUps/Scripts PowerUps/PowerUpPlayerSpeed.gd`

### Variables Locales

- **`powerup_speed`** (int): Incremento en la velocidad del jugador durante el efecto del power-up.

### Métodos

- **`activate_powerup()`**: Aumenta temporalmente la velocidad del jugador, luego la restaura tras la duración del efecto.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

---

## Clase: UserInterface
Script ubicado en `res://UserInterface.gd`

### Variables Locales

- **`timer_seconds`** (int): Contador de segundos del temporizador de juego.
- **`timer_minutes`** (int): Contador de minutos del temporizador de juego.
- **`kills_count`** (int): Contador de enemigos eliminados por el jugador.

### Métodos

- **`_ready()`**: Inicia el temporizador de juego y conecta la señal de tiempo agotado.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`_on_GameTimer_timeout()`**: Incrementa el contador de segundos, y cuando llega a 60, incrementa los minutos.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`update_timer_label()`**: Actualiza el texto de la etiqueta de temporizador con el formato `MM:SS`.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno

- **`update_hearts(health)`**: Muestra la cantidad de corazones en función de la vida del jugador.
  - **Parámetros**:
    - `health` (int): Vida actual del jugador.
  - **Retorno**: Ninguno

- **`add_kill()`**: Incrementa el contador de enemigos eliminados y actualiza la etiqueta de conteo de muertes.
  - **Parámetros**: Ninguno
  - **Retorno**: Ninguno