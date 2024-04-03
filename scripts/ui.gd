extends CanvasLayer

@onready var btn_mover = get_node("btnMover")
@onready var btn_atirar = get_node("btnAtirar")

func _ready() -> void:
	toggleds("reset", true)

func toggleds(botao, toggle) -> void:
	match botao:
		"reset":
			btn_mover.set_pressed_no_signal(true)
			GLOBALSCRIPT.PLAYER_MOVER = true
		"mover":
			if toggle:
				btn_mover.set_pressed_no_signal(true)
				GLOBALSCRIPT.PLAYER_MOVER = true
			else:
				GLOBALSCRIPT.PLAYER_MOVER = false
		"atirar":
			if toggle:
				btn_atirar.set_pressed_no_signal(true)
				GLOBALSCRIPT.PLAYER_ATIRAR = true
			else:
				GLOBALSCRIPT.PLAYER_ATIRAR = false

func _on_btn_mover_toggled(toggled_on):
	toggleds("mover", toggled_on)

func _on_btn_atirar_toggled(toggled_on):
	toggleds("atirar", toggled_on)
