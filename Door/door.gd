class_name Door extends StaticBody2D

#signal player_tries_door(door:Door)

#@onready var passcode = $passcode_enter

#var passcode_scene = preload("res://WIP_Scences/passcode_enter.tscn")

@export var path_to_new_scene:String
@export var passcode_scene:String
@export var path_current_puzzle:String

#@onready var passcode_scene:PackedScene = preload("res://WIP_Scences/passcode_enter.tscn")

func go_to_next_puzzle():
	Global.next_door(path_to_new_scene)
	return



func handle_access(door_access):
	print("in handle acess")
	if door_access:
		go_to_next_puzzle()
	else:
		Global.go_to_passcode(passcode_scene, path_current_puzzle, path_to_new_scene)
#		var passcode_s = passcode_scene.instantiate()
#		add_child(passcode_s)
	return
