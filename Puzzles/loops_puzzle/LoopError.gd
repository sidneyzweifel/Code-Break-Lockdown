extends AcceptDialog

var added_btn_1:Button
var added_btn_2:Button
# Called when the node enters the scene tree for the first time.
func _ready():
	added_btn_1 = $".".add_button("Get Hint", false, "action")
	



func _on_close_requested():
	$".".hide()


func _on_custom_action(action):
	if action == "action":
		$".".title = "Hint"
		$ColorRect.modulate = Color(0, 0.9, 1, 1)
		$Label.set_text("Which holds true?")
		added_btn_2 = $".".add_button("Requested item < starting index", true, "smaller")
		remove_button(added_btn_1)
		added_btn_1 = $".".add_button("Requested item > starting index", false, "larger")
	if action == "smaller":
		$Label.set_text("Use < or <= and ++")
		added_btn_1.hide()
		added_btn_2.hide()
	if action == "larger":
		$Label.set_text("Use > or >= and --")
		added_btn_1.hide()
		added_btn_2.hide()
		
	
