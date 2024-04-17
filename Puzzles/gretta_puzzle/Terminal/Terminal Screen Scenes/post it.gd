extends Node2D

# store the original color of the modulator
var oldModulator = self.modulate

func _ready():
	%PostItWindow.hide()
	
func _on_area_2d_mouse_entered():
	var color = Color(0, 0, 0)
	color.v = 1.1
	set_modulate(color)
	print("on terminal")
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	set_modulate(oldModulator)
	print("off terminal")
	pass # Replace with function body.


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		%PostItWindow.show()

func _on_post_it_window_close_requested():
	%PostItWindow.hide()
