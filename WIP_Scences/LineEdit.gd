extends LineEdit

var dummy_ID = "77777"
@onready var label = $"../Label"
@onready var access_label = $"../AcessLabel"
# Called when the node enters the scene tree for the first time.
func _ready():
	access_label.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_text_submitted(new_text):
	if new_text == dummy_ID:
		var green =  Color(0.0,1.0,0.0,1.0)
		set("theme_override_colors/font_color", green)
		label.hide()
		access_label.text = "ACCESS GRANTED"
		access_label.show()
		print("access granted")
	else:
		var red =  Color(1.0,0.0,0.0,1.0)
		set("theme_override_colors/font_color", red)
		label.show()
		var blue =  Color(0.0,0.0,1.0,1.0)
		set("theme_override_colors/font_color", blue)
		print("access denied")
