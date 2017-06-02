extends LineEdit

onready var lobby = get_tree().get_root().get_node("root/lobby")
onready var is_good_ip

const GREEN = Color(0,1,0)
const RED = Color(1,0,0)

func _ready():
	is_good_ip = lobby.verify_ipv4_address(self.text)

func _on_ip_address_field_text_changed():
	if (self.text != ""):
		# Change the color and our "good_ip" status based on the verification of the address.
		if (lobby.verify_ipv4_address(self.text)):
			self.self_modulate = GREEN
			is_good_ip = true
		else:
			self.self_modulate = RED
			is_good_ip = false
		# Regardless, we want to set the ip_address so as not to confuse the user
		# by having a DIFFERENT value stored than what is displayed.
		lobby.ip_address = self.text
	else:
		lobby.reset_ip()
