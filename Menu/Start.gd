extends Button

@export var puzzle_1:String
@export var puzzle_select:String

func _ready():
	# check is the title music is already playing
	if MusicPlayer.title_music_playing():
		pass # if it is, just leave it alone
	else:
		# if it isn't, play it
		MusicPlayer.play_title_music()
	# for PUZZLE 1, generate the passcodes for the doors that arn't our main door(these passcodes don't do anything)
	Global.set_door_passcodes()
	# for PUZZLE 1, set the light color of the door
	Global.set_door_color()
	# for PUZZLE 1, set the number of the door
	Global.set_door_number()
	# for PUZZLE 1, set the pairs for what door number corresponds to what door light color
	Global.set_door_pairs()
	# for PUZZLE 1, initially set the previous terminal screen to the home screen
	#(this is used for saving what screen the player was on when they leave and go
	# back onto the terminal)
	Global.set_previous_terminal_window("res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Home Terminal Screen.tscn")
	
	
func _on_pressed():
	# go to the title card and start playing the transition music
	MusicPlayer.play_transition_music()
	SceneTransition.change_scene_to_file("res://Menu/Title.tscn")



func _on_puzzle_select_pressed():
	# go to the puzzle select screen
	SceneTransition.change_scene_to_file(puzzle_select)


func _on_exit_pressed():
	get_tree().quit()
