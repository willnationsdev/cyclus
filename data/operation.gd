extends Node

# Operations tell us...
# 1. Who (player, character, and team)
# 2. did what
# 3. where
# 4. when (turn, step, and task)

# Which player executed the operation (multiplayer network unique ID)
onready var player_id = 1
# Which character the player is using, if applicable
onready var character_id = 1
# Which team the player is on, if applicable
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
