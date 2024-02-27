extends AcceptDialog

@onready var label_text = $Label
@onready var popup = $"."

var item_num:int = 100

var dialouge_cnt:int = 0
var player_dia_cnt:int = 0

@export var inmate_key:String


func _ready():
	var dia = pick_next_dialouge_inmate(dialouge_cnt)
	label_text.text = str(dia)
	var response =  pick_next_player_response(player_dia_cnt)
	popup.ok_button_text = response



func _on_confirmed():
	dialouge_cnt += 1
	player_dia_cnt += 1
	var dia = pick_next_dialouge_inmate(dialouge_cnt)
	label_text.text = str(dia)
	var response = pick_next_player_response(player_dia_cnt)
	popup.ok_button_text = response
	
	

func pick_next_dialouge_inmate(cnt:int):
	match cnt:
		0:
			return str(Dialouge.speech_dict[inmate_key]["inmate_beckon"])
		1:
			return str(Dialouge.speech_dict[inmate_key]["inmate_ask"])
		2:
			var color = Dialouge.speech_dict[inmate_key]["door_color"]
			var pos = Dialouge.speech_dict[inmate_key]["door_location"]
			return "It's " + str(pos) + " and is " + str(color)
		_:
			return str("Please get me item #")
			
			
			
func pick_next_player_response(cnt:int):
	match cnt:
		0:
			return str("Yes?")
		1:
			return str("Where?")
		2:
			return str("Okay")
		_:
			return str("Got it")
