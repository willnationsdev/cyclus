extends Node

var player_info = {}
var my_info = { username = "Will Nations" }

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")

func _player_connected(id):
	print("Player " + str(id) + " just connected!")

func _player_disconnected(id):
	player_info.erase(id) # Erase player from info

func _connected_ok():
	# Only called on clients, not server. Send my ID and info to all the others
	rpc("register_player", get_tree().get_network_unique_id(), my_info)

func _server_disconnected():
	print("ID(" + str(get_tree().get_network_unique_id()) + "): Disconnected from the server")

func _connected_fail():
	print("ID(" + str(get_tree().get_network_unique_id()) + "): Failed to connect to the server")

sync func register_player(id, info):
	# Store the info
	player_info[id] = info
	
	print("Local Player " + str(get_tree().get_network_unique_id()) + " named " + str(my_info['username'])
	+ " became aware of Remote Player " + str(id) + " named " + info['username'])
	# If I'm the server, let the new guy know about existing players
	if (get_tree().is_network_server()):
		# Send my info to new player
		rpc_id(id, "register_player", 1, my_info)
		# Send the info of existing players
		for peer_id in player_info:
			rpc_id(id, "register_player", peer_id, player_info[peer_id])
			
	# Call function to update lobby UI here