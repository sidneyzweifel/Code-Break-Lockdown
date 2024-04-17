extends ColorRect

var clr = "red"

var greenColor = Color("00e600e0")
var greenLightColor = Color("00df00c2")

var redColor = Color(0, 0, 0, 0)
var redLightColor = Color("ff0000c2")

var blueColor = Color("003bffe0")
var blueLightColor = Color("0008fac2")

var yellowColor = Color("ffff0bae")
var yellowLightColor = Color("ffff3ae4")

var purpleColor = Color("0000ffa6")
var purpleLightColor = Color("c900b4")
# Called when the node enters the scene tree for the first time.
func _ready():
	if clr == "yellow":
		%doorLightColor.set_modulate(yellowColor)
		%lightGlow.set_color(yellowLightColor)
	elif clr == "green":
		%doorLightColor.set_modulate(greenColor)
		%lightGlow.set_color(greenLightColor)
	elif clr == "blue":
		%doorLightColor.set_modulate(blueColor)
		%lightGlow.set_color(blueLightColor)
	elif clr == "red":
		%doorLightColor.set_modulate(redColor)
		%lightGlow.set_color(redLightColor)
	elif clr == "purple":
		%doorLightColor.set_modulate(purpleColor)
		%lightGlow.set_color(purpleLightColor)

