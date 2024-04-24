extends AcceptDialog

var added_btn_1:Button
var added_btn_2:Button


#button to add hint, if clicked runs on_custom_action function with "action"
func _ready():
	added_btn_1 = $".".add_button("Get Hint", false, "action")
	



func _on_close_requested():
	print("on close rewuated")
	queue_free()


func _on_custom_action(action):
	if action == "action":
		$".".title = "Hint"
		$ColorRect.modulate = Color(0, 0.9, 1, 1) #change background color of popup to blue
		$Label.set_text("Which holds true?")
		added_btn_2 = $".".add_button("Requested item < starting index", true, "smaller")
		remove_button(added_btn_1)
		added_btn_1 = $".".add_button("Requested item > starting index", false, "larger")
		#hints based on if the requested item is smaller or not
	if action == "smaller":
		$Label.set_text("Use > or >= and --")
		added_btn_1.hide()
		added_btn_2.hide()
	if action == "larger":
		$Label.set_text("Use < or <= and ++")
		added_btn_1.hide()
		added_btn_2.hide()
		
	


func _on_mouse_exited():
	print("mouse exit")
	queue_free()




func _on_confirmed():
	print("on_confimr")
	queue_free()


func _on_canceled():
	print("on cancel")
	queue_free()
