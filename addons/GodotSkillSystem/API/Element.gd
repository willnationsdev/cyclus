extends Object

var _name = ""
var _reqs = {}
var _targetingMethod = {}
var _effects = []

func _ready():
	pass

func init(data):
	_name = data.name
	_reqs = str2var(var2str(data.reqs)) # creates a deep copy of the dictionary
	_targetingMethod = data.targetingMethod
	for eff in data.effects:
		_effects[eff.name] = eff
	return self

func getName():
	return _name

func getRequirements():
	return _reqs

func getTargetingMethod():
	return _targetingMethod

func getEffects():
	return _effects

