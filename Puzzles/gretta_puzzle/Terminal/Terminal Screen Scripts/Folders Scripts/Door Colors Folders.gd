# shows the color for the door that is selected from the line input on the 
# the terminal screen
extends Node2D

# back to screen is used when the input is invalid
# previous screen is used when the player types the keyword BACK
var backToScreen = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Door Colors Screen.tscn"
var previousScreen ="res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Security Screen.tscn"

# initially previous child is 0
var previousChild = 0

# getting the door number: door light color pairs and the door number
# that corresponds with the door the player accesses
var door_pairs = Global.get_door_pairs()
var door_number = Global.get_door_number()

func _ready():
	# hide the window and all children (the door color images)
	%Window.hide()
	%colors.get_child(0).hide()
	%colors.get_child(1).hide()
	%colors.get_child(2).hide()
	%colors.get_child(3).hide()
	%colors.get_child(4).hide()
	
	# print the pairs
	print(door_pairs)
	
func _on_line_edit_text_submitted(new_text):
	# go to the correct scene based on inputed text
	if new_text == "PRINT door 1 color":
		# check the pairs to know what color to display
		if door_pairs["1"] == "blue":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(0).show()
			previousChild = 0
		elif door_pairs["1"] == "green":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(1).show()
			previousChild = 1
		elif door_pairs["1"] == "purple":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(2).show()
			previousChild = 2
		elif door_pairs["1"] == "red":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(3).show()
			previousChild = 3
		elif door_pairs["1"] == "yellow":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(4).show()
			previousChild = 4
	elif new_text == "PRINT door 2 color":
		if door_pairs["2"] == "blue":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(0).show()
			previousChild = 0
		elif door_pairs["2"] == "green":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(1).show()
			previousChild = 1
		elif door_pairs["2"] == "purple":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(2).show()
			previousChild = 2
		elif door_pairs["2"] == "red":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(3).show()
			previousChild = 3
		elif door_pairs["2"] == "yellow":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(4).show()
			previousChild = 4
	elif new_text == "PRINT door 3 color":
		if door_pairs["3"] == "blue":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(0).show()
			previousChild = 0
		elif door_pairs["3"] == "green":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(1).show()
			previousChild = 1
		elif door_pairs["3"] == "purple":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(2).show()
			previousChild = 2
		elif door_pairs["3"] == "red":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(3).show()
			previousChild = 3
		elif door_pairs["3"] == "yellow":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(4).show()
			previousChild = 4
	elif new_text == "PRINT door 4 color":
		if door_pairs["4"] == "blue":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(0).show()
			previousChild = 0
		elif door_pairs["4"] == "green":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(1).show()
			previousChild = 1
		elif door_pairs["4"] == "purple":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(2).show()
			previousChild = 2
		elif door_pairs["4"] == "red":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(3).show()
			previousChild = 3
		elif door_pairs["4"] == "yellow":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(4).show()
			previousChild = 4
	elif new_text == "PRINT door 5 color":
		if door_pairs["5"] == "blue":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(0).show()
			previousChild = 0
		elif door_pairs["5"] == "green":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(1).show()
			previousChild = 1
		elif door_pairs["5"] == "purple":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(2).show()
			previousChild = 2
		elif door_pairs["5"] == "red":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(3).show()
			previousChild = 3
		elif door_pairs["5"] == "yellow":
			%colors.get_child(previousChild).hide()
			%Window.show()
			%colors.get_child(4).show()
			previousChild = 4
	elif new_text == "BACK": # go back to the previous screen
		SceneTransition.change_scene_to_file(previousScreen)
	else:
		WrongInput.change_scene_to_file(backToScreen) # if input doesn't work, play the wrong input animation

# close the window when the x is pressed
func _on_window_close_requested():
	%Window.hide()
