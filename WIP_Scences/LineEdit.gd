extends LineEdit

var dummy_ID = "77777"
@onready var label = $"../Label"
@onready var access_label = $"../AcessLabel"

var door_access:bool = false
var cur_puzz:String

# Called when the node enters the scene tree for the first time.
func _ready():
	access_label.hide()
	cur_puzz = Global.get_current_puzzle()


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
		var access = true
		open_door(access)
	else:
		var red =  Color(1.0,0.0,0.0,1.0)
		set("theme_override_colors/font_color", red)
		label.show()
		print("denied")
		var denied = false
		open_door(false)


func _on_text_changed(new_text):
	var blue =  Color(0.0,0.0,1.0,1.0)
	set("theme_override_colors/font_color", blue)
	
	
func open_door(door_access):
	Global.handle_door(door_access)
	
	
