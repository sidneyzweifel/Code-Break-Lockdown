extends Label

@onready var passcode_text = $"."

#Sets the passcode for each door
# for puzzle 1 when i exited the terminal it would generate a new
# passcode every time i left the terminal scene and went back to 
# the puzzle 1 scene, so i added a check if there already is a passcode
func _ready():
	var passcode
	if Global.get_passcode() : # if there is a passcode do nothing
		pass
	else: # otherwise set a passcode
		passcode= await Global.set_passcode() # await must be here or there will be an error
		passcode_text.text = "PASSCODE: " + passcode
		print(passcode)
