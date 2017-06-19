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
var _targetingMethods = {}
var _elements = {}
var _skills = {}

func _ready():
	var f = File.new()
	var error = f.open(_skillSystemJsonPath, File.READ)
	if error != OK:
		assert(0 && ("Could not open Skill System JSON file at: " + _skillSystemJsonPath))
	_data = parse_json(f.get_as_text())
	for effData in _data["effects"]:
		var eff = Effect.instance()
		eff.init(effData)
		_effects[effData.name] = eff
	assert(_data["effects"] != null)
	for trgData in _data["targetingMethods"]:
		var trg = TargetingMethod.instance()
		trg.init(trgData)
		_targetingMethods[trgData.name] = trg
	assert(_data["targetingMethods"] != null)
	for elmData in _data["elements"]:
		var elm = Element.instance()
		elm.init(elmData)
		_elements[elmData.name] = elm
	assert(_data["elements"] != null)
	for sklData in _data["skills"]:
		var skl = Skill.instance()
		skl.init(sklData)
		_skills[sklData.name] = skl
	assert(_data["skills"] != null)

func getEffect(name):
	var eff = Effect.instance()
	eff.init(_data.effects.name)
	return eff

func getElement(name):
	var elm = Element.instance()
	elm.init(_data.elements.name)
	return elm

func getTargetingMethod(name):
	var trg = TargetingMethod.instance()
	trg.init(_data.targetingMethods.name)
	return trg

func getSkill(name):
	var skl = Skill.instance()
	skl.init(_data.skills.name)
	return skl

func testSkill(name, source, target, env, input):
	var test = SkillTestResult.instance()
	test.setSkill(getSkill(name))
	return test.testSkill(source, target, env, input)