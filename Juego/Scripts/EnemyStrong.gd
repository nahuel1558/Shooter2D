# Extiende del script de EnemyBasic, heredando todos los metodos y propiedades.
extends "res://Scripts/EnemyBasic.gd"

# Metodo que se ejecuta automaticamente cuando el nodo este cargado y esta listo en la escena.
func _ready():
	#Sobrescribo atributos de EnemyBasic porque este es un Enemy distinto.
	speed = 50
	health = 30
	damage = 20
	
# Metodo que se ejecuta cuando EnemyStrong entra en otra area.
# Se detecta si EnemyStrong fue impactado por Bullet.
func _on_EnemyStrong_body_entered(body):
	if body.is_in_group("bullet"):
		take_damage_enemy(body.damage_bullet)
