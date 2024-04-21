class_name Door extends StaticBody2D

#Script for each door
#add doors to door group to work with player collison


#Must provide for each door: the next scene after the door, a passcode scene, and the current scene 
#that the puzzle is instationated on
@export var path_to_new_scene:String
@export var passcode_scene:String
@export var path_current_puzzle:String

# store the original color of the modulator for the terminal
var oldModulator = "fe7f00"


#door group function to determine if player can move to next puzzle
func handle_access(door_access):
	if door_access:
		pass
	else:
		Global.go_to_passcode(passcode_scene, path_current_puzzle, path_to_new_scene)
	return


func _on_button_pressed():
	handle_access(false)

func _on_button_mouse_entered():
	var color = Color("fea600") # set color to white
	color.v = 1.1 # changes the brightness of the color
	%doorColor.color = color
	print("mouse on door")


func _on_button_mouse_exited():
	var color = Color("fe7f00") # set color to white
	color.v = 1.1 # changes the brightness of the color
	%doorColor.color = color
	print("mouse off door")
