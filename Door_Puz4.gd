class_name Door_Puz4 extends Node2D

@onready var door = $Door

#Script for each door
#add doors to door group to work with player collison


#Must provide for each door: the next scene after the door, a passcode scene, and the current scene 
#that the puzzle is instationated on
@export var path_to_new_scene:String
@export var passcode_scene:String
@export var path_current_puzzle:String

signal button_pressed

func _ready():
	door.path_to_new_scene = path_to_new_scene
	door.passcode_scene = passcode_scene
	door.path_current_puzzle = path_current_puzzle

#door group function to determine if player can move to next puzzle
func handle_access(door_access):
	door.handle_access(door_access)



func _on_ready():
	pass