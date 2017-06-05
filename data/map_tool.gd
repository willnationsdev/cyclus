# This class will represent the entire grid in which units move around
tool
extends TileMap

export (int) var map_width = 6
export (int) var map_height = 6
export (int) var fill_tile_id = 0
export (bool) var fill = false

func _ready():
	pass

func fill(tile_id, flip_x, flip_y,transpose):
	for i in range(0,map_width):
		for j in range(0,map_height):
			set_cell(i,j,tile_id,flip_x,flip_y,transpose)