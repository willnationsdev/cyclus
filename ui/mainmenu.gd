extends Control

func _ready():
	pass

func _on_online_multiplayer_button_button_up():
	hide()
	get_node("../lobby").show()
