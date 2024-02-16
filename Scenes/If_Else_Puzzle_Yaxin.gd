extends Node2D

@onready var popup = $Window

func _ready():
	popup.show()
	
func _on_window_close_requested():
	popup.hide()

#func _on_button_pressed():
	#get_tree().change_scene_to_file("res://Scenes/Main.tscn")

