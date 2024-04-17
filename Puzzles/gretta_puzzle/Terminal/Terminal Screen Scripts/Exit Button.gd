# script that changes the exit button to a grayed out version
# when the player hovers over it
extends Node2D

# the file path for puzzle 1 (when the player clicks the exit button
# they go there)
var puzzle = "res://Puzzles/Puzzle1_TEST.tscn"

func _on_area_2d_mouse_entered():
	print("entered exit button")
	# show the hovered exit button when the mouse enters
	get_child(1).hide() # default exit sprite
	get_child(0).show() # hovered exit sprite


func _on_area_2d_mouse_exited():
	print("exited exit button")
	# show default exit sprite when mouse leaves
	get_child(1).show() # default exit sprite
	get_child(0).hide() # hovered exit sprite

# if the player clicks the exit button, bring them back to puzzle 1
func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		SceneTransition.change_scene_to_file(puzzle)
