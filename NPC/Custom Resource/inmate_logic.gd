extends Resource


@export var inmate:Inmate
@export var loop_door:Door


func _init(inmate_ = null, loop_door_ = null):
	inmate = inmate_
	loop_door = loop_door_


func set_door_postion(pos:Vector2):
	loop_door.global_position = pos
	
func set_door_color(color:Color):
	loop_door.modulate = color



