extends Node2D

@onready var puz1 = $"ColorRect/Puzzle 1"
@onready var puz2 = $"ColorRect/Puzzle 2"
@onready var puz3 = $"ColorRect/Puzzle 3"
@onready var puz4 = $"ColorRect/Puzzle 4"


@export var puz1_path:String
@export var puz2_path:String
@export var puz3_path:String
@export var puz4_path:String


func _on_puzzle_1_pressed():
	MusicPlayer.play_ambient_music()
	# go to puzzle 1 scene
	SceneTransition.change_scene_to_file(puz1_path)


func _on_puzzle_2_pressed():
	MusicPlayer.play_ambient_music()
	# go to puzzle 2 scene
	SceneTransition.change_scene_to_file(puz2_path)


func _on_puzzle_3_pressed():
	MusicPlayer.play_ambient_music()
	# go to puzzle 3 scene
	SceneTransition.change_scene_to_file(puz3_path)


func _on_puzzle_4_pressed():
	MusicPlayer.play_ambient_music()
	# go to puzzle 4 scene
	SceneTransition.change_scene_to_file(puz4_path)


func _on_back_pressed():
	# go back to the main menu
	SceneTransition.change_scene_to_file("res://Menu/Menu.tscn")
