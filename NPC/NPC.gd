class_name Inmate extends Node2D


@onready var button_ = $Button

@export var inmate_key:String
@export var button_text:String


var popup = preload("res://NPC/NPCPopup.tscn")



func _ready():
	button_.text = button_text


func _on_button_pressed():
	var p = popup.instantiate()
	p.get_key(inmate_key)
	add_child(p)
	p.show()



