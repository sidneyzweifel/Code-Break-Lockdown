extends Resource

 ##going to determine the pos and color of door for each inmate npc
@export var inmate:Inmate
@export var loop_door:Door

#var upper_right_corner:Vector2 = Vector2(-800, -800)
#var upper_left_corner:Vector2 = Vector2(800, -800)
#var lower_right_corner:Vector2 = Vector2(-800, 800)
#var lower_left_corner: Vector2 = Vector2(800, 800)
#
#var pos1:Vector2 = Vector2(-1000, 0)
#var pos2:Vector2 = Vector2(0, -100)
#var pos3:Vector2 = Vector2(900, -700)
#
##var pos_array = [upper_right_corner, upper_left_corner, lower_right_corner, lower_left_corner]
#var pos_array = [pos1, pos2, pos3]
#
#var array_cnt:int = pos_array.size()


func _init(inmate_ = null, loop_door_ = null):
	inmate = inmate_
	loop_door = loop_door_

func new(_loop_door):
	loop_door = _loop_door



func set_door_postion(key:String, inmate_pos):
	var scalar = randi() % 3 + 2 #can be at least 3 times away but must be atleast twice as far
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



