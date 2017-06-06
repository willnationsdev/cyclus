# This class will represent the entire grid in which units move around
tool
extends TileMap

# $-syntax does not currently appear to support anything beyond child node names and literal strings.
# As such, one cannot store a String or NodePath into a variable such as map and do $map.method()
# export (String) var map = ".."

# These variables customize the Editor TileMap "fill" process
export (int) var map_width = 6
export (int) var map_height = 6
export (int) var fill_tile_id = 0
export (bool) var fill_tile_flip_x = false
export (bool) var fill_tile_flip_y = false
export (bool) var fill_tile_transpose = false

# These variables constitue "buttons" to trigger design-time manipulations
export (bool) var fill_tilemap setget set_fill
export (bool) var clear_tilemap setget set_clear

# This flag ensures that engine initialization procedures do not trigger design-time operations
# automatically upon start-up
var ready = false

func _ready():
	ready = true

func fill(tile_id, flip_x, flip_y,transpose):
	for i in range(0,map_width):
		for j in range(0,map_height):
			$"..".set_cell(i,j,tile_id,flip_x,flip_y,transpose)

func set_fill(new_fill):
	if ready:
		fill(fill_tile_id,fill_tile_flip_x,fill_tile_flip_y,fill_tile_transpose)

func set_clear(new_clear):
	if ready:
		$"..".clear()
