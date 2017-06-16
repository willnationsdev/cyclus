extends Node

const DEFAULT_CONFIG_PATH = "user://config.cfg"

var _settings = {
	"skills": {
		"skillSystemJsonPath": "res://assets/json/skillsystem.json"
	}
}

var config = ConfigFile.new()

func _ready():
	# Check if we can load the settings properly (and if so, load them)
	if load_settings() != OK:
		# Initialize settings with default information
		save_settings() 

func save_settings():
	for section in config.keys():
		for key in config[section]:
			config.set_value(section, key, _settings[section][key])

func load_settings():
	var error = config.open(DEFAULT_CONFIG_PATH)
	if error != OK:
		print("Settings config failed to load at path: %s" % DEFAULT_CONFIG_PATH)
		print("Load error was: %s" % error)
		return error

	else:
		for section in config.keys():
			for key in config[section]:
				_settings[section][key] = config.get_value(section, key, null)