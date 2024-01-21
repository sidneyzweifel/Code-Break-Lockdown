extends Window

#some code from this video: https://youtu.be/qo8SDCuVCoY?si=Bzc50yOhnVVNSWqR

@onready var popup_test_ = $"."


signal hallway_button
# Called when the node enters the scene tree for the first time.
func _ready():
	popup_test_.show()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_close_requested():
	popup_test_.hide()


#my own code
func _on_button_pressed():
	hallway_button.emit()
