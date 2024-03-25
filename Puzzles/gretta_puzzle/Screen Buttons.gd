extends Node2D

var puzzle = "res://Puzzles/Puzzle1_TEST.tscn"
func _on_area_2d_mouse_entered():
	print("enetered")
	get_child(1).hide()
	get_child(0).show()
	pass


func _on_area_2d_mouse_exited():
	print("exited")
	get_child(1).show()
	get_child(0).hide()
	pass


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		SceneTransition.change_scene_to_file(puzzle) # Replace with function body.
