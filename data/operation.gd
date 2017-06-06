# This class is the most basic element of a turn-based game's state change.
# Operations tell us...
# 1. Who (player_id, character_id, and team_id)
# 2. did what (op_name)
# 3. where (position)
# 4. when (turn, step, and task)

extends Node

# Which player executed the operation
onready var player_id = 1
# Which character the player was using when they executed the operation
onready var character_id = 1
# Which team the player was on when they executed the operation
onready var team_id = 1
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
