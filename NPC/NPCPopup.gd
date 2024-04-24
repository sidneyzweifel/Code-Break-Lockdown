extends AcceptDialog

@onready var label_text = $Label
@onready var popup = $"."

var item_num:int = 100

var dialouge_cnt:int = 0
var player_dia_cnt:int = 0
var next_option_button:Button

var inmate_key:String 

#cycles through the inmate dialogue based on inmate key

func get_key(key:String):
	inmate_key = key

func get_item_num(_item_num:int):
	item_num = _item_num

func _ready():
	if(Puzzle4Autoload.loop_door_solved):
		#start dialogue cnt here if the player is in second half of puzzle
		dialouge_cnt = 5
		player_dia_cnt = 5
	#set two options for the player to repsond with
	var dia = pick_next_dialouge_inmate(dialouge_cnt)
	label_text.text = str(dia)
	var response =  pick_next_player_response(player_dia_cnt)
	next_option_button = popup.add_button(response, false, "custom action")
	
	


func _on_confirmed():
	popup.hide()
	
	

#get inmate dialouge with the JSON file Dialogue dictionary 
#cycled through by button clicks
func pick_next_dialouge_inmate(cnt:int):
	match cnt:
		0:
			return str(Dialouge.speech_dict[inmate_key]["inmate_beckon"])
		1:
			return str(Dialouge.speech_dict[inmate_key]["inmate_ask"])
		2:
			var color = Dialouge.speech_dict[inmate_key]["door_color"]
			var pos = Dialouge.speech_dict[inmate_key]["door_location"]
			return "The door is " + str(pos) + " and is " + str(color)
		5:
			return str(Dialouge.speech_dict[inmate_key]["inmate_thanks"])
		6:
			return str(Dialouge.speech_dict[inmate_key]["passcode_hint"])
			
		7:
			return str("We're counting on you!")
		_:
			return str("Please get me item #") + str(item_num) + " from the machine beyond the door."
			
			

#player reponsed cycled through by inmate clicks
func pick_next_player_response(cnt:int):
	match cnt:
		0:
			return str("Yes?")
		1:
			return str("Where?")
		2:
			return str("Okay")
		5:
			return "No problem.\nNow how do I get out of here?"
		6:
			return "Okay. Thanks!"
		_:
			remove_button(next_option_button)
			return str("Got it")


#change dialouge in popup and buttons and incewase the dialogue cnt
func _on_custom_action(action):
	dialouge_cnt += 1
	player_dia_cnt += 1	
	var dia = pick_next_dialouge_inmate(dialouge_cnt)
	label_text.text = str(dia)
	var response = pick_next_player_response(player_dia_cnt)
	next_option_button.text = response
	pass # Replace with function body.






