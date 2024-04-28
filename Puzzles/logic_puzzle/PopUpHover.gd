extends Node2D

# store the original color of the modulator
var oldModulator = self.modulate


func _on_area_2d_mouse_entered():
	var color = Color(0, 0, 0)
	color.v = 1.1
	set_modulate(color)


func _on_area_2d_mouse_exited():
	set_modulate(oldModulator)



