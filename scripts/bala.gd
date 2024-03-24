extends Node2D

@export var tiro_velocidade : float = 1000.0
@export var dano : float = 2
	
func _physics_process(delta):
	global_position += get_global_transform().x * tiro_velocidade * delta

func _on_area_2d_body_entered(body):
	if body.has_method("ocorrer_dano"):
		body.ocorrer_dano(dano)
	auto_destruir()

func auto_destruir():
	queue_free()
