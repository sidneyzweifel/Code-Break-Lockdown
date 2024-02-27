extends Node2D

@onready var popup = $NPCPopup
@onready var button_text = $Button

func _ready():
	button_text.text = "ID: 001"

func _on_button_pressed():
	popup.show()



func _on_npc_popup_confirmed():
	popup.inmate_key = "inmate_C"
