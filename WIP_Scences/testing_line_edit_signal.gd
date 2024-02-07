extends ColorRect


func open_door(door_access):
	Global.handle_door(door_access)


func _on_line_edit_testing_line_edit(access_bool:bool):
	open_door(access_bool)
