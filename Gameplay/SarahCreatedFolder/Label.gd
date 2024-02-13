extends Label

@onready var passcode_text = $"."

var temp_dummy_passcode = 77777


func _ready():
	#var passcode= Global.set_passcode()
	passcode_text.text = "PASSCODE: " + temp_dummy_passcode
	pass 


