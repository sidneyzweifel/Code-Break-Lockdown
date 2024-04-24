class_name Inmate extends Node2D


@onready var button_ = $Button

@export var inmate_key:String
@export var button_text:String


var popup = preload("res://NPC/NPCPopup.tscn")
var item_num = load("res://Puzzles/loops_puzzle/item_number/item_number.gd")

@onready var num_item = Item_Num.new() 
@onready var item_dict = Item_Dict.new()

#set the button text and item num for each inmate
#also set sprite texture based on inmate key
func _ready():
	button_.text = button_text
	item_dict.add_item(inmate_key, num_item.item_num)
	$InmateSprite.texture = load("res://Backgrounds/" + str(inmate_key)+ ".png")
	#$InmateSprite.texture = load("res://Backgrounds/" + "inmate_A"+ ".png")

#when inmate is clicked spawn the dialogue popups
func _on_button_pressed():
	Puzzle4Autoload.inmate_clicked()
	Dialouge.set_current_npc_key(inmate_key)
	var p = popup.instantiate()
	p.get_key(inmate_key) #set key in NPCPopup based on exported key for NPC
	p.get_item_num(num_item.item_num) #set item number based on already random set item num
	add_child(p)
	p.show()
	



