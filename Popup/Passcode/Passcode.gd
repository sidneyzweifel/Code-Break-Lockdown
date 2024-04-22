extends Label

@onready var passcode_text = $"."

#Sets the passcode for each door
func _ready():
	#need to wait to set passcode until the override_passcode has been emitted
	#this only applies in second half of puzzle 4
	var passcode =  await Global.set_passcode()
	#used for debugging purposes to check current passcode
	passcode_text.text = "PASSCODE: " + passcode
	print("PASSCODE: " + passcode)
	pass 


