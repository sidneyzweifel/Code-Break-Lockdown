extends Resource

 ##going to determine the pos and color of door for each inmate npc
@export var inmate:Inmate
@export var loop_door:Door




func _init(inmate_ = null, loop_door_ = null):
	inmate = inmate_
	loop_door = loop_door_

func new(_inmate, _loop_door):
	inmate = _inmate
	loop_door = _loop_door
	

func set_door_postion(pos:Vector2):
	if(inmate.inmate_key == "inmate_C"):
		loop_door.global_position = inmate.global_position - Vector2(100, 0)
	
func set_door_color(color:Color):
	loop_door.modulate = color



