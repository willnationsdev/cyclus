extends Node

var data = {}
var skillSystemJsonPath = SETTINGS.get_value("skills", "skillSystemJsonPath")

func _ready():
	var f = File.new()
	f.open(skillSystemJsonPath, File.READ)
	data = parse_json(f.get_as_text())
