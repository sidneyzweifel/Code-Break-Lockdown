extends CanvasLayer

@onready var textbox_container = $TextboxContainer
@onready var label = $TextboxContainer/MarginContainer/Label
@onready var tween = get_tree().create_tween()
func _ready():
	hide_textbox()
	add_text("Rise and shine! It's time for your daily enrichment exercises. Head to the terminal located in the left corner of your room and get started ASAP.")

func hide_textbox():
	label.text = ""
	textbox_container.hide()

func show_textbox():
	textbox_container.show()
	
func add_text(next_text):
	label.visible_ratio = 0
	label.text = next_text
	textbox_container.show()
	while label.visible_characters <=len(next_text):
		if label.visible_characters == -1:
			break
		label.visible_characters += 1
		await get_tree().create_timer(0.02).timeout

	await get_tree().create_timer(5).timeout
	hide_textbox()