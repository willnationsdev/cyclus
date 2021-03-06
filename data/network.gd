# This singleton manages all information related to player connections.

extends Node

# The set of players that are connected to the game (including me).
var player_info = {}

# The information I will send to other players.
var my_network_info = {}

# The minimum number of players that can be in a game, aside from practice mode.
const MIN_PLAYERS = 2
# The maximum number of players that can be in a game.
const MAX_PLAYERS = 2
# The default port on the router to connect to
const DEFAULT_PORT = 9080
# The default IP address to connect to as a client. Recommended that the user change this.
const DEFAULT_IPV4_ADDRESS = "127.0.0.1"

# Connects this object's methods to the SceneTree's network-related signals.
func _ready():
	# These signals only trigger for the Master
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	# These signals only trigger for the Slaves
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")

func _player_connected(id):
	print("Player " + str(id) + " just connected!")

func _player_disconnected(id):
	player_info.erase(id) # Erase player from info

func _connected_ok():
	# Only called on clients, not server. Send my ID and info to all the others
	rpc("register_player", get_tree().get_network_unique_id(), my_network_info)

func _server_disconnected():
	print("ID(" + str(get_tree().get_network_unique_id()) + "): Disconnected from the server")

func _connected_fail():
	print("ID(" + str(get_tree().get_network_unique_id()) + "): Failed to connect to the server")

remote func register_player(id, info):
	# Store the info. EVERY remote player executes this.
	player_info[id] = info
	
	print("Local Player ", str(get_tree().get_network_unique_id()), " named ",
	my_network_info['username'], " became aware of Remote Player ", str(id), " named ",
	info['username'])
	
	# If I'm the server, let the new guy know about existing players
	if (get_tree().is_network_server()):
		# Send my info to new player
		rpc_id(id, "register_player", 1, my_network_info)
		# Send the info of existing players
		for peer_id in player_info:
			rpc_id(id, "register_player", peer_id, player_info[peer_id])
			
	# Call function to update lobby UI here

func verify_ipv4_address(ip):
	var split_ip = ip.split(".") 					# Split up the IP address by periods
	if (split_ip.size() != 4): 						# Fails if there are not 4 numbers
		return false
	for ip_segment in split_ip: 					# for each number...
		var int_segment = ip_segment.to_int() 		# Convert to int
		if (int_segment < 0 || int_segment > 255): 	#Fails if not in 8-bit range
			return false