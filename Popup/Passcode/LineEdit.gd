extends LineEdit

@onready var dummy_ID:String
#labels that aren't working the way I would like, but works for now
@onready var label = $"../Label"
@onready var access_label = $"../AcessLabel"

#start with no door access, but not wrong code
#i.e player closed the passcode scene
var door_access = 0
var cur_puzz:String

func _ready():
	access_label.hide() #doesn't even work right now
	cur_puzz = Global.get_current_puzzle() #for some reason I seem to need this line to change puzzles


func _process(delta):
	check_access_status() #check whether player has access or not
	pass



func _on_text_submitted(new_text):
	dummy_ID = Global.get_passcode() #set dummy_ID to the real door ID
	if new_text == dummy_ID:
		#styling stuff that doesn't work for some reason
		var green =  Color(0.0,1.0,0.0,1.0)
		set("theme_override_colors/font_color", green)
		label.hide()
		access_label.text = "ACCESS GRANTED"
		access_label.show()
		door_access = 1 #set door_access granted
		Global.set_passcode()
		print("in text submitted, new passcode is: "+Global.get_passcode())
		%success.play()
	else:
		#stlying stuff that doesn't work when changing scenes
		var red =  Color(1.0,0.0,0.0,1.0)
		set("theme_override_colors/font_color", red)
		label.show()
		WrongInput.change_scene_to_file("res://Puzzles/Puzzle1_TEST.tscn")
		door_access = -1 #set to access denied 
	


#a signal that is supposed to make the text the user enters blue
func _on_text_changed(new_text):
	var blue =  Color(0.0,0.0,1.0,1.0)
	set("theme_override_colors/font_color", blue)

	

#call global script to go to next puzzle
func open_door(access_status):
	Global.handle_door(access_status)
	


func check_access_status():
	match door_access:
		1:
			open_door(true) #access granted
		0:
			pass #access not granted but not denied
		-1:
			open_door(false) #access denied
	
	


	
