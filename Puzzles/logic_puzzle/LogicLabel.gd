class_name LogicLabel extends Label

# variable for LogicLabel
@onready var logic_label = $"." 
# calls global script to create random logic question
@onready var logic_question = Global.set_logic_question()

func _ready():
	logic_label.text = logic_question # displays logic question
	print("question passed to LogicLabel: " + logic_question) # print question

