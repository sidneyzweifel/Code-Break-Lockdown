extends Window

@onready var logic_popup_window = $"."
var number_input : LineEdit
var binary_button : BinaryButton

func _ready():
	logic_popup_window.hide()
	
	number_input = $LineEdit
	binary_button = $"../../BinaryPopUp/BinaryButton"
	number_input.text = "" # Clear any previous input
	number_input.focus_mode = Control.FOCUS_ALL # Set focus to the input field

func _on_logic_button_pressed():
	logic_popup_window.show()

func _on_close_requested():
	logic_popup_window.hide()

func _on_line_edit_text_submitted(text: String) -> void:
	var number = int(text) # convert input text to an integer
	
	if number != 0: # Check if input is a valid number
		binary_button.hide() 
	else:
		binary_button.show()

	hide() # hide window after processing input
