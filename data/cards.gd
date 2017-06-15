# Cards manages the (de)serialization of card data and provides
# access to card information for other game objects

extends Node

var data = {hi="data"}

func _ready():
	var f = File.new()
	f.open("res://assets/json/cards.json", File.READ)
	print(f.is_open())
	data = parse_json(f.get_as_text())
	for d in data['effects']:
		print("Name: ", d['name'])
		print("Parameters...")
		for p in d['params']:
			print(p)