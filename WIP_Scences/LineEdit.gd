extends LineEdit

var dummy_ID = "77777"
@onready var label = $"../Label"
@onready var access_label = $"../AcessLabel"

var door_access = 0
var cur_puzz:String

###MAYbe I need another scene to get what I what to do??? 

# Called when the node enters the scene tree for the first time.
func _ready():
	access_label.hide()
	cur_puzz = Global.get_current_puzzle()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_access_status()
	pass



func _on_text_submitted(new_text):
	var access = false
	if new_text == dummy_ID:
		var green =  Color(0.0,1.0,0.0,1.0)
		set("theme_override_colors/font_color", green)
		label.hide()
		access_label.text = "ACCESS GRANTED"
		access_label.show()
		door_access = 1
		#open_door(access)
	else:
		var red =  Color(1.0,0.0,0.0,1.0)
		set("theme_override_colors/font_color", red)
		label.show()
		print("denied")
		door_access = -1
	


func _on_text_changed(new_text):
	var blue =  Color(0.0,0.0,1.0,1.0)
	set("theme_override_colors/font_color", blue)

	

func open_door(access_status):
	Global.handle_door(access_status)
	
func check_access_status():
	match door_access:
		1:
			open_door(true)
		0:
			pass
		-1:
			open_door(false)
	
	


	
