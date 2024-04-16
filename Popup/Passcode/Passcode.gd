extends Label

@onready var passcode_text = $"."

#Sets the passcode for each door
func _ready():
	var passcode
	if Global.get_passcode() :
		pass
	else:
		passcode= Global.set_passcode()
		passcode_text.text = "PASSCODE: " + passcode
		print(passcode)
	pass 


