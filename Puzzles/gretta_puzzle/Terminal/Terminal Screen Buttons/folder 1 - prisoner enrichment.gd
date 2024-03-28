extends Node2D

var insideFolder1 = "res://Puzzles/Puzzle1_TEST.tscn"

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
