extends Node2D

@onready var popup = $NPCPopup
@onready var button_text = $Button


func _on_button_pressed():
	popup.show()



func _on_npc_popup_confirmed():
	button_text.text = "WHAT ITEM?"
