extends Node2D

# store the original color of the modulator
var oldModulator = self.modulate

var terminal_screen = "res://Puzzles/gretta_puzzle/TerminalScreen.tscn"

func _on_area_2d_mouse_entered():
	var color = Color(255, 255, 255)
	color.v = 1.1
	set_modulate(color)
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	set_modulate(oldModulator)
	pass # Replace with function body.


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		get_tree().change_scene_to_file(terminal_screen) # Replace with function body.
