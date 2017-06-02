extends Control

func _ready():
	get_node("lobby").hide()
	get_node("world").hide()
	get_node("builder").hide()
	get_node("practice").hide()
