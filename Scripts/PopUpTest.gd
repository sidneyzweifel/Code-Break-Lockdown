extends Window

#some code from this video: https://youtu.be/qo8SDCuVCoY?si=Bzc50yOhnVVNSWqR

@export var passcode:String

@onready var popup_test_ = $"."
@onready var label_text = $Label


# Called when the node enters the scene tree for the first time.
func _ready():
	#popup() #causes an error, but for now seems to work as intented 
	#popup_test_.show()
	label_text.text = "PASSCODE: 12345"
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_close_requested():
	popup_test_.hide()



func _on_button_close_popup_alt():
	_on_close_requested()


func _on_pressed():
	_on_close_requested()
