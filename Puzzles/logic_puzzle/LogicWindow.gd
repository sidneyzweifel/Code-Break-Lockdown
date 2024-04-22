extends Window

@onready var logic_popup_window = $"."
@onready var logicQuestion = Global.get_logic_question()
@onready var solvedQuestion = Global.solve_logic_question(logicQuestion)

var number_input : LineEdit
var binary_button : BinaryButton
var no_access_button : NoAccessButton


func _ready():
	logic_popup_window.hide()
	
	# handles line input on enter
	number_input = $LineEdit
	binary_button = $"../../BinaryPopUp/BinaryButton"
	no_access_button = $"../../NoAccessGuide/NoAccessButton"
	number_input.text = "" # clear any previous input
	number_input.focus_mode = Control.FOCUS_ALL # set focus to input field
	
	# prints question passed from LogicLabel
	print("question passed to LogicWindow: ", logicQuestion)
	# prints answer to question 
	print("answer passed to LogicWindow: ", solvedQuestion)
	
	
func _on_logic_button_pressed():
	logic_popup_window.show()
	AudioManager.screen_click.play()

func _on_close_requested():
	logic_popup_window.hide()
	AudioManager.screen_exit.play()
	
func _on_line_edit_text_submitted(text: String) -> void:
	print(solvedQuestion)
	var user_answer = int(text) # convert input text to an integer
	print(user_answer)
	
	if user_answer == solvedQuestion: # check if input is correct
		no_access_button.hide()
		binary_button.show()
		AudioManager.correct_sound.play()
		hide()
	else:
		no_access_button.show()
		binary_button.hide()
		AudioManager.incorrect_sound.play()
