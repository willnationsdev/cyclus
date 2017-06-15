# Cards manages the (de)serialization of card data and provides
# access to card information for other game objects

extends Node

var data = { hi="test" }

func _ready():
    print(data)