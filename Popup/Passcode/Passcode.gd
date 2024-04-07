extends Label

@onready var passcode_text = $"."

#Sets the passcode for each door
func _ready():
	var passcode= Global.set_passcode()
	passcode_text.text = "PASSCODE: " + passcode
	print("PASSCODE: " + passcode)
	pass 


