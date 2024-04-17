# writes text to the text box and plays a sound when writing it
extends CanvasLayer

# preload the variables we need to edit
@onready var textbox_container = $TextboxContainer
@onready var label = $TextboxContainer/MarginContainer/Label
@onready var text_noise = $"Text Noise"

func _ready():
	hide_textbox()
	if Global.has_shown_textbox():
		pass
	else:
		add_text("Rise and shine! It's time for your daily enrichment exercises. Head to the terminal located in the left corner of your room and get started ASAP.")

# sets the text to nothing and hides the text box
func hide_textbox():
	label.text = ""
	textbox_container.hide()

# shows the text box
func show_textbox():
	textbox_container.show()

# function that writes the text to the screen
func add_text(next_text):
	label.visible_ratio = 0 # initially hide the text
	label.text = next_text # set the text box to the new text
	textbox_container.show() # display the text box
	
	# make the text appear to be writing out to the screen
	while label.visible_characters <=len(next_text):
		text_noise.play() # play the text noise
		if label.visible_characters == -1:
			break
		label.visible_characters += 1
		await get_tree().create_timer(0.02).timeout # change 0.02 to change the speed the text is written
		
	text_noise.stop() # stop the text noise
	await get_tree().create_timer(5).timeout # wait 5 seconds
	hide_textbox() # make the textbox go away
