extends Control

const DEFAULT_PORT = 9080
const DEFAULT_IPV4_ADDRESS = "127.0.0.1"
export(String) var ip_address = DEFAULT_IPV4_ADDRESS
export(int) var server_port = DEFAULT_PORT

onready var gamestate = get_tree().get_root().get_node("root/gamestate")

func _ready():
	pass

func _on_host_button_down():
	var host = NetworkedMultiplayerENet.new()
	host.create_server(server_port, 2)
	get_tree().set_network_peer(host)
	print("Connecting host...\nUnique Network ID: " + str(get_tree().get_network_unique_id())
	+ "\nServer Port: " + str(server_port) + "\nIP Address: " +  ip_address)

func _on_join_button_down():
	print(get_tree().is_network_server())
	var host = NetworkedMultiplayerENet.new()
	host.create_client(ip_address, server_port)
	get_tree().set_network_peer(host)
	print("Connecting client...\nUnique Network ID: " + str(get_tree().get_network_unique_id())
	+ "\nServer Port: " + str(server_port) + "\nIP Address: " +  ip_address)

func _on_back_button_up():
	# Cancel our hosting or our attempt to join
	get_tree().set_network_peer(null)
	# Hide the lobby
	hide()
	# Show the main menu again
	get_node("../mainmenu").show()

func reset_ip():
	ip_address = DEFAULT_IPV4_ADDRESS

func reset_port():
	server_port = DEFAULT_PORT

func verify_ipv4_address(ip):
	# Split up the IP address by periods
	var split_ip = ip.split(".")
	if (split_ip.size() != 4):
		return false
	for ip_segment in split_ip:
		# get the integer representation of the segment
		var int_segment = ip_segment.to_int()
		# if it does not fall within the valid range, return false
		if (int_segment < 0 || int_segment > 255):
			return false

func _on_username_field_text_changed( text ):
	gamestate.my_info['username'] = text
