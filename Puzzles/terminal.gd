extends Node2D

# store the original color of the modulator
var oldModulator = self.modulate

func _on_area_2d_mouse_entered():
	var color = Color(255, 255, 255)
	color.v = 1.1
	set_modulate(color)
	print("mouse on")
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	set_modulate(oldModulator)
	print("mouse left")
	pass # Replace with function body.


func _on_area_2d_input_event(viewport, event, shape_idx):
	pass # Replace with function body.
