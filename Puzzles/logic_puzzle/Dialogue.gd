extends CanvasLayer

# Preload the variables we need to edit
@onready var textbox_container = $TextboxContainer
@onready var label = $TextboxContainer/MarginContainer/Label


func _ready():
	hide_textbox()
	if Global.has_shown_textbox():
		pass
	

# Sets the text to nothing and hides the text box
func hide_textbox():
	label.text = ""
	textbox_container.hide()

# Shows the text box
func show_textbox():
	textbox_container.show()

# Function that writes the text to the screen
func add_text(next_text):
	label.visible_ratio = 0  # Initially hide the text
	label.text = next_text  # Set the text box to the new text
	textbox_container.show()  # Display the text box
	
	# Make the text appear to be writing out to the screen
	while label.visible_characters <= len(next_text):
		AudioManager.text_sound.play()
		if label.visible_characters == -1:
			break
		label.visible_characters += 1
		await get_tree().create_timer(0.02).timeout  # Change 0.02 to change the speed the text is written
	
	AudioManager.text_sound.stop()
	await get_tree().create_timer(5).timeout  # Wait 5 seconds
	hide_textbox()  # Make the textbox go away


# Callback for NPC button pressed
func _on_npc_button_pressed():
	add_text("Hm? Are you having trouble figuring out how to get through the door? Luckily, you're not the first of us prisoners to try escaping. Have you tried looking around the cafeteria for clues about how to break into the security system? .....You didn't hear it from me though!!")


