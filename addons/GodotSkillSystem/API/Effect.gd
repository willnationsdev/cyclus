extends Object

var _name = ""
var _params = {}

func _ready():
	pass

# Makes a deep copy of the JSON serialized data. Returns self for chaining
func init(data):
	_name = data.name
	_params = var2str(str2var(data.params))
	return self