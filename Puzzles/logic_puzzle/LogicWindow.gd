extends Window

@onready var logic_popup_window = $"."
var number_input : LineEdit
var binary_button : BinaryButton
var binary_sprite : BinarySprite
@onready var logicQuestion = Global.get_logic_question()
@onready var solvedQuestion = Global.solve_logic_question(logicQuestion)

func _ready():
	logic_popup_window.hide()
	
	# handles line input on enter
	number_input = $LineEdit
	binary_button = $"../../BinaryPopUp/BinaryButton"
	binary_sprite = $"../../BinaryPopUpHover/Area2D/BinarySprite"
	number_input.text = "" # clear any previous input
	number_input.focus_mode = Control.FOCUS_ALL # set focus to input field
	
	# prints question passed from LogicLabel
	print("question passed to LogicWindow: ", logicQuestion)
	# prints answer to question 
	print("answer passed to LogicWindow: ", solvedQuestion)
	
	
func _on_logic_button_pressed():
	logic_popup_window.show()


func _on_close_requested():
	logic_popup_window.hide()


func _on_line_edit_text_submitted(text: String) -> void:
	print(solvedQuestion)
	var user_answer = int(text) # convert input text to an integer
	print(user_answer)
	
	if user_answer == solvedQuestion: # check if input is correct
		binary_button.show()
		binary_sprite.show()
		hide()
	else:
		binary_button.hide()
		binary_sprite.hide()
		# add loud incorrect buzzer
	
