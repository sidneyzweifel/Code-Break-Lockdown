extends Button

@export var puzzle_1:String
@export var puzzle_select:String

func _ready():
	if MusicPlayer.title_music_playing():
		pass
	else:
		MusicPlayer.play_title_music()
	Global.set_door_color()
	Global.set_door_number()
	Global.set_door_pairs()
	
	
func _on_pressed():
	MusicPlayer.play_transition_music()
	SceneTransition.change_scene_to_file("res://Menu/Title.tscn")



func _on_puzzle_select_pressed():
	SceneTransition.change_scene_to_file(puzzle_select)
