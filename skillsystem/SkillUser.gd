extends Node

export (NodePath) var owner = ".."

var skills = {} # The dictionary of skills (name:skill) that this SkillUser currently has access to
var skillPacks = [] # The array of skillPacks (containers of skills) that this SkillUser currently has access to
var skillUserTemplate = "" # If a template is specified, will pull data from JSON to fill with skills

func _ready():
	pass

func getSkillNames():
	pass

func getSkills():
	var totalSkills = skills.values()
	for pack in skillPacks:
		totalSkills.append(skillPacks.unpack())
	return totalSkills

func useSkill(skillName):
	pass

