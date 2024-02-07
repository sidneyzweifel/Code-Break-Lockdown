extends Label

@onready var passcode_text = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	var passcode= Global.set_passcode()
	passcode_text.text = "PASSCODE: " + passcode
	print(passcode)
	#passcode_set.emit("PASSCODE: *****")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
