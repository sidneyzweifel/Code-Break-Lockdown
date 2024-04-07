extends AcceptDialog

@onready var label_text = $Label
@onready var popup = $"."

var item_num:int = 100

var dialouge_cnt:int = 0
var player_dia_cnt:int = 0
var next_option_button:Button

var inmate_key:String 

func get_key(key:String):
	inmate_key = key

func get_item_num(_item_num:int):
	item_num = _item_num

func _ready():
	var dia = pick_next_dialouge_inmate(dialouge_cnt)
	label_text.text = str(dia)
	var response =  pick_next_player_response(player_dia_cnt)
	next_option_button = popup.add_button(response, false, "custom action")

	



func _on_confirmed():
	popup.hide()
	
	

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
		_:
			return str("Please get me item #") + str(item_num) + " from the machine beyond the door"
			
			
			
func pick_next_player_response(cnt:int):
	match cnt:
		0:
			return str("Yes?")
		1:
			return str("Where?")
		2:
			return str("Okay")
		_:
			remove_button(next_option_button)
			return str("Got it")


func _on_custom_action(action):
	dialouge_cnt += 1
	player_dia_cnt += 1	
	var dia = pick_next_dialouge_inmate(dialouge_cnt)
	label_text.text = str(dia)
	var response = pick_next_player_response(player_dia_cnt)
	next_option_button.text = response
	pass # Replace with function body.






