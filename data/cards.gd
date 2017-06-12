# Cards manages the (de)serialization of card data and provides
# access to card information for other game objects

extends Node

var data = {}

func _ready():
    var cards_json = File.new()
    cards_json.open("res://assets/json/cards.json", File.READ)
    data.parse_json(cards_json.get_as_text())
    print(data)