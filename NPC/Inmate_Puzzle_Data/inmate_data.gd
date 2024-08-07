class_name Inmate_Data extends Node2D

static var inmate_dic:Dictionary

var inmate_key:String
var button_text:String
var door:Door_Info_Puz4

#set each of the inmate's data
func _init(key:String, text:String):
	inmate_key = key
	button_text = text
	door = Door_Info_Puz4.new()
	add_to_dictionary(inmate_key, self)

#add all the inmates data to a dict to be used further on
func add_to_dictionary(key:String, value:Inmate_Data):
	inmate_dic[key] = value 

func get_dict():
	return inmate_dic
