extends ColorRect

var clr = "red"

var greenColor = Color(0, 63, 255, .85)
var redColor = Color(0, 0, 0, 0)
var blueColor = Color(0, 0, 255, .85)
var yellowColor = Color(255, 255, 0, .85)
# Called when the node enters the scene tree for the first time.
func _ready():
	if clr == "yellow":
		%doorLightColor.set_modulate(yellowColor)
		#%lightGlow.set_color(yellowColor)
	elif clr == "green":
		%doorLightColor.set_modulate(greenColor)
		#%lightGlow.set_color(yellowColor)
	elif clr == "blue": # doesnt work
		%doorLightColor.set_modulate(blueColor)
		#%lightGlow.set_color(yellowColor)
	elif clr == "red":
		%doorLightColor.set_modulate(redColor)
		#%lightGlow.set_color(yellowColor)

