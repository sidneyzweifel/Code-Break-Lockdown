extends Window

@onready var popup_window_ = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	popup_window_.show()
	

func _on_close_requested():
	popup_window_.hide()
