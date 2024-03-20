extends Resource

 ##going to determine the pos and color of door for each inmate npc
@export var inmate:Inmate
@export var loop_door:Door

var upper_right_corner:Vector2 = Vector2(-800, -800)
var upper_left_corner:Vector2 = Vector2(800, -800)
var lower_right_corner:Vector2 = Vector2(-800, 800)
var lower_left_corner: Vector2 = Vector2(800, 800)

var pos_array = [upper_right_corner, upper_left_corner, lower_right_corner, lower_left_corner]

var array_cnt:int = 4


func _init(inmate_ = null, loop_door_ = null):
	inmate = inmate_
	loop_door = loop_door_

func new(_inmate, _loop_door):
	inmate = _inmate
	loop_door = _loop_door
	set_inmate_pos()

func set_inmate_pos():
	var taken_pos = randi() % pos_array.size()
	inmate.global_position = pos_array[taken_pos]
	pos_array.remove_at(taken_pos)
	array_cnt -= 1
	pos_array.resize(array_cnt)
	return
		


func set_door_postion(key:String):
	match key:
		"inmate_A":
			loop_door.global_position = inmate.global_position - Vector2(200, 200)
		"inmate_B":
			loop_door.global_position = inmate.global_position - Vector2(-400, 0)
		"inmate_C":
			loop_door.global_position = inmate.global_position - Vector2(-50, 400)
		_:
			print("ERROR in set_door_position in inmate_logic.gd")
	
func set_door_color(key:String):
	match key:
		"inmate_A":
			loop_door.modulate = Color(0.576471, 0.439216, 0.858824, 1) #purple
		"inmate_B":
			loop_door.modulate = Color(1, 0.498039, 0.313726, 1) #orange
		"inmate_C":
			loop_door.modulate =  Color(0, 1, 0, 1) #green
		_:
			print("ERROR in set_door_color in inmate_logic.gd")



