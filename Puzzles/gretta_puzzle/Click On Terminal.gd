# this is a script for when the player clicks on the terminal
# sprite in the room in puzzle 1
# it modulates the sprite so that it glows when hovered and 
# will bring them to the terminal screen scene when clicked
extends Node2D

# store the original color of the modulator for the terminal
var oldModulator = self.modulate

# when the mouse hovers over the terminal
func _on_area_2d_mouse_entered():
	var color = Color(0, 0, 0) # set color to white
	color.v = 1.1 # changes the brightness of the color
	set_modulate(color) # set the terminal sprite to new color
	print("mouse on terminal")

# when mouse leaves 
func _on_area_2d_mouse_exited():
	set_modulate(oldModulator) # sets terminal sprite to old color when mouse leaves
	print("mouse off terminal")

# when player clicks on the terminal sprite
func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		# scene transition is a global script that fades into the next scene
		# call this instead of SceneTree.set_current_scene()
		
		# Global.get_previous_terminal_widow() is a function that saves the screen
		# of the terminal when the player exits it so the player can go back to
		# screen they left when reentering the terminal
		SceneTransition.change_scene_to_file(Global.get_previous_terminal_window()) 
