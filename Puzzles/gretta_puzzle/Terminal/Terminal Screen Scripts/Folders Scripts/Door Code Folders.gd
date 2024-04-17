# shows the code for the door that is selected from the line input on the 
# the terminal screen
extends Node2D

# back to screen is used when the input is invalid
# previous screen is used when the player types the keyword BACK
var backToScreen = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Prisoner Door Codes Screen.tscn"
var previousScreen ="res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Security Screen.tscn"

# initially previous child is 0
var previousChild = 0

# getting the door number and passcode that correlates to the door the player 
# has to interact with to leave the room
# also get the randomly generated door passcodes for the other doors
var door_number = Global.get_door_number()
var passcode = Global.get_passcode()
var door_passcode = Global.get_door_passcodes()

func _ready():
	# hide the window and all children (the door codes)
	%Window.hide()
	%codes.get_child(0).hide()
	%codes.get_child(1).hide()
	%codes.get_child(2).hide()
	%codes.get_child(3).hide()
	%codes.get_child(4).hide()
	
# show the passcode that opens the door if the door the user types is the 
# door for their room otherwise show the passcode that was generated
func _on_prisoner_door_codes_screen__line_edit_text_submitted(new_text):

	if new_text == "PRINT door 1 code":
		if door_number == "1": # if our door is door 1, show the passcode that opens the door
			%"door 1 code".get_child(0).set_text(passcode)
		else:
			# if it isnt our door, show the passcode that was generated for the door 
			# (but doesn't really matter/do anything)
			%"door 1 code".get_child(0).set_text(door_passcode["1"])
		%codes.get_child(previousChild).hide() # hide the previous code/sprite
		%Window.show() # display the window
		%codes.get_child(0).show() # show the code/sprite for the right input
		previousChild = 0 # set the previous child to the code/sprite currently being shown so we can hide it before showing the correct one
	elif new_text == "PRINT door 2 code":
		if door_number == "2": # if our door is door 2, show the passcode that opens the door
			%"door 2 code".get_child(0).set_text(passcode)
		else:
			# if it isnt our door, show the passcode that was generated for the door 
			# (but doesn't really matter/do anything)
			%"door 2 code".get_child(0).set_text(door_passcode["2"])
		%codes.get_child(previousChild).hide()
		%Window.show() 
		%codes.get_child(1).show()
		previousChild = 1
	elif new_text == "PRINT door 3 code":
		if door_number == "3": # if our door is door 3, show the passcode that opens the door
			%"door 3 code".get_child(0).set_text(passcode)
		else:
			# if it isnt our door, show the passcode that was generated for the door 
			# (but doesn't really matter/do anything)
			%"door 3 code".get_child(0).set_text(door_passcode["3"])
		%codes.get_child(previousChild).hide()
		%Window.show()
		%codes.get_child(2).show()
		previousChild = 2
	elif new_text == "PRINT door 4 code":
		if door_number == "4": # if our door is door 4, show the passcode that opens the door
			%"door 4 code".get_child(0).set_text(passcode)
		else:
			# if it isnt our door, show the passcode that was generated for the door 
			# (but doesn't really matter/do anything)
			%"door 4 code".get_child(0).set_text(door_passcode["4"])
		%codes.get_child(previousChild).hide()
		%Window.show()
		%codes.get_child(3).show()
		previousChild = 3
	elif new_text == "PRINT door 5 code":
		if door_number == "5": # if our door is door 5, show the passcode that opens the door
			%"door 5 code".get_child(0).set_text(passcode)
		else:
			# if it isnt our door, show the passcode that was generated for the door 
			# (but doesn't really matter/do anything)
			%"door 5 code".get_child(0).set_text(door_passcode["5"])
		%codes.get_child(previousChild).hide()
		%Window.show()
		%codes.get_child(4).show()
		previousChild = 4
	elif new_text == "BACK": # if BACK is typed go to the previous screen
		SceneTransition.change_scene_to_file(previousScreen) 
	else: # if input isn't valid, play the wrong input animation
		WrongInput.change_scene_to_file(backToScreen) 

# close the window when the x is pressed
func _on_window_close_requested():
	%Window.hide()
