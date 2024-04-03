extends CharacterBody2D

@export var speed = 400

var target = position
var tiro = false
var tiro_target
var projetil = preload("res://assets/bala/bala.tscn")

func _input(event):
	if GLOBALSCRIPT.PLAYER_MOVER:
		if event.is_action_pressed("click"):
			target = get_global_mouse_position()
		
	if GLOBALSCRIPT.PLAYER_ATIRAR:
		if event.is_action_pressed("click"):
			tiro_target = get_node("Marker2D")
			tiro = true

@warning_ignore("unused_parameter")
func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	look_at(target)
	if position.distance_to(target) > 10:
		move_and_slide()
	if tiro:
		var bullet : Node2D = projetil.instantiate() as Node2D
		get_tree().current_scene.add_child(bullet)
		bullet.global_position = tiro_target.global_position
		bullet.global_rotation = tiro_target.global_rotation
		tiro = false
