extends Button


@export var col_index:int
@export var row_index:int

func _ready():
	$".".text = "col" + str(col_index) + "\n" + "row" + str(row_index)

func passcode_index_btn():
	$".".add_theme_color_override("font_hover_color", Color(0,1,0,0.5))




