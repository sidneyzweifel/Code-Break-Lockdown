extends Window

#some code from this video: https://youtu.be/qo8SDCuVCoY?si=Bzc50yOhnVVNSWqR

@export var passcode:String

@onready var popup_test_ = $"."
@onready var label_text = $Label


# Called when the node enters the scene tree for the first time.
func _ready():

	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_close_requested():
	popup_test_.hide()




