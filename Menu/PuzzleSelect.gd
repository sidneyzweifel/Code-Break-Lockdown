extends Node2D

@onready var puz1 = $"Window/ColorRect/VBoxContainer/Puzzle 1"
@onready var puz2 = $"Window/ColorRect/VBoxContainer/Puzzle 2"
@onready var puz3 = $"Window/ColorRect/VBoxContainer/Puzzle 3"
@onready var puz4 = $"Window/ColorRect/VBoxContainer/Puzzle 4"

@onready var window = $Window

@export var puz1_path:String
@export var puz2_path:String
@export var puz3_path:String
@export var puz4_path:String

func _ready():
	var screen_size = DisplayServer.screen_get_size()
	#window.size = Vector2i(screen_size.x, screen_size.y)
	pass # Replace with function body.


func _on_puzzle_1_pressed():
	get_tree().change_scene_to_file(puz1_path)


func _on_puzzle_2_pressed():
	get_tree().change_scene_to_file(puz2_path)


func _on_puzzle_3_pressed():
	get_tree().change_scene_to_file(puz3_path)


func _on_puzzle_4_pressed():
	get_tree().change_scene_to_file(puz4_path)
