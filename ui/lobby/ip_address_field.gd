# This class provides a dynamic UI giving feedback to the user as they type out an IP address

extends LineEdit

export (NodePath) var lobby = "../../lobby"
onready var is_good_ip

const LIGHT_CYAN = Color(.33,1,1)
const LIGHT_MAGENTA = Color(1,.33,1)

func _ready():
	is_good_ip = NETWORK.verify_ipv4_address(self.text)

func _on_ip_address_field_text_changed():
	if (self.text != ""):
		# Change the color and our "good_ip" status based on the verification of the address.
		if (NETWORK.verify_ipv4_address(self.text)):
			self.self_modulate = LIGHT_CYAN
			is_good_ip = true
		else:
			self.self_modulate = LIGHT_MAGENTA
			is_good_ip = false
		# Regardless, we want to set the ip_address so as not to confuse the user
		# by having a DIFFERENT value stored than what is displayed.
		NETWORK.ip_address = self.text
	else:
		NETWORK.ip_address = NETWORK.DEFAULT_IPV4_ADDRESS
