class_name Door_Info_Puz4 extends Node2D

var path_to_new_scene:String
var passcode_scene:String
var path_current_puzzle:String

#info for each of the loop doors 
#need this info so player goes back to correct scene after loop UI
func _init():
	path_to_new_scene = "res://Puzzles/Puzzle4_TEST.tscn"
	passcode_scene = "res://Puzzles/loops_puzzle/UI Loops.tscn"
	path_current_puzzle = path_to_new_scene
	
	
	

