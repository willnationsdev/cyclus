extends Node

# Operations tell us...
# 1. Who
# 2. did what
# 3. where
# 4. when (turn, step, and task)

# Which player executed the operation
onready var player_id = 1
# Which operation the player executed
onready var op_name = ""
# Where the player executed it
onready var position = Vector2(0,0)
# Which turn the player executed it
onready var turn_id = 1
# Which step during a turn the player executed it
onready var step_id = 1
# Which task during a step this operation pertains to (in chronological order)
onready var task_id = 1

func _ready():
	pass
