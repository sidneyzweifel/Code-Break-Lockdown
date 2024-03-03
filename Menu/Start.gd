extends Button

@export var puzzle_1:String
@export var puzzle_select:String


func _on_pressed():
	get_tree().change_scene_to_file(puzzle_1)



func _on_puzzle_select_pressed():
	# delete this
	print("puzzle_select variable " +puzzle_select)
	get_tree().change_scene_to_file(puzzle_select)
