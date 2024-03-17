extends Node


###USED FOLLOWING: https://www.youtube.com/watch?v=dDe0x1S2y64

var speech_dict = {}
var key:String

var path_to_JSON = "res://NPC/Dialouge/Inmate Dialouge - Sheet1.json"

func _ready():
	speech_dict = load_data_from_JSON(path_to_JSON)


func set_current_npc_key(inmate_key):
	key = inmate_key
	print(key)
func get_current_inmate_key():
	return key


func load_data_from_JSON(JSON_path:String):
	if FileAccess.file_exists(JSON_path):
		var file = FileAccess.open(JSON_path, FileAccess.READ)
		var paresedResult = JSON.parse_string(file.get_as_text())
		
		if paresedResult is Dictionary:
			return paresedResult
		else:
			print("error with parsed result")
			
	else:
		print("error opening file")
			



