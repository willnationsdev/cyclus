extends Object

var _skills = {}
# var SKILLS = preload("res://addons/GodotSkillSystem/API/SkillSystem.gd").instance()

func _ready():
	pass

func init(skillNames):
	for name in skillNames:
		initSkill(name)
	return self

func initSkill(name):
	_skills[name] = SKILLS.getSkill(name)
	return _skills[name]

func getSkill(name):
	return _skills[name]

func addSkill(name):
	return initSkill(name)

func removeSkill(name):
	return _skills.erase(name)

func hasSkill(name):
	return _skills.has(name)

func unpack():
	return _skills