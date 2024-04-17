extends Node2D

# store the original color of the sprite
var oldModulator = self.modulate

func _ready():
	# intiially hide the hint window
	%HintWindow.hide()
	
func _on_area_2d_mouse_entered():
	var color = Color("000000") # set color to the color selected when mouse enters
	color.v = 3 # changes the brightness of the color
	set_modulate(color) # set the sprite to the color
	print("on hint")


func _on_area_2d_mouse_exited():
	set_modulate(oldModulator) # change color back when mouse leaves
	print("off hint")


func _on_area_2d_input_event(viewport, event, shape_idx):
	# when player clicks on it show the window
	if Input.is_action_just_pressed("click"):
		%HintWindow.show()

# close the window when the x is clicked
func _on_hint_window_close_requested():
	%HintWindow.hide()
