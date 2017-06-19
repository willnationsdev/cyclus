tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("MyButton", "Button", preload("button.gd"), preload("custom_node_icon.png"))

func _exit_tree():
	remove_custom_type("MyButton")
