extends Label

@onready var passcode_text = $"."

#Sets the passcode for each door
# for puzzle 1 when i exited the terminal it would generate a new
# passcode every time i left the terminal scene and went back to 
# the puzzle 1 scene, so i added a check if there already is a passcode
func _ready():
	var passcode= Global.set_passcode()
	passcode_text.text = "PASSCODE: " + passcode
	print("PASSCODE: " + passcode)
	pass 


	var passcode
	if Global.get_passcode() : # if there is a passcode do nothing
		pass
	else: # otherwise set a passcode
		passcode= Global.set_passcode()
		passcode_text.text = "PASSCODE: " + passcode
		print(passcode)
