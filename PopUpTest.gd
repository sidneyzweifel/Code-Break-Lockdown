extends Window

#current code from this video: https://youtu.be/qo8SDCuVCoY?si=Bzc50yOhnVVNSWqR

@onready var popup_test_ = $"."
@onready var button_pressed = $TextureRect/BoxContainer/VBoxContainer/Hallway
# Called when the node enters the scene tree for the first time.
func _ready():
	popup_test_.show()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_close_requested():
	popup_test_.hide()
	
	

