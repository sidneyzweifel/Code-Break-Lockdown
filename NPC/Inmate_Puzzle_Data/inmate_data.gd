class_name Inmate_Data extends Node

static var inmate_dic:Dictionary

var inmate_key:String
var button_text:String
var door:Door_Info

func _init(key:String, text:String):
	inmate_key = key
	button_text = text
	door = Door_Info.new()
	add_to_dictionary(inmate_key, self)



	

func add_to_dictionary(key:String, value:Inmate_Data):
	inmate_dic[key] = value 

func get_dict():
	return inmate_dic
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
