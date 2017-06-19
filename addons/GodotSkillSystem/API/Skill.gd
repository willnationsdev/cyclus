extends Object

var _name = ""
var _elements = []
var _attributes = {}

func _ready():
	pass

func init(data):
	_name = data.name
	for elm in data.elements:
		_elements[elm.name] = var2str(str2var(elm))

