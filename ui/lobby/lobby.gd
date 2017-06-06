extends Control

# This class should be solely responsible for the UI that the user interacts with to connect
# to online matches

export(String) var ip_address = NETWORK.DEFAULT_IPV4_ADDRESS
export(int) var server_port = NETWORK.DEFAULT_PORT

func _ready():
	pass

func _on_host_button_down():
	# Create a host on the port waiting for some maximum number of players.
	var host = NetworkedMultiplayerENet.new()
	host.create_server(server_port, NETWORK.MAX_PLAYERS)
	get_tree().set_network_peer(host)
	
	print("Connecting host...",
	"\nUnique Network ID: ", str(get_tree().get_network_unique_id()),
	"\nServer Port: ", str(server_port) + "\nIP Address: " +  ip_address)

func _on_join_button_down():
	# Create a client and attempt to connect to the ip address and port
	var host = NetworkedMultiplayerENet.new()
	host.create_client(ip_address, server_port)
	get_tree().set_network_peer(host)
	
	print("Connecting client...",
	"\nUnique Network ID: ", str(get_tree().get_network_unique_id()),
	"\nServer Port: ", str(server_port),
	"\nIP Address: ", ip_address)

func _on_back_button_up():
	# Cancel our hosting or our attempt to join
	get_tree().set_network_peer(null)
	# Hide the lobby
	hide()
	# Show the main menu again
	get_node("../main_menu").show()

# Updates the NETWORK's record of the player's username when changed
func _on_username_field_text_changed( text ):
	NETWORK.my_network_info['username'] = text

func _on_ip_address_field_text_changed( text ):
	get_node("menu_background/host").set_disabled(
	    true if NETWORK.verify_ipv4_address(text) else false
	)