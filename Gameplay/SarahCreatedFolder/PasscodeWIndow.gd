extends Window

#some code from this video: https://youtu.be/qo8SDCuVCoY?si=Bzc50yOhnVVNSWqR


@onready var popup_ = $"."



# Called when the node enters the scene tree for the first time.
func _ready():

	pass



func _on_close_requested():
	popup_.hide()






func _on_button_pressed():
	popup_.show()
