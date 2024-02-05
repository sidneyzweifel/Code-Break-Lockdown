
extends Node


var door_path = preload("res://WIP_Scences/passcode_enter.tscn")



func handle_door():
	print("door interaction")
	var _current_scene = get_tree().current_scene
	print(_current_scene)
	get_tree().change_scene_to_file(door_path)
	return

