extends Control

func _ready():
	# Need to figure out a way to cycle through get_children() and evaluate
	# which ones are of type CanvasItem. Posted on /r/godot to ask, cause I can't
	# find anything in the documentation to clear things up.
	# typeof and get_type don't provide enough detail (nothing more specific than TYPE_OBJECT)
	#print("builder is a canvasitem: " + get_node("builder").is_type("CanvasItem"))
	for node in get_children():
		if (node.get_name() != "main_menu"):
			node.hide()
		else:
			node.show()

