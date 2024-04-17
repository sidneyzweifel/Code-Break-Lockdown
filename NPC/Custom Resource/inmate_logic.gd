extends Resource

 ##going to determine the pos and color of door for each inmate npc
@export var inmate:Inmate
@export var loop_door:Door


func _init(inmate_ = null, loop_door_ = null):
	inmate = inmate_
	loop_door = loop_door_

func new(_loop_door):
	loop_door = _loop_door



func set_door_postion(key:String, inmate_pos):
	var scalar = 2 
	match key:
		"inmate_A":
			loop_door.global_position = inmate_pos - scalar * Vector2(400, 600)
		"inmate_B":
			loop_door.global_position = inmate_pos - scalar * Vector2(-900, 0)
		"inmate_C":
			loop_door.global_position = inmate_pos - scalar * Vector2(-60, 600)
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



