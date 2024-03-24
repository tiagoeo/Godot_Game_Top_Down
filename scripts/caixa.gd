extends RigidBody2D

@export var hp_caixa : float = 10

var _pouco_danificada = preload("res://assets/caixa/01.png")
var _media_danificada = preload("res://assets/caixa/02.png")
var _muito_danificada = preload("res://assets/caixa/03.png")

func ocorrer_dano(dano):
	if hp_caixa <= 0:
		print("destruiu caixa")
		queue_free()
	else:
		hp_caixa -= dano
		if hp_caixa >= 8 and hp_caixa < 10:
			get_node("Sprite2D").texture = _pouco_danificada
		elif hp_caixa >= 4 and hp_caixa <8:
			get_node("Sprite2D").texture = _media_danificada
		elif hp_caixa >=2 and hp_caixa < 4:
			get_node("Sprite2D").texture = _muito_danificada
		print("Dano: "+str(dano) + " - HP: "+str(hp_caixa))
