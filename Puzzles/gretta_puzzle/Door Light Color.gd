extends ColorRect

var clr = Global.get_door_color()

var greenColor = Color("00e600e0")
var greenHighlight = Color("53ff4ce0")
var greenLightColor = Color("00df00c2")

var redColor = Color("ff0000c2")
var redHighlight = Color("ff8877c2")
var redLightColor = Color("ff0000c2")

var blueColor = Color("0014ffc9")
var blueHighlight = Color("a8c4ff29")
var blueLightColor = Color("0008fac2")

var yellowColor = Color("ffff0bae")
var yellowHighlight = Color("ffff0a57")
var yellowLightColor = Color("ffff3ae4")

var purpleColor = Color("9200ffa6")
var purpleHighlight = Color("ff8877c2")
var purpleLightColor = Color("c900b4")
# Called when the node enters the scene tree for the first time.
func _ready():	
	if clr == "yellow":
		%doorLightColor.set_modulate(yellowColor)
		%highlight.set_modulate(yellowHighlight)
		%highlight2.set_modulate(yellowHighlight)
		%lightGlow.set_color(yellowLightColor)
	elif clr == "green":
		%doorLightColor.set_modulate(greenColor)
		%highlight.set_modulate(greenHighlight)
		%highlight2.set_modulate(greenHighlight)
		%lightGlow.set_color(greenLightColor)
	elif clr == "blue":
		%doorLightColor.set_modulate(blueColor)
		%highlight.set_modulate(blueHighlight)
		%highlight2.set_modulate(blueHighlight)
		%lightGlow.set_color(blueLightColor)
	elif clr == "red":
		%doorLightColor.set_modulate(redColor)
		%highlight.set_modulate(redHighlight)
		%highlight2.set_modulate(redHighlight)
		%lightGlow.set_color(redLightColor)
	elif clr == "purple":
		%doorLightColor.set_modulate(purpleColor)
		%highlight.set_modulate(purpleHighlight)
		%highlight2.set_modulate(purpleHighlight)
		%lightGlow.set_color(purpleLightColor)

