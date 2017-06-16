extends Node2D

var data = []
var width = 0
const DEFAULT_LAYER = "characters"

# layers, listed in draw order
# background_objects are useful for background elements that animate (which you can't do with a TileMap)
var layers = [
	"background_objects", 	# something the player walks in front of
	"characters", 			# actors
	"foreground_objects", 	# something the player can "walk behind" (and still see the player)
	"skills" 				# effects like a fireball
]

# trigger = placing these on the same tile will trigger a signal
# block = you cannot place something on this tile
var collisions = {
	background_objects = {
		trigger = [],
		block = [
			"background_objects"
		]
	},
	characters = {
		trigger = [
			"characters",
			"foreground_objects"
		],
		block = []
	},
	foreground_objects = {
		trigger = [
			"foreground_objects"
		],
		block = []
	},
	skills = {
		trigger = [
			"skills"
		],
		block = []
	}
}

func _ready():
	pass

# Returns the object that is currently at that layer's position in that cell
func get(x, y, layer = DEFAULT_LAYER):
	return getAll(x,y)[layer]

# Returns a dictionary of each layer and its corresponding objects
func getAll(x, y):
	return data[at(x,y)]

# Places an object in a given cell (x,y) at a given layer
func set(x, y, obj, layer = DEFAULT_LAYER):
	if getAll(x,y) == null:
		data[at(x,y)] = {}
	if collisions[layer].find(obj) != -1:
		get(x, y)[layer] = obj
		obj.position = Vector2(x,y)

# Vector2 implementation
func setv(vector2, obj, layer = DEFAULT_LAYER):
	return set(vector2.x, vector2.y, obj, layer)

func init(length, width):
	for cell in range(0,at(length,width)):
		data[cell] = buildInitDict()

# Returns a dictionary with a null entry for each named layer
func buildInitDict():
	var dict = {}
	for layer in layers:
		dict[layer] = null
	return dict

# Needed because GDScript does not support 2D areas
func at(x,y):
	return y*width + x
