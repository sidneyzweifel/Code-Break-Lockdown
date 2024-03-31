extends Node2D

var insideFolder1 = "res://Puzzles/Puzzle1_TEST.tscn"
var insideFolder2 = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Employees Only Screen.tscn"

func _on_folder_1__area_2d_mouse_entered():
	print("entered")
	get_child(1).hide()
	get_child(0).show()
	pass


func _on_folder_1__area_2d_mouse_exited():
	print("exited")
	get_child(1).show()
	get_child(0).hide()
	pass


func _on_folder_1__area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		SceneTransition.change_scene_to_file(insideFolder1) # Replace with function body.


func _on_line_edit_text_submitted(new_text):
	
	# put input to all lowercase to ensure no issues with case sensitivity
	new_text = new_text.to_lower()
	
	# go to the correct scene based on inputted text
	if new_text == "open prisoner enrichment":
		SceneTransition.change_scene_to_file(insideFolder1) 
	elif new_text == "open employees only!":
		SceneTransition.change_scene_to_file(insideFolder2)
	else:
		WrongInput.change_scene_to_file("res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Home Terminal Screen.tscn") # if input doesn't work, play the wrong input animation
