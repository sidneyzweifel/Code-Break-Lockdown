# this script makes the post it note sprite highlight when a mouse
# is hovering over it and when it is clicked it shows a window
# containing the post it note contents
extends Node2D

# store the original color post it sprite
var oldModulator = self.modulate

func _ready():
	# intially hide the post it note window
	%PostItWindow.hide()
	
func _on_area_2d_mouse_entered():
	var color = Color(0, 0, 0) # set the color to white
	color.v = 1.1 # changes the brightness of the color
	set_modulate(color) # set the sprite to the color
	print("on post it")

func _on_area_2d_mouse_exited():
	set_modulate(oldModulator) # put the post it sprite back to original color
	print("off post it")

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		%PostItWindow.show()

# close the window when x is clicked
func _on_post_it_window_close_requested():
	%PostItWindow.hide()
