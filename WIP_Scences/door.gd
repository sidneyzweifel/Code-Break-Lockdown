class_name Door extends StaticBody2D

#signal player_tries_door(door:Door)

#@onready var passcode = $passcode_enter

#var passcode_scene = preload("res://WIP_Scences/passcode_enter.tscn")

@export var path_to_new_scene:String
@export var entry_door_name:String
@export var door_passcode_scene:String

@onready var passcode_scene:PackedScene = preload("res://WIP_Scences/passcode_enter.tscn")

func go_to_next_puzzle():
	Global.next_door(path_to_new_scene)
	return

func provide_path_to_next_puzzle():
	return path_to_new_scene

func handle_access(door_access):
	print("in handle acess")
	if door_access:
		go_to_next_puzzle()
	else:
		Global.go_to_passcode(door_passcode_scene)
#		var passcode_s = passcode_scene.instantiate()
#		add_child(passcode_s)
	return
