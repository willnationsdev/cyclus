extends Node

var _skillSystemJsonPath = "res://addons/GodotSkillSystem/JSON/skillsystem.json"

# Classes
var Effect          = preload("res://addons/GodotSkillSystem/API/Effect.gd")
var TargetingMethod = preload("res://addons/GodotSkillSystem/API/TargetingMethod.gd")
var Element         = preload("res://addons/GodotSkillSystem/API/Element.gd")
var Skill           = preload("res://addons/GodotSkillSystem/API/Skill.gd")
var SkillPack       = preload("res://addons/GodotSkillSystem/API/SkillPack.gd")
var SkillTestResult = preload("res://addons/GodotSkillSystem/API/SkillTestResult.gd")

# data-initialized member variables
var _data = {}
var _effects = {}
var _targeting_methods = {}
var _elements = {}
var _skills = {}

func _ready():
	var f = File.new()
	var error = f.open(_skillSystemJsonPath, File.READ)
	if error != OK:
		assert(0 && ("Could not open Skill System JSON file at: " + _skillSystemJsonPath))
	_data = parse_json(f.get_as_text())
	_effects           = import(_data["effects"], Effect)
	_targeting_methods = import(_data["targetingMethods"], TargetingMethod)
	_elements          = import(_data["elements"], Element)
	_skills            = import(_data["skills"], Skill)

func import(data_group, script):
	var total = {}
	assert(data_group != null)
	for dat in data_group:
		var inst = script.instance()
		inst.init(dat)
		total[dat.name] = inst
	return total

func _getSkillAPI(item_name, data_group, script):
	var item = script.instance()
	item.init(data_group[item_name])
	return item

func getEffect(name):
	return _getSkillAPI(name, _effects, Effect)

func getElement(name):
	return _getSkillAPI(name, _elements, Element)

func getTargetingMethod(name):
	return _getSkillAPI(name, _targeting_methods, TargetingMethod)

func getSkill(name):
	return _getSkillAPI(name, _skills, Skill)

func testSkill(name, source, target, env, input):
	var test = SkillTestResult.instance()
	test.setSkill(getSkill(name))
	return test.testSkill(source, target, env, input)