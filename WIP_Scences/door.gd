class_name Door extends StaticBody2D

signal player_tries_door(door:Door)

@export var path_to_new_scene:String
@export var entry_door_name:String

func get_next_puzzle():
	print("in next puzzle")
	Global.next_door(path_to_new_scene)
	return
