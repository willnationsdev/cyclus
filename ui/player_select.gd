extends VBoxContainer

export (NodePath) var player_count_spinbox
onready var gamestate = get_tree().get_root().get_node("root/gamestate")

func _ready():
	for child in get_children():
		child.hide()

func _on_spinbox_value_changed( value ):
	for i in range(gamestate.MIN_PLAYERS, value):
		if (i <= value):
			get_children()[i].show()
		else:
			get_children()[i].hide()
