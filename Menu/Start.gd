extends Button

@export var puzzle_1:String
@export var puzzle_select:String

func _ready():
	%titleMusic.play()
	
	
func _on_pressed():
	%titleMusic.stop()
	SceneTransition.change_scene_to_file(puzzle_1)



func _on_puzzle_select_pressed():
	SceneTransition.change_scene_to_file(puzzle_select)
