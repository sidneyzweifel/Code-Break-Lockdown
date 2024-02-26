extends AcceptDialog

@onready var label_text = $Label

var item_num:int 


func _ready():
	pass # Replace with function body.



func _on_confirmed():
	label_text.text = "Go get me Item #" + str(item_num)
